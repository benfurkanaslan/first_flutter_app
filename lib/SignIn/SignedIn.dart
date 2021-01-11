import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignedIn extends StatefulWidget {
  num screenWidth;
  num screenHeight;
  String userName;
  String password;
  var color;

  SignedIn(
      {this.screenWidth,
      this.screenHeight,
      this.userName,
      this.password,
      this.color});

  @override
  _SignedInState createState() => _SignedInState();
}

class _SignedInState extends State<SignedIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: widget.screenWidth * 0.01,
        backgroundColor: widget.color,
        title: Text(
          "Tap&Talk",
          style: TextStyle(
            color: Colors.black,
            letterSpacing: widget.screenWidth * 0.003,
            wordSpacing: widget.screenWidth * 0.01,
            fontSize: widget.screenWidth * 0.06,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed In"),
            Text("User Name  : ${widget.userName}"),
            Text("Password : ${widget.password}"),
          ],
        ),
      ),
    );
  }
}
