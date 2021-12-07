import 'package:flutter/material.dart';
import '../globals.dart' as globals;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                  child: Container(
                      width: 200,
                      height: 150,
                      child: const Image(
                          image: AssetImage('assets/images/logo.png')))),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email id as abc@xyz.com'),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 8.0),
              child: TextField(
                obscureText: true,
                controller: _passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password'),
              ),
            ),
            TextButton(
              onPressed: () {
                //forgot password
              },
              child: const Text(
                'Forgot Password',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
            Container(
              height: 50,
              width: 250,
              margin: const EdgeInsets.only(top: 12.0),
              padding: const EdgeInsets.only(top: 5.0),
              decoration: BoxDecoration(
                  color: Colors.deepPurple[400],
                  borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () {
                  if (_emailController.text == "s" &&
                      _passwordController.text == "s") {
                    DateTime now = DateTime.now();
                    globals.isLoggedIn = true;
                    globals.time = now;
                    Navigator.pushNamed(context, '/camera');
                  } else {
                    AlertDialog(title: Text('Incorrect Password'));
                  }
                  // Navigator.push(
                  //     context, MaterialPageRoute(builder: (_) => HomePage()));
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
            const Text('New User? Create Account')
          ],
        ),
      ),
    );
  }
}
