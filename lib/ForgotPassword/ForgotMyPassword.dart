import 'package:flutter/material.dart';

class ForgotMyPassword extends StatefulWidget {
  @override
  _ForgotMyPasswordState createState() => _ForgotMyPasswordState();
}

class _ForgotMyPasswordState extends State<ForgotMyPassword> {
  @override
  Widget build(BuildContext context) {
    var eMailController = TextEditingController();
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
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
        backgroundColor: Colors.grey,
        elevation: screenWidth * 0.01,
        title: Text(
          "Tap&Talk",
          style: TextStyle(
              fontSize: screenWidth * 0.06,
              letterSpacing: screenWidth * 0.003,
              wordSpacing: screenWidth * 0.01,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: screenWidth * 0.7,
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
                height: screenHeight * 0.1,
              ),
              MaterialButton(
                color: Colors.blue[300],
                onPressed: () {},
                child: Text(
                  "Send Me an E-mail",
                  style: TextStyle(color: Colors.blue[900]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
