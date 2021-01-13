import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class SignUp extends StatefulWidget {
  var color;
  num screenHeight;
  num screenWidth;

  SignUp(
      {@required this.color,
      @required this.screenHeight,
      @required this.screenWidth});

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var formKey = GlobalKey<FormState>();
  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var dateTimePickerController = TextEditingController();
  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0.0,
        title: Text(
          'Tap&Talk',
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
            alignment: Alignment.center,
            height: widget.screenHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(widget.screenWidth * 0.1),
              color: Colors.black12,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/assets/app-logo.png',
                    width: widget.screenWidth * 0.3,
                  ),
                  SizedBox(height: widget.screenHeight * 0.05),
                  Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          width: widget.screenWidth * 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  widget.screenWidth * 0.05),
                              color: Colors.black12,
                            ),
                            child: TextFormField(
                              controller: userNameController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.account_box),
                                labelText: 'User Name',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      widget.screenWidth * 0.05),
                                ),
                              ),
                              validator: (value) {
                                return value.isEmpty
                                    ? '*Please Enter Your User Name'
                                    : null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: widget.screenHeight * 0.03,
                        ),
                        SizedBox(
                          width: widget.screenWidth * 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                  widget.screenWidth * 0.05),
                              color: Colors.black12,
                            ),
                            child: TextFormField(
                              controller: passwordController,
                              obscureText: true,
                              enableSuggestions: false,
                              autocorrect: false,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.lock),
                                labelText: 'Password',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(
                                      widget.screenWidth * 0.05),
                                ),
                              ),
                              validator: (value) {
                                return value.isEmpty
                                    ? '*Please Enter Your Password'
                                    : null;
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: widget.screenHeight * 0.03,
                        ),
                        SizedBox(
                          width: widget.screenWidth * 0.7,
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.zero,
                                bottomRight: Radius.zero,
                                topLeft:
                                    Radius.circular(widget.screenWidth * 0.05),
                                topRight:
                                    Radius.circular(widget.screenWidth * 0.05),
                              ),
                              color: Colors.black12,
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.datetime,
                              controller: dateTimePickerController,
                              decoration: InputDecoration(
                                helperText: '''Users are matched by age,
Please enter your birth date correctly.''',
                                hintText: 'mm/dd/yyyy',
                                prefixIcon: Icon(Icons.date_range),
                                labelText: 'Birth Date',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                        widget.screenWidth * 0.05),
                                    topLeft: Radius.circular(
                                        widget.screenWidth * 0.05),
                                  ),
                                ),
                              ),
                              onTap: () {
                                showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(1950),
                                        lastDate: DateTime.now())
                                    .then((value) {
                                  dateTimePickerController.text =
                                      '${value.month}/${value.day}/${value.year}';
                                });
                              },
                              validator: (value) {
                                return value.isEmpty
                                    ? '*Please Enter Your Birth Date'
                                    : null;
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widget.screenHeight * 0.05),
                  SizedBox(
                    width: widget.screenWidth,
                    child: ButtonBar(
                      children: [
                        MaterialButton(
                          color: Theme.of(context).primaryColor,
                          onPressed: () {
                            bool controlled = formKey.currentState.validate();
                            controlled == true
                                ? scaffoldKey.currentState
                                    .showSnackBar(SnackBar(
                                    content: Text('Signed Up'),
                                  ))
                                : scaffoldKey.currentState
                                    .showSnackBar(SnackBar(
                                    content: Text('Enter Empty Areas'),
                                  ));
                          },
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.blue[900]),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
