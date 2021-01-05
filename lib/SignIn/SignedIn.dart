import 'package:flutter/material.dart';

class SignedIn extends StatefulWidget {
  num screenWidth;
  num screenHeight;

  SignedIn(this.screenWidth, this.screenHeight);

  @override
  _SignedInState createState() => _SignedInState();
}

class _SignedInState extends State<SignedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text(
          "Hello World",
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.5,
            fontSize: widget.screenWidth * 0.06,
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
