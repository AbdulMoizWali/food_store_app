import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:food_store/l10n/l10n.dart';
import 'package:food_store/routes/route_generator.dart';
import 'package:food_store/theme/theme_builder.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return ScreenUtilInit(
      designSize: const Size(393, 852),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
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
        );
      },
    );
  }
}
