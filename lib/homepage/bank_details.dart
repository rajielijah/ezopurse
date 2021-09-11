import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/authentication/login.dart';
import 'package:flutter/material.dart';


class BankDetails extends StatelessWidget {
  // const BankDetails({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
               decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF5DD35D),
                            const Color(0xFF5DD35D)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.0, 0.1],
                        ),
                      ),
                  height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width,
              child:     Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: GestureDetector(
                        onTap: (){
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,))),
                        SizedBox(width: 20,),
                        Text('Bank details', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),)
                      ],
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: height/7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  title: Text('Zenith Bank', style: TextStyle(color: Colors.red),),
                  subtitle: Text('5555 7777 8888 9999 0890', style: TextStyle(color: Colors.grey)),
                  trailing: Text('Visa',style: TextStyle(color: Colors.blue),
                ),
              ),
            )),
             Padding(
              padding: const EdgeInsets.only(left:20.0, right: 20),
              child: Container(
                height: height/7,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
                ),
                child: ListTile(
                  title: Text('First Bank', style: TextStyle(color: Colors.blue[900]),),
                  subtitle: Text('5555 7777 8888 9999 0890', style: TextStyle(color: Colors.grey)),
                  trailing: Text('Visa',style: TextStyle(color: Colors.blue),
                ),
              ),
            )),
            SizedBox(height: height/4,),
              FlatButton(minWidth: 330, height: height/10,onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Login()));
                    }, 
                    child: Text('Add card', style: TextStyle(color: Colors.white, fontSize: 20),), color: kPrimaryColor,),
          ],
        ),
      ),
      
    );
  }
}