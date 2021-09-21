import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/bank_details.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:ezopurse/model/services/add_bank_details.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

var provideris;

class AddBank extends StatefulWidget {
  @override
  _AddBankState createState() => _AddBankState();
}
class _AddBankState extends State<AddBank> {
   final formKey = new GlobalKey<FormState>();

  String _accountNumber, _accountName, _bankName, _bvn;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final cardNoField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
       onSaved: (value) => _accountNumber = value,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ''),
    );

    final pinField = TextFormField(
      autofocus: false,
      // obscureText: true,
      maxLines: 1,
       onSaved: (value) => _accountName = value,
      minLines: 1,
      validator: (value) => value.isEmpty ? "Please enter pin" : null,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ''),
    );
    final cvvField = TextFormField(
      autofocus: false,
      maxLines: 1,
       onSaved: (value) => _bankName = value,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ' 489'),
    );

      var loading = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        CircularProgressIndicator(),
        Text(" Registering ... Please wait")
      ],
    );

    var doAddBank = (BuildContext context, var provide){
        final form = formKey.currentState;
        if(form.validate()){
          form.save();
          Provider.of<AddBankProvider>(context, listen: false).addBank
          (_accountNumber, _bankName, _accountName, _bvn).then((responseData){
           print(responseData);
            if(responseData['status']){
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (_) => BankDetails()));
            }
            else{
               Flushbar(
              title: "Failed Login",
              message: responseData['user'].toString(),
              duration: Duration(seconds: 5),
            ).show(context);
            print('error!');
            }
          }).catchError((e){
            print('we want to knw $e');
          });
        }
        else{
          print("Form is invalud");
        }
    };  

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=> AddBankProvider())
      ],
      child: Builder(
        builder: (context){
        provideris = Provider.of<AddBankProvider>(context, listen: false);
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Container(
                      height: height / 1.45,
                      width: width,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          // mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(Icons.arrow_back)),
                            SizedBox(
                              height: height / 30,
                            ),
                            Text('Add bank',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 24)),
                            SizedBox(
                              height: height / 50,
                            ),
                            Text(
                              'Fill in you card details',
                              style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 0.7),
                            ),
                            SizedBox(
                              height: height / 45,
                            ),
                            Text(
                              'Account Number',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              // padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  cardNoField,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 25,
                            ),
                            Text(
                              'Account Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              // padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  pinField,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 25,
                            ),
                            Text(
                              'Bank Name',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            SizedBox(
                              height: height / 80,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              // padding: EdgeInsets.all(10),
                              child: Column(
                                children: [
                                  cvvField,
                                ],
                              ),
                            ),
                            SizedBox(
                              height: height / 25,
                            ),
                            // Text(
                            //   'Expiry Date',
                            //   style: TextStyle(
                            //       fontWeight: FontWeight.bold, fontSize: 18),
                            // ),
                            // SizedBox(
                            //   height: height / 80,
                            // ),
                            // Container(
                            //   decoration: BoxDecoration(
                            //     borderRadius: BorderRadius.circular(10),
                            //     color: Colors.white,
                            //   ),
                            //   // padding: EdgeInsets.all(10),
                            //   child: Column(
                            //     children: [
                            //       expiryDateField,
                            //     ],
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: width,
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(28.0),
                        child: Container(
                          child: FlatButton(
                            minWidth: 330,
                            height: 50,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            onPressed:(){},
                            child: MaterialButton(
                              onPressed: (){
                                doAddBank(context, provideris);
                              },
                             child: Text('SAVE & CONTINUE',
                                  style: TextStyle(color: Colors.white, fontSize: 18)),
                                              )),
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    
                  ],
                ),
              ),
            ),
          ),
        );
        }),
    );
  }
}
