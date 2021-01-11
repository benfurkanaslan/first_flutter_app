import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/ForgotPassword/ForgotMyPassword.dart';
import 'package:flutter_app/SignIn/SignedIn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
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
  String userName;
  String password;
  bool rememberPassword = false;
  var color = Colors.blueGrey;

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;
    return Scaffold(
      backgroundColor: color,
      appBar: AppBar(
        backgroundColor: color,
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
            color: color,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "lib/assets/app-logo.png",
                  width: screenWidth * 0.3,
                ),
                SizedBox(height: screenHeight * 0.1),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: TextField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      icon: Icon(Icons.account_box),
                      labelText: "User Name",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.05,
                ),
                SizedBox(
                  width: screenWidth * 0.7,
                  child: TextField(
                    controller: passwordController,
                    obscureText: true,
                    enableSuggestions: false,
                    autocorrect: false,
                    decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.1,
                ),
                SizedBox(
                  width: screenWidth,
                  child: ButtonBar(
                    children: [
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ForgotMyPassword(
                                screenHeight: screenHeight,
                                screenWidth: screenWidth,
                                color: color,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Forgot My Password",
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                      ),
                      MaterialButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignedIn(
                                screenWidth: screenWidth,
                                screenHeight: screenHeight,
                                userName: userName,
                                password: password,
                                color: color,
                              ),
                            ),
                          );
                          userName = userNameController.text;
                          password = passwordController.text;
                        },
                        child: Text(
                          "Sign In",
                          style: TextStyle(color: Colors.blue[900]),
                        ),
                      ),
                    ],
                  ),
                ),
                CheckboxListTile(
                  title: Text("Remember Password"),
                  controlAffinity: ListTileControlAffinity.leading,
                  value: rememberPassword,
                  onChanged: (bool passwordRememberOn) {
                    setState(() {
                      rememberPassword = passwordRememberOn;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
