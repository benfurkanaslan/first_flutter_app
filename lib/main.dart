import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        primarySwatch: Colors.blue,
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

  final String wallPaper = "https://wallpaperaccess.com/full/1188166.png";

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: screenWidth * 0.01,
        title: Text(
          "Hello World",
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
            color: const Color(808080),
            image: DecorationImage(
              image: NetworkImage(wallPaper),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Spacer(flex: 25),
              SizedBox(
                width: screenWidth * 0.7,
                child: TextField(
                  controller: userNameController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.account_circle),
                    labelText: "User Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.01),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 10),
              SizedBox(
                width: screenWidth * 0.7,
                child: TextField(
                  controller: passwordController,
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
                  decoration: InputDecoration(
                    icon: Icon(Icons.security),
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(screenWidth * 0.01),
                    ),
                  ),
                ),
              ),
              Spacer(flex: 10),
              ButtonBar(
                children: [
                  MaterialButton(
                    onPressed: () {},
                    child: Text(
                      "Forgot My Password",
                      style: TextStyle(color: Colors.blue[900]),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignedIn(
                              screenWidth, screenHeight, userName, password),
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
              Spacer(
                flex: 55,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
