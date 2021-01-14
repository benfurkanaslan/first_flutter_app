import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ForgotPassword/ForgotMyPassword.dart';
import 'package:flutter_app/SignIn/MainPage.dart';
import 'package:flutter_app/SignUp/SignUpPage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      title: 'Tap&Talk',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  var userNameController = TextEditingController();
  var passwordController = TextEditingController();
  var dateTimePickerController = TextEditingController();
  String userName;
  String password;
  String birthDate;
  bool rememberPassword = false;
  var color = Colors.blueGrey;
  var scaffoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: color,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.black87,
            ),
            onPressed: () {
              scaffoldKey.currentState.showSnackBar(SnackBar(
                content: Text('Helped'),
              ));
            },
          ),
        ],
        backgroundColor: color,
        elevation: 0.0,
        centerTitle: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Tap&Talk',
              style: TextStyle(fontSize: screenWidth * 0.06, letterSpacing: screenWidth * 0.003, wordSpacing: screenWidth * 0.01, color: Colors.black),
            ),
            Text(
              'with someone you never knew',
              style: TextStyle(fontSize: screenWidth * 0.04, letterSpacing: screenWidth * 0.0, wordSpacing: screenWidth * 0.01, color: Colors.black87),
            ),
          ],
        ),
      ),
      body: Center(child: Padding(padding: EdgeInsets.all(screenWidth * 0.02), child: buildSignInPage(screenWidth, screenHeight, context))),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.account_circle),
        label: Text('Sign Up', style: TextStyle(fontSize: screenWidth * 0.038)),
        elevation: 0.0,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
                color: color,
              ),
            ),
          );
        },
      ),
    );
  }

  Card buildSignInPage(double screenWidth, double screenHeight, BuildContext context) {
    return Card(
      color: Colors.transparent,
      elevation: 50.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(screenWidth * 0.1)),
      child: Container(
        alignment: Alignment.center,
        height: screenHeight,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenWidth * 0.1), color: Colors.blueGrey[300]),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/app-logo.png',
                width: screenWidth * 0.3,
              ),
              SizedBox(height: screenHeight * 0.05),
              Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenWidth * 0.05), color: Colors.black12),
                        child: TextFormField(
                          controller: userNameController,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.account_box),
                            labelText: 'User Name',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                          ),
                          validator: (value) {
                            return value.isEmpty ? '*Please Enter Your User Name' : null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(screenWidth * 0.05), color: Colors.black12),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(screenWidth * 0.05)),
                          ),
                          validator: (value) {
                            return value.isEmpty ? '*Please Enter Your Password' : null;
                          },
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    SizedBox(
                      width: screenWidth * 0.7,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.zero, bottomRight: Radius.zero, topLeft: Radius.circular(screenWidth * 0.05), topRight: Radius.circular(screenWidth * 0.05)),
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
                              borderRadius: BorderRadius.only(topRight: Radius.circular(screenWidth * 0.05), topLeft: Radius.circular(screenWidth * 0.05)),
                            ),
                          ),
                          onTap: () {
                            showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1950), lastDate: DateTime.now()).then((value) {
                              dateTimePickerController.text = '${value.month}/${value.day}/${value.year}';
                            });
                          },
                          validator: (value) {
                            return value.isEmpty ? '*Please Enter Your Birth Date' : null;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              SizedBox(
                width: screenWidth,
                child: ButtonBar(
                  children: [
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 0.0,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotMyPassword(screenHeight: screenHeight, screenWidth: screenWidth, color: color),
                          ),
                        );
                      },
                      child: Text('Forgot My Password', style: TextStyle(color: Colors.blue[900], fontSize: screenWidth * 0.038)),
                    ),
                    MaterialButton(
                      color: Theme.of(context).primaryColor,
                      elevation: 0.0,
                      onPressed: () {
                        bool controlled = formKey.currentState.validate();
                        controlled == true
                            ? Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MainPage(screenWidth: screenWidth, screenHeight: screenHeight, userName: userName, password: password, birthDate: birthDate, color: color),
                                ),
                              )
                            : scaffoldKey.currentState.showSnackBar(SnackBar(content: Text('Enter Empty Areas')));
                        userName = userNameController.text;
                        password = passwordController.text;
                        birthDate = dateTimePickerController.text;
                      },
                      child: Text('Sign In', style: TextStyle(color: Colors.blue[900], fontSize: screenWidth * 0.038)),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: screenWidth * 0.717,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                  ),
                  child: CheckboxListTile(
                    secondary: Icon(Icons.security),
                    title: Text(
                      'Remember Password',
                      style: TextStyle(fontSize: screenWidth * 0.04),
                    ),
                    controlAffinity: ListTileControlAffinity.leading,
                    value: rememberPassword,
                    onChanged: (bool passwordRememberOn) {
                      setState(() {
                        rememberPassword = passwordRememberOn;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
