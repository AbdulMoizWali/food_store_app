import 'package:flutter/material.dart';

class TopLeftBackground extends StatelessWidget {
  const TopLeftBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(colors: [])),
          )
        ],
      ),
    );
  }
}
