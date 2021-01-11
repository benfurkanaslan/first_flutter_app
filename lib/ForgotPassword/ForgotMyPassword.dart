import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgotMyPassword extends StatefulWidget {
  num screenHeight;
  num screenWidth;
  var color;

  ForgotMyPassword({this.screenHeight, this.screenWidth, this.color});

  @override
  _ForgotMyPasswordState createState() => _ForgotMyPasswordState();
}

class _ForgotMyPasswordState extends State<ForgotMyPassword> {
  var eMailController = TextEditingController();
  String eMail;

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
        backgroundColor: widget.color,
        elevation: widget.screenWidth * 0.01,
        title: Text(
          "Tap&Talk",
          style: TextStyle(
              fontSize: widget.screenWidth * 0.06,
              letterSpacing: widget.screenWidth * 0.003,
              wordSpacing: widget.screenWidth * 0.01,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.screenWidth * 0.7,
              child: TextField(
                controller: eMailController,
                decoration: InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: "E-mail",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: widget.screenHeight * 0.1,
            ),
            MaterialButton(
              enableFeedback: true,
              color: Theme.of(context).primaryColor,
              onPressed: () {
                eMail = eMailController.text;
                setState(() {});
              },
              child: Text(
                "Send Me an E-mail",
                style: TextStyle(color: Colors.blue[900]),
              ),
            ),
            SizedBox(
              height: widget.screenHeight * 0.05,
            ),
            Text(
              (() {
                return eMail == null ? "" : "E-mail has sent to $eMail";
              }()),
            ),
          ],
        ),
      ),
    );
  }
}
