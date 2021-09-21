import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/homepage/faq_answeers.dart';
import 'package:ezopurse/model/core/faq_model.dart';
import 'package:ezopurse/model/services/faq_api.dart';
import 'package:flutter/material.dart';



class FAQs extends StatefulWidget {
  // const FAQs({ Key? key }) : super(key: key);

  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQs> {
  Future<FaqModel> faqModel;
  @override
  void initState(){
    super.initState();
    faqModel = FaqApi.instance.getAllFaq();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                        'FAQs',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 23),
                      )
                    ],
                  ),
                ),
                Text('Check out frequently asked question', style: TextStyle(color: kPrimaryColor, fontSize: 17),),
                Divider(),
                FutureBuilder<FaqModel>(
                  future: faqModel,
                  builder: (context, snapshot) {
                    return Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data.faqs.length,
                          itemBuilder: (context, index){
                            return ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => FAQsAnswer(faqModel: snapshot.data)));
                              },
                              title: Text(snapshot.data.faqs[index].question),
                              trailing: Icon(Icons.arrow_forward_ios_sharp),
                            );
                        }),
                        Divider()
                      ],
                    );
                })
            ],
          ),
        ),
      ),
    );
  }
}