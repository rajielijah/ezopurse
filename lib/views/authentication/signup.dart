import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/model/core/register_model.dart';
import 'package:ezopurse/model/services/register_api.dart';
import 'package:ezopurse/model/services/validator.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

var provide;
class SignUp extends StatefulWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = new GlobalKey<FormState>();

  String _firstName,
      _lastName,
      _email,
      _password,
      _confirmPassword;
bool  _terms;
  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      validator: validateEmail,
      onSaved: (value) => _email = value,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
      ),
    );

    final firstNameField = TextFormField(
      autofocus: false,
      maxLines: 1,
      onSaved: (value) => _firstName = value,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
      ),
    );

    final lastNameField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      onSaved: (value) => _lastName = value,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
      ),
    );
    // final phoneNumber = TextFormField(
    //   autofocus: false,
    //   // obscureText: true,
    //   validator: (value) =>
    //       value.isEmpty ? "Please enter a Valid Phone Number" : null,
    //   maxLines: 1,
    //   minLines: 1,
    //   onSaved: (value) => _phoneNumber = value,
    //   decoration: InputDecoration(
    //     contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
    //     enabledBorder:
    //         OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
    //   ),
    // );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      maxLines: 1,
      minLines: 1,
      onSaved: (value) => _password = value,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
      ),
    );

    final repeatPasswordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      maxLines: 1,
      onSaved: (value) => _password = value,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
      ),
    );

    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );
    var doRegister = (var provide) {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        RegisterProvider()
            .register(
                _firstName, _lastName, _email, _password, _confirmPassword, _terms)
            .then((response) {
          print('we want to know $response');
          if (response['status']) {
            Register register = response['data'];
            print('we are the $register');
            // Provider.of<UserProvider>(context, listen: false).setUser(user);
            Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
            print(response['status']);
          } else {
            Flushbar(
              title: "Registration Failed",
              message:
                  response[1]['message'],
              duration: Duration(seconds: 5),
            ).show(context);
          }
        });
      } else {
        Flushbar(
          title: "Invalid form",
          message: "Please Complete the form properly",
          duration: Duration(seconds: 5),
        ).show(context);
      }
    };

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => RegisterProvider())
          ],
          child: Builder(
            builder: (context){
              provide = Provider.of<RegisterProvider>(context);
            return  SingleChildScrollView(
              child: Container(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
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
                              style: TextStyle(color: kPrimaryColor, fontSize: 15),
                            )
                          ],
                        ),
                      ),
                      // SizedBox(
                      //   height: 30,
                      // ),
                      Container(
                        width: width,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Email Address',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    EmailField,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              Text('First Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    firstNameField,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              Text('Last Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    lastNameField,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              // Text('Phone Number',
                              //     style: TextStyle(
                              //         fontWeight: FontWeight.bold, fontSize: 15)),
                              // Container(
                              //   decoration: BoxDecoration(
                              //     borderRadius: BorderRadius.circular(10),
                              //     color: Colors.white,
                              //   ),
                              //   padding: EdgeInsets.only(top: 10),
                              //   child: Column(
                              //     children: [
                              //       phoneNumber,
                              //     ],
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: height / 40,
                              // ),
                              Text('Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    passwordField,
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: height / 40,
                              ),
                              Text('Confirm Password',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                padding: EdgeInsets.only(top: 10),
                                child: Column(
                                  children: [
                                    repeatPasswordField,
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 10,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
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
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      FlatButton(
                        minWidth: 330,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        onPressed: () {
                          doRegister;
                        },
                        child:
                            RegisterProvider().loggedInStatus == Status.Authenticating
                                ? loading
                                : MaterialButton(
                                    onPressed: () {
                                      // ignore: unnecessary_statements
                                      doRegister(provide);
                                    },
                                    child: Text(
                                      'Sign Up',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                        color: kPrimaryColor,
                      ),
                      // color: kPrimaryColor,
                
                      // SizedBox(
                      //   height: height/40,
                      // ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Row(
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
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
            }),
        ),
      ),
    );
  }
}
