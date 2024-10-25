import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/user/repository/user_repository.dart';
import 'package:food_store/authentication/bloc/authentication_bloc.dart';
import 'package:food_store/authentication/repository/authentication_repository.dart';
import 'package:food_store/l10n/l10n.dart';
import 'package:food_store/login/api/login_api.dart';
import 'package:food_store/routes/route_generator.dart';
import 'package:food_store/routes/route_path.dart';
import 'package:food_store/signup/api/signup_api.dart';
import 'package:food_store/theme/theme_builder.dart';
import 'package:food_store/utilities/logger/logger.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository(
      loginApi: LoginApi(),
      signupApi: SignupApi(),
    );
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>.value(
          value: _authenticationRepository,
        ),
        RepositoryProvider<UserRepository>.value(
          value: _userRepository,
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
          authenticationRepository: _authenticationRepository,
          userRepository: _userRepository,
        )..add(AuthenticationSubscriptionRequested()),
        child: const AppWiew(),
      ),
    );
  }
}

class AppWiew extends StatefulWidget {
  const AppWiew({
    super.key,
  });

  @override
  State<AppWiew> createState() => _AppWiewState();
}

class _AppWiewState extends State<AppWiew> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: _navigatorKey,
          title: 'Food Store',
          debugShowCheckedModeBanner: false,
          theme: ThemeBuilder.buildTheme(context, Brightness.dark),
          // theme: ThemeData(
          //   appBarTheme: AppBarTheme(
          //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          //   ),
          //   useMaterial3: true,
          // ),
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          // home: const CounterPage(),
          onGenerateRoute: RoutesGenerator.onGenerateRoute,
          builder: (context, child) {
            return BlocListener<AuthenticationBloc, AuthenticationState>(
              listener: (context, state) {
                logger.i('Authentication state: $state');
                switch (state.status) {
                  case AuthenticationStatus.authenticated:
                    _navigator.pushNamedAndRemoveUntil(
                      RoutePath.home,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unauthenticated:
                    _navigator.pushNamedAndRemoveUntil(
                      RoutePath.login,
                      (route) => false,
                    );
                    break;
                  case AuthenticationStatus.unknown:
                  case AuthenticationStatus.initial:
                    break;
                }
              },
              child: child,
            );
          },
        );
      },
    );
  }
}
