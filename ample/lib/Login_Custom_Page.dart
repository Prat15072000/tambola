import 'package:flutter/material.dart';

// Assets folder needs to be created with the images

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email, password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/back.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 28.0, right: 28.0),
                child: Material(
                  elevation: 24.0,
                  color: Colors.grey[400].withOpacity(0.5),
                  shadowColor: Colors.black54.withOpacity(0.5),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 50.0, left: 40.0, right: 40.0),
                        child: TextField(
                          onChanged: (value) {
                            email = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'E-Mail',
                            hintStyle:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0, right: 40.0),
                        child: TextField(
                          onChanged: (value) {
                            password = value;
                          },
                          obscureText: true,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            hintStyle:
                                TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Padding(
                        padding: const EdgeInsets.only(left: 228.0),
                        child: InkWell(
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.blue),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 60.0, right: 60.0),
                        child: Container(
                          height: 50.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            color: Colors.red[300],
                            elevation: 7.0,
                            child: GestureDetector(
                              onTap: () async {
                                // Navigator.pushNamed(context, 'intro');
                              },
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Center(
                        child: Text(
                          'or',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/goo.png'),
                            ),
                            CircleAvatar(
                              radius: 30.0,
                              backgroundImage: AssetImage('images/fb.png'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              InkWell(
                child: Text(
                  'New User?',
                  style: TextStyle(fontSize: 15.0, color: Colors.blue),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 90.0, right: 90.0),
                child: Container(
                  height: 50.0,
                  child: Material(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.teal,
                    elevation: 7.0,
                    child: GestureDetector(
                      onTap: () async {
                        // Navigator.pushNamed(context, 'intro');
                      },
                      child: Center(
                        child: Text(
                          'Sign Up',
                          style: TextStyle(color: Colors.white, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
