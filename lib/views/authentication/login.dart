import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/views/authentication/forgotPassword.dart';
import 'package:ezopurse/views/authentication/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  // const Loginin({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final EmailField = TextFormField(
      
      autofocus: false,
       maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
       
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
     enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.grey[200])
    ),
    
  ),
    );

    final passwordField = TextFormField(
      autofocus: false,
      obscureText: true,
      validator: (value) => value.isEmpty ? "Please enter password" : null,
       maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
   enabledBorder: OutlineInputBorder(
       borderSide: new BorderSide(color: Colors.grey[200])
    ),
  ),
    );
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: height,
          width: width,
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
                          Icons.arrow_back_ios,
                        )),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Kindly login to your account',
                      style: TextStyle(color: kPrimaryColor, fontSize: 18),
                    )
                  ],
                ),
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
              Container(
                width: width,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Email',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15)),
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
                              fontWeight: FontWeight.bold, fontSize: 15)),
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
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
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
                          style: TextStyle(color: Colors.black),
                        )),
                    SizedBox(
                      width: width / 20,
                    ),
                    Text(
                      "Don't Have an account?",
                      style: TextStyle(color: kPrimaryColor),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => SignUp()));
                      },
                      child: Text('Sign Up'),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FlatButton(
                  minWidth: 330,
                  height: 50,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                MyStatefulWidget()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white),
                  ),
                  color: kPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
