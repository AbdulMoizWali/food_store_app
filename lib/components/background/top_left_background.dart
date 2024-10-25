import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopLeftBackground extends StatelessWidget {
  const TopLeftBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          width: 1.sw,
          height: 1.sh,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.topLeft,
                tileMode: TileMode.decal,
                radius: 2,
                colors: [
                  Color.fromARGB(255, 69, 42, 189),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        Positioned(
          width: 1.sw,
          height: 1.sh,
          child: Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                tileMode: TileMode.decal,
                radius: 2,
                colors: [
                  Color.fromARGB(255, 69, 42, 189),
                  Colors.transparent,
                ],
              ),
            ),
          ),
        ),
        // Positioned(
        //   bottom: (1.sh / 3),
        //   right: (1.sw / 2),
        //   width: 1.sw,
        //   height: 1.sh,
        //   child: Container(
        //     decoration: const BoxDecoration(
        //       gradient: RadialGradient(
        //         tileMode: TileMode.decal,
        //         radius: 1,
        //         colors: [
        //           Color(0xFF312370),
        //           Colors.transparent,
        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        Positioned(
          width: 1.sw,
          height: 1.sh,
          child: SafeArea(
            child: child,
          ),
        ),
      ],
    );
  }
}
