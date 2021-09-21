import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/model/core/faq_model.dart';
import 'package:flutter/material.dart';


class FAQsAnswer extends StatefulWidget {
  final FaqModel faqModel;
  FAQsAnswer({Key key, @required this.faqModel}): super(key: key);
  
//  final List<FaqModel> faqModel = [];

  @override
  _FAQsAnswerState createState() => _FAQsAnswerState();
}

class _FAQsAnswerState extends State<FAQsAnswer> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Row(
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
                      SizedBox(height: 20,),
                    Text('Answer', style: TextStyle(color: kPrimaryColor, fontSize: 19),),
                    Divider(),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: widget.faqModel.faqs.length,
                      itemBuilder: (context, index){
                      return SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20,),
                            Text(widget.faqModel.faqs[index].question, style: TextStyle(fontWeight: FontWeight.bold),),
                            SizedBox(height: 20,),
                            Text(widget.faqModel.faqs[index].answer)
                          ],
                        ),
                      );
                      }),
                  ],
                ),
              )
            ),
          ),
      ),
    );
  }
}