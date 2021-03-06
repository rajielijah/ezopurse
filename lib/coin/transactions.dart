import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/model/core/transaction_model.dart';
import 'package:ezopurse/model/services/transaction_api.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Transaction extends StatefulWidget {
  @override
  _TransactionState createState() => _TransactionState();
}

class _TransactionState extends State<Transaction> {
  Future<TransactionModel> transactionModel;

  @override
  void initState() {
    super.initState();
    transactionModel = TransactionApi.instance.getTransaction();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Transactions',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                // SizedBox(
                //   height: height / 20,
                // ),
                FutureBuilder<TransactionModel>(
                    future: transactionModel,
                    builder: (context, snapshot) {
                      return ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.buySells.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: height / 7,
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    // SvgPicture.asset('images/btc.svg'),
                                    Image.asset(
                                      'images/me.png',
                                      height: height,
                                    ),
                                    // SvgPicture.asset('images/cb.svg'),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Bitcoin',
                                          style: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                            "${snapshot.data.buySells[index].amount}"),
                                        Text('Price: \$ 24.39 ')
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                            snapshot.data.buySells[index]
                                                .transactionType,
                                            style: TextStyle(
                                              fontSize: 20,
                                            )),
                                        Text(
                                            "${snapshot.data.buySells[index].createdAt}"),
                                        Text(
                                          snapshot.data.buySells[index]
                                              .transactionStatus,
                                          style:
                                              TextStyle(color: kPrimaryColor),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                SizedBox(
                  height: height / 40,
                ),
                //  Container(
                //     height: height / 7,
                //     width: width ,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(18.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           // SvgPicture.asset('images/btc.svg'),
                //           Image.asset('images/me.png', height: height,),
                //           SizedBox(width: 10,),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text('Bitcoin', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),), Text('Amount: 5.485 BTC'), Text('Price: \$ 24.39 ')
                //             ],
                //           ),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             children: [
                //               Text('Total:\$133.316', style: TextStyle(fontSize: 20,)), Text('27 May, 09:28 AM'), Text('Successfully Completed', style: TextStyle(color: kPrimaryColor),)
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),

                //   SizedBox(height: height/40,),
                //   Container(
                //     height: height / 7,
                //     width: width ,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(18.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           // SvgPicture.asset('images/btc.svg'),
                //           Image.asset('images/me.png', height: height,),
                //           SizedBox(width: 10,),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text('Bitcoin', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),), Text('Amount: 5.485 BTC'), Text('Price: \$ 24.39 ')
                //             ],
                //           ),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             children: [
                //               Text('Total:\$133.316', style: TextStyle(fontSize: 20,)), Text('27 May, 09:28 AM'), Text('Successfully Completed', style: TextStyle(color: kPrimaryColor),)
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //    SizedBox(
                //     height: height / 40,
                //   ),
                //   Container(
                //     height: height / 7,
                //     width: width ,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(8)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(18.0),
                //       child: Row(
                //         mainAxisAlignment: MainAxisAlignment.spaceAround,
                //         children: [
                //           // SvgPicture.asset('images/btc.svg'),
                //           Image.asset('images/me.png', height: height,),
                //           SizedBox(width: 10,),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text('Bitcoin', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),), Text('Amount: 5.485 BTC'), Text('Price: \$ 24.39 ')
                //             ],
                //           ),
                //           Column(
                //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //             crossAxisAlignment: CrossAxisAlignment.end,
                //             children: [
                //               Text('Total:\$133.316', style: TextStyle(fontSize: 20,)), Text('27 May, 09:28 AM'), Text('Successfully Completed', style: TextStyle(color: kPrimaryColor),)
                //             ],
                //           )
                //         ],
                //       ),
                //     ),
                //   ),
                //    SizedBox(
                //     height: height / 40,
                //   ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
