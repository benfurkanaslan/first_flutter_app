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

  @override
  Widget build(BuildContext context) {
    var screenInfo = MediaQuery.of(context);
    final screenWidth = screenInfo.size.width;
    final screenHeight = screenInfo.size.height;
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 5,
        title: Text(
          "Hello World",
          style: TextStyle(
              fontSize: screenWidth * 0.06,
              letterSpacing: 1.5,
              color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 25),
            SizedBox(
              width: screenWidth * 0.7,
              child: TextField(
                decoration: InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: "User Name",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Spacer(flex: 10),
            SizedBox(
              width: screenWidth * 0.7,
              child: TextField(
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                decoration: InputDecoration(
                  disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.blue)),
                  icon: Icon(Icons.security),
                  labelText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(3),
                    borderSide: BorderSide(),
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignedIn()));
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
    );
  }
}
