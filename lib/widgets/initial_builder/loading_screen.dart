import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(color: Colors.green[100]),
          child: Center(
            child: Stack(
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
            ),
          ),
        ),
      ),
    );
  }
}
