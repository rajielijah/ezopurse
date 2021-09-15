import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/bank_details.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class ProfileDetails extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final nameField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: 'Ben Tom'),
    );

    final emailField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: 'Bentom@gmail.com'),
    );
    final genderField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: 'Male'),
    );
    final dobNumber = TextFormField(
      autofocus: false,
      // obscureText: true,
      // validator: (value) =>
      //     value.isEmpty ? "Please enter a Valid Phone Number" : null,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: '11/12/1987'),
    );

    final countryField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: 'Nigeria'),
    );

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(28.0),
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
                        'Profile details',
                        style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      )
                    ],
                  ),
                ),
                // SizedBox(
                //   height: height/15,
                // ),

                Container(
                  width: width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Full name',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              nameField,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        Text('Email',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              emailField,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        Text('Gender',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              genderField,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        Text('D.O.B',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              dobNumber,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                        Text('Country',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18)),
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              countryField,
                            ],
                          ),
                        ),
                        SizedBox(
                          height: height / 40,
                        ),
                      ],
                    ),
                  ),
                ),

                // Container(
                //   color: Colors.white,
                //   padding: EdgeInsets.only(top:10),
                //   child: repeatPasswordField,
                // ),
                // SizedBox(height: 20,),
                //  SizedBox(
                //   height: height/10,
                // ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: FlatButton(
                    minWidth: 330,
                    height: 50,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Login()));
                    },
                    child: Text(
                      'Save',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    color: kPrimaryColor,
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //   Text('Have an Account?', style: TextStyle(color: kPrimaryColor),),
                //   SizedBox(width: 10,),
                //   GestureDetector(child: Text('Sign in'), onTap: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                //   })
                // ],)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
