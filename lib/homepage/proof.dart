import 'dart:io';

import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:ezopurse/coin/send_coin.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/model/services/buy_api.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';

var buyProvider;

class BuyProof extends StatefulWidget {
  // const BuyProof({ Key? key }) : super(key: key);
//
  @override
  _BuyProofState createState() => _BuyProofState();
}

class _BuyProofState extends State<BuyProof> {
  final _amountController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  int _amount;
  XFile _image;
  String base64Image;
  String _proof;
  var imageUrl;
  var postFiles;
  var imagevalue;
  File imageBytes;
  bool isloading = false;

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
        border: OutlineInputBorder(),
      ),
    );

    var doBuyProof = (BuildContext context, var provide) {
      final form = formKey.currentState;
      if (form.validate()) {
        form.save();
        Provider.of<Buy>(context, listen: false)
            .buyProof(int.parse(_amountController.text), imageUrl);
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

          postFiles.add('$imag1');
          print(postFiles.length);
        });
    }

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => Buy())],
      child: Builder(builder: (context) {
        buyProvider = Provider.of<Buy>(context, listen: false);
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
                                        fontSize: 18)),
                                SizedBox(
                                  height: 10,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    getImage(ImageSource.gallery);
                                  },
                                  child: Container(
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
                                      fontSize: 16),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  '* Enter a payment amount, this must match the amount \n   on the proof of payment',
                                  style: TextStyle(fontSize: 13),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    '* The receipt number you inputed must match that on \n   the receipt issued by your bank',
                                    style: TextStyle(fontSize: 13)),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    '* Upload a clear image of your proof of payment',
                                    style: TextStyle(fontSize: 13))
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
                                    _amount.toString().isEmpty
                                        ? showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text(
                                                    "Enter the amount you sent"),
                                              );
                                            })
                                        : doBuyProof(context, buyProvider);
                                  });
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              MyStatefulWidget()));
                                },
                                child: Text('SAVE & CONTINUE',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 18)),
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
