import 'package:flutter/material.dart';
import 'package:quiz_covid19/pages/Username.dart';
import 'package:quiz_covid19/pages/register_page.dart';

class Login extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _usernameController;
  TextEditingController _emailController;
  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);

    final logo = Image.asset(
      "assets/User.png",
      height: mq.size.height / 4,
    );

    final usernameField = TextFormField(
      controller: _usernameController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "John Doe",
        labelText: "Username",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final emailField = TextFormField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "something@example.com",
        labelText: "Email",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final passwordField = TextFormField(
      controller: _passwordController,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        hintText: "password",
        labelText: "Password",
        labelStyle: TextStyle(
          color: Colors.white,
        ),
        hintStyle: TextStyle(
          color: Colors.white,
        ),
      ),
    );

    final fields = Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          usernameField,
          emailField,
          passwordField,
        ],
      ),
    );

    final loginButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25.0),
      color: Colors.white,
      child: MaterialButton(
          minWidth: mq.size.width / 1.2,
          padding: EdgeInsets.fromLTRB(10.0, 15.0, 10.0, 15.0),
          child: Text(
            "Login",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () async {
            Navigator.push(context,
                new MaterialPageRoute(builder: (context) => new Usuario()));
          }),
    );

    final bottom = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        loginButton,
        Padding(
          padding: EdgeInsets.all(8.0),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Forgot your password?",
              style: Theme.of(context).textTheme.subtitle1.copyWith(
                    color: Colors.white,
                  ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                        builder: (context) => new Register()));
              },
              child: Text(
                "Register",
                style: Theme.of(context).textTheme.subtitle1.copyWith(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
      ],
    );

    return Scaffold(
      backgroundColor: Color(0xff8c52ff),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: EdgeInsets.all(36),
          child: Container(
            height: mq.size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                logo,
                fields,
                Padding(
                  padding: EdgeInsets.only(bottom: 150),
                  child: bottom,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
