import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/textfield.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:flutter/material.dart';

class AddBank extends StatelessWidget {
  // const ({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    final cardNoField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ' 4445 6665 3345 ***'),
    );

    final pinField = TextFormField(
      autofocus: false,
      obscureText: true,
      maxLines: 1,
      minLines: 1,
      validator: (value) => value.isEmpty ? "Please enter pin" : null,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ' ***'),
    );
    final cvvField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ' 489'),
    );

    final expiryDateField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
          contentPadding: new EdgeInsets.symmetric(),
          enabledBorder: OutlineInputBorder(
              borderSide: new BorderSide(color: Colors.grey[200])),
          hintText: ' Expiry Date'),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: height / 1.15,
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
                        'Card no.',
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
                        'Pin',
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
                        'CVV',
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
                      Text(
                        'Expiry Date',
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
                            expiryDateField,
                          ],
                        ),
                      ),
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
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    MyStatefulWidget()));
                      },
                      child: Text('SAVE & CONTINUE',
                          style: TextStyle(color: Colors.white, fontSize: 18)),
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
