import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class SignUp extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration(
        "Email",
      ),
    );

    final firstNameField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration(
        "First Name",
      ),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      decoration: buildInputDecoration(
        "Last Name",
      ),
    );
    final phoneNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      validator: (value) =>
          value.isEmpty ? "Please enter a Valid Phone Number" : null,
      decoration: buildInputDecoration(
        "Phone Number",
      ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      decoration: buildInputDecoration(
        "Password",
      ),
    );

    final repeatPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      decoration: buildInputDecoration(
        "Repeat Password",
      ),
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                          )),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Create an account',
                        style: TextStyle(color: kPrimaryColor),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        EmailField,
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        firstNameField,
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        lastNameField,
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        phoneNumber,
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        passwordField,
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height / 40,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        repeatPasswordField,
                        Padding(
                          padding: const EdgeInsets.only(left: 20.0, right: 20),
                          child: Divider(
                            color: Colors.black,
                            thickness: 0.7,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.check_box,
                        color: kPrimaryColor,
                      ),
                      Text(
                        'I accept Terms & Conditions',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  FlatButton(
                    minWidth: 330,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Login()));
                    },
                    child: Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: kPrimaryColor,
                  ),
                  SizedBox(
                    height: height/40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Have an Account?',
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          child: Text('Sign in'),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Login()));
                          })
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
