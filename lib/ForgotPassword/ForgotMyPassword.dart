import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ForgotMyPassword extends StatefulWidget {
  num screenHeight;
  num screenWidth;
  var color;

  ForgotMyPassword(
      {@required this.screenHeight,
      @required this.screenWidth,
      @required this.color});

  @override
  _ForgotMyPasswordState createState() => _ForgotMyPasswordState();
}

class _ForgotMyPasswordState extends State<ForgotMyPassword> {
  var eMailController = TextEditingController();
  String eMail;
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
        elevation: 0.0,
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
        child: Padding(
          padding: EdgeInsets.all(widget.screenWidth * 0.02),
          child: Container(
            height: widget.screenHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.screenWidth * 0.1),
              color: Colors.black12,
            ),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: widget.screenWidth * 0.7,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(widget.screenWidth * 0.05),
                        color: Colors.black12,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: eMailController,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: "E-mail",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                                widget.screenWidth * 0.05),
                          ),
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
                      eMail.isNotEmpty
                          ? scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("E-mail has sent to $eMail"),
                            ))
                          : scaffoldKey.currentState.showSnackBar(SnackBar(
                              content: Text("Enter an E-mail"),
                            ));
                    },
                    child: Text(
                      "Send Me an E-mail",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                  SizedBox(
                    height: widget.screenHeight * 0.05,
                  ),
                  eMail?.isEmpty ?? true
                      ? Text("")
                      : Text("E-mail has sent to $eMail"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
