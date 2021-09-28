import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/model/core/login_model.dart';
// import 'package:ezopurse/model/core/login_model.dart';
import 'package:ezopurse/model/services/login_api.dart';
import 'package:ezopurse/model/services/validator.dart';
import 'package:ezopurse/views/authentication/forgotPassword.dart';
import 'package:ezopurse/views/authentication/signup.dart';
import 'package:ezopurse/views/splashscreen.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var provideris;

class Login extends StatefulWidget {
  // const Loginin({ Key? key }) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = new GlobalKey<FormState>();
  bool agree = false;
  bool agre = false;
  String _email, _password;


  @override 
  void initState(){
    agree;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      autofocus: false,
      maxLines: 1,
      validator: validateEmail,
      onSaved: (value) => _email = value,
      minLines: 1,
      decoration: InputDecoration(
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        errorBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                new BorderSide(color: Colors.black, style: BorderStyle.solid)),
        enabledBorder: OutlineInputBorder(
            borderSide:
                new BorderSide(color: Colors.black, style: BorderStyle.solid)),
      ),
    );
    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      onSaved: (value) => _password = value,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
        errorBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderSide:
                new BorderSide(color: Colors.black, style: BorderStyle.solid)),
        contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
        enabledBorder:
            OutlineInputBorder(borderSide: new BorderSide(color: Colors.black)),
      ),
    );
    var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Authenticating ... Please wait")
      ],
    );
    bool isloginning = false;
    var doLogin = (BuildContext context, var provide) {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        // provide.checkloginactivity(true);
        // FocusScope.of(context).unfocus();

        //  LoginProvider().login(_email, _password).then((responseData)
        //  successfulMessage.then((responseData)
        //
        Provider.of<LoginProvider>(context, listen: false)
            .login(_email, _password)
            .then((responseData) {
          print(' we are there $responseData');
          if (responseData['status']) {
            LoginModel login = responseData['user'];
            // Provider.of<LoginProvider>(context, listen: false).logins;
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => MyStatefulWidget()));
            print(responseData['terms']);
            provide.checkloginactivity(false);
          } else {
            Flushbar(
              title: "Failed Login",
              routeColor: kPrimaryColor,
              backgroundColor: kPrimaryColor,
              message: "Incorrect Email/Password",
              duration: Duration(seconds: 5),
            ).show(context);
            print('error!');
            provide.checkloginactivity(false);
          }
        }).catchError((e) {
          print("babe $e");
        });
      } else {
        print("form is invalid");
        provide.checkloginactivity(false);
      }
    };
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
      ],
      child: Builder(builder: (context) {
        provide = Provider.of<LoginProvider>(context);
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  height: height,
                  width: width,
                  child: Form(
                    key: formKey,
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
                                  Icons.arrow_back_ios,
                                )),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Kindly login to your account',
                                style: TextStyle(
                                    color: kPrimaryColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500))
                          ],
                        ),
                        Container(
                          height: 220,
                          width: 343,
                          decoration: BoxDecoration(
                              // color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Image(
                            image: AssetImage('images/61.png'),
                          ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: width,
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Email',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          EmailField,
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: height / 40,
                                    ),
                                    Text('Password',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    Container(
                                      color: Colors.white,
                                      padding: EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          passwordField,
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.start,

                              children: [
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  ForgotPassword()));
                                    },
                                    child: Text(
                                      'Forget Password?',
                                      style: TextStyle(color: kPrimaryColor),
                                    )),
                                SizedBox(
                                  width: width / 10,
                                ),
                                Text(
                                  "Don't Have an account?",
                                  style: TextStyle(color: Colors.black),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SignUp()));
                                  },
                                  child: Text(
                                    'Sign Up',
                                    style: TextStyle(color: kPrimaryColor),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        LoginProvider().loggedInStatus == Status.Authenticating
                            ? loading
                            : FlatButton(
                                minWidth: 330,
                                height: 50,
                                color: kPrimaryColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  doLogin(context, provideris);
                                  setState(() {
                                    agree = agree ?  false: true;
                                  });
                                },
                                textColor: kPrimaryColor,
                                child: agree
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            Text(
                                              "Please Wait",
                                              style: TextStyle(
                                                  fontFamily: 'Helvetica',
                                                  fontSize: 20,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            SizedBox(
                                              child:
                                                  CircularProgressIndicator(color: Colors.white),
                                              height: 30.0,
                                              width: 25.0,
                                            ),
                                          ])
                                    : Text(
                                        'Login',
                                        style: TextStyle(color: Colors.white),
                                      ),
                              ),
                      // Container(
                      //               height: 50,
                      //               width: 400,
                      //               padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      //               child: RaisedButton(
                      //                 textColor: Colors.white,
                      //                 color: kPrimaryColor,
                      //                 child: LoginProvider().loggedInStatus ==
                      //                         Status.Authenticating
                      //                     ? loading
                      //                     : MaterialButton(
                      //                         onPressed: () {
                      //                            setState(() {
                      //              agree ? false: true;
                      //            });
                      //                           doLogin(context, provideris);
                                                
                      //                         },
                      //                         textColor:
                      //                             const Color(0xfff063057),
                      //                         // color: color,
                      //                         child: SizedBox(
                      //                           width: double.infinity,
                      //                           child: agree
                      //                               ? Row(
                      //                                   mainAxisAlignment:
                      //                                       MainAxisAlignment
                      //                                           .center,
                      //                                   children: [
                      //                                       Text(
                      //                                         "Please Wait",
                      //                                         style: TextStyle(
                      //                                             fontFamily:
                      //                                                 'Helvetica',
                      //                                             fontSize: 20),
                      //                                         textAlign:
                      //                                             TextAlign
                      //                                                 .center,
                      //                                       ),
                      //                                       SizedBox(
                      //                                         width: 5.0,
                      //                                       ),
                      //                                       SizedBox(
                      //                                         child:
                      //                                             CircularProgressIndicator(),
                      //                                         height: 30.0,
                      //                                         width: 25.0,
                      //                                       ),
                      //                                     ])
                      //                               : Text(
                      //                                   "Login",
                      //                                   style: TextStyle(
                      //                                       fontFamily:
                      //                                           'Helvetica',
                      //                                       fontSize: 20),
                      //                                   textAlign:
                      //                                       TextAlign.center,
                      //                                 ),
                      //                         ),
                      //                         height: 45,
                      //                         minWidth: 600,
                      //                         shape: RoundedRectangleBorder(
                      //                             // borderRadius: BorderRadius.all(Radius.circular(10))
                      //                             ),
                      //                       ),
                      //                 onPressed: () {},
                      //               )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
