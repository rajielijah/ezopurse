import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/nav.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class Proof extends StatelessWidget {
  // const Proof({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
     final paymentField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
         hintText: '  N 10,000',
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
    border: OutlineInputBorder(),
    
  ),
    );

    final receiptField = TextFormField(
      autofocus: false,
      maxLines: 1,
      minLines: 1,
      decoration: InputDecoration(
         hintText: '  4567893456765544',
      contentPadding: new EdgeInsets.symmetric(vertical: 0, horizontal: 1.0),
    border: OutlineInputBorder(),
    
  ),
    );
     var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: (){
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
                        Text('Upload proof of payment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                         SizedBox(height: 10,),
                        Text('Input information to confirm your transaction', style: TextStyle(color: kPrimaryColor),),
                        SizedBox(height: height/35,),
                        Text('Payment Amount', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                        
                    Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top:10),
                        child: Column(
                          children: [
                            paymentField,
                            
                          ],
                        ),
                    ),
                    SizedBox(
                        height: height/40,
                    ),
                    Text('Receipt No.', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                     Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(top:10),
                        child: Column(
                          children: [
                            receiptField,
                           
                          ],
                        ),
                    ),
                     SizedBox(
                        height: height/40,
                    ),
                     Text('Proof of payment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                    SizedBox(height: 10,),
                     Container(
                       height: 40,

                       width: width,
                       decoration: BoxDecoration(
                         color: Colors.grey[400],
                         
                        //  border: OutlineInputBorder()
                       ),
                       child: Align(
                         alignment: Alignment.center
                         
                         ,
                         child: Text('Choose File')),
                     ),
                     SizedBox(height: 10,),
                     Align(
                       alignment: Alignment.center,
                       child: Text('(Max size 1MB)')),
                       SizedBox(height: height/20),
                     Text('How to send your proof of payment', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                     SizedBox(height: 20,),
                     Text('* Enter a payment amount, this must match the amount \n   on the proof of payment', style: TextStyle(fontSize: 13),),
                       SizedBox(height: 10,),
                     Text('* The receipt number you inputed must match that on \n   the receipt issued by your bank', style: TextStyle(fontSize: 13)),
                     SizedBox(height: 10,),
                     Text('* Upload a clear image of your proof of payment', style: TextStyle(fontSize: 13))
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
                                  child:   FlatButton(minWidth: 330, height: 40, 
                           shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(30)
                                 ),
                          onPressed: (){
                                 Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => MyStatefulWidget()));
                              }, 
                              child: Text('SAVE & CONTINUE', style: TextStyle(color: Colors.white, fontSize: 18)), color: kPrimaryColor,),
                                ),
                  ),
                )
              ],
            ),
          ),),
        ),
      ),
    );
  }
}