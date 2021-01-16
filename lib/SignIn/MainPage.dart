import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MainPage extends StatefulWidget {
  num screenWidth;
  num screenHeight;
  String userName;
  String password;
  String birthDate;
  var color;

  MainPage({@required this.screenWidth, @required this.screenHeight, @required this.userName, @required this.password, @required this.color, @required this.birthDate});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Main Page"),
            widget.userName.isEmpty ? null : Text("User Name  : ${widget.userName}"),
            widget.password.isEmpty ? null : Text("Password : ${widget.password}"),
            widget.birthDate.isEmpty ? null : Text("Birth Day : ${widget.birthDate}"),
          ],
        ),
      ),
    );
  }
}
