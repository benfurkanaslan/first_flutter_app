import 'package:flutter/material.dart';

class SignedIn extends StatefulWidget {
  @override
  _SignedInState createState() => _SignedInState();
}

class _SignedInState extends State<SignedIn> {
  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Hello World",
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Signed In")],
        ),
      ),
    );
  }
}
