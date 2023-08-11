import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      children: [
        SizedBox(
          width: screenWidth - 30,
          height: screenWidth - 30,
          child: CircularProgressIndicator(
            strokeWidth: 20,
            color: Colors.green[900],
          ),
        ),
        SizedBox(
            width: screenWidth - 30,
            height: screenWidth - 30,
            child: Image.asset('assets/images/child.png')),
      ],
    );
  }
}
