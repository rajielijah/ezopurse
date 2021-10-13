import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:ezopurse/coin/send_coin.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/confirm.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/model/services/buy_api.dart';
import 'package:ezopurse/model/services/sell_api.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

var buyProvider;

class SellProof extends StatefulWidget {
  // const SellProof({ Key? key }) : super(key: key);
//
  @override
  _SellProofState createState() => _SellProofState();
}

class _SellProofState extends State<SellProof> {
  final _amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int _amount;
  XFile _image;
  String base64Image;
  String _proof;
  var imageUrl;
  var postFiles;
  var imagevalue;
  String imageLink;
  File imageBytes;
  bool isloading = false;
  bool imageCheck = false;
  @override
  Widget build(BuildContext context) {
    final paymentField = TextField(
      autofocus: false,
      maxLines: 1,
      keyboardType: TextInputType.number,
      controller: _amountController,
      minLines: 1,
      decoration: InputDecoration(
        hintText: '  N 10,000',
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

    var doSellProof = (BuildContext context, var provide) {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        Provider.of<SellApi>(context, listen: false)
            .sellProof(int.parse(_amountController.text), imageLink)
            .then((responseData) {
          print("Knowing response $responseData");
          if (responseData['status']) {
            print("IT IS DONE");
            setState(() {
              isloading = !isloading;
            });
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => ConfirmPage()));
            // Navigator.push(context, route)
          } else {
            setState(() {
              isloading = !isloading;
            });
            Flushbar(
              title: "Failed, Try again",
              message: responseData['user'].toString(),
              duration: Duration(seconds: 5),
            ).show(context);
            print('error!');
          }
        }).catchError((e) {
          print("what's the error $e");
        });
      } else {
        setState(() {
          isloading = !isloading;
        });
        print("Form is invalid");
      }
    };

    Future getImage(ImageSource source) async {
      XFile image = await ImagePicker().pickImage(
        // context: context,
        source: source,
        maxHeight: 400,
        maxWidth: 300,
        imageQuality: 100,
      );
      final cloudinary = Cloudinary(
          "579251194598375", "mURSzkqRNR8_JHjuPJKjMjX3wK0", "dasek9hic");
      setState(() {
        _image = image;
        print(" just checking $_image");
        // List<int> imageBytes = _image.path;
        // base64Image = base64Encode(imageBytes);
        // imagevalue = base64Image;
        print(base64Image);
      });
      final response = await cloudinary.uploadFile(
        filePath: _image.path,
        resourceType: CloudinaryResourceType.image,
        folder: 'image',
      );
      if (response.isSuccessful ?? false)
        setState(() {
          final String imag1 = response.secureUrl;
          print("to get result $imag1");
          imageLink = imag1;

          // postFiles.add('$imag1');
          // print(postFiles.length);
        });
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => SellApi())],
      child: Builder(builder: (context) {
        buyProvider = Provider.of<SellApi>(context, listen: false);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back)),
                        Container(
                          color: Colors.white,
                          width: width,
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Upload proof of payment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Circular STD",
                                      fontSize: 20),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  'Input information to confirm your transaction',
                                  style: TextStyle(color: kPrimaryColor),
                                ),
                                SizedBox(
                                  height: height / 35,
                                ),
                                Text('Amount',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Circular STD",
                                        fontSize: 18)),
                                Container(
                                  color: Colors.white,
                                  padding: EdgeInsets.only(top: 10),
                                  child: Column(
                                    children: [
                                      paymentField,
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height / 40,
                                ),
                                SizedBox(
                                  height: height / 40,
                                ),
                                Text('Proof of payment',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Circular Std",
                                        fontSize: 18)),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    getImage(ImageSource.gallery);

                                    imageCheck = !imageCheck;
                                  },
                                  child: imageCheck
                                      ? Container(
                                          height: 40,
                                          width: width,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],

                                            //  border: OutlineInputBorder()
                                          ),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Text(
                                                'Image has been uploaded',
                                                style: TextStyle(
                                                    fontFamily: "Circular Std"),
                                              )),
                                        )
                                      : Container(
                                          height: 40,
                                          width: width,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[400],

                                            //  border: OutlineInputBorder()
                                          ),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Text('Choose File')),
                                        ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Align(
                                    alignment: Alignment.center,
                                    child: Text('(Max size 1MB)')),
                                SizedBox(height: height / 20),
                                Text(
                                  'How to send your proof of payment',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Circular STD",
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '* Enter a payment amount, this must match the amount \n   on the proof of payment',
                                  style: TextStyle(
                                      fontFamily: "Circular STD", fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    '* The receipt number you inputed must match that on \n   the receipt issued by your bank',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontFamily: "Circular STD",
                                    )),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    '* Upload a clear image of your proof of payment',
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontFamily: "Circular STD"))
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          height: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Container(
                              child: FlatButton(
                                minWidth: 330,
                                height: 40,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                onPressed: () {
                                  setState(() {
                                    isloading = !isloading;
                                  });
                                  _amountController.text.isEmpty
                                      ? showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return AlertDialog(
                                              title: Text(
                                                  "Enter the amount you sent"),
                                            );
                                          })
                                      : doSellProof(context, buyProvider);

                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (BuildContext context) =>
                                  //             MyStatefulWidget()));
                                },
                                child: isloading
                                    ? Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                            Text(
                                              "Confirming your payment",
                                              style: TextStyle(
                                                  // fontFamily: 'Helvetica',
                                                  fontFamily: "Circular STD",
                                                  fontSize: 20,
                                                  color: Colors.white),
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(
                                              width: 5.0,
                                            ),
                                            SizedBox(
                                              child: CircularProgressIndicator(
                                                  color: Colors.white),
                                              height: 30.0,
                                              width: 25.0,
                                            ),
                                          ])
                                    : Text('SAVE & CONTINUE',
                                        style: TextStyle(
                                            fontFamily: "Circular STD",
                                            color: Colors.white,
                                            fontSize: 18)),
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        )
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
