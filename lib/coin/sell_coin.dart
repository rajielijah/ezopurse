import 'package:ezopurse/coin/buy_coin.dart';
import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/constant/custom_keyboard.dart';
import 'package:ezopurse/homepage/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SellCoin extends StatefulWidget {
  // const Deposit({ Key? key }) : super(key: key);

  @override
  _SellCoinState createState() => _SellCoinState();
}

class _SellCoinState extends State<SellCoin> {
  TextEditingController _controller = TextEditingController();
  bool _readOnly = true;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceEv,
                children: [
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.start,
                  //   children: [
                  //     GestureDetector(
                  //         onTap: () {
                  //           Navigator.pop(context);
                  //         },
                  //         child: Icon(Icons.arrow_back_ios_new)),
                  //     SizedBox(
                  //       width: 20,
                  //     ),
                  //     Text(
                  //       'Sell Bitcoin  (BTC)',
                  //       style: TextStyle(
                  //           fontSize: 17, fontWeight: FontWeight.w500),
                  //     ),
                  //     SizedBox(width: width/6),
                  //     GestureDetector(
                  //       onTap: (){
                          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => BuyCoin()));
                  //       },
                  //       child: Container(
                  //         height: height / 17,
                  //         width: width / 4,
                  //         decoration: BoxDecoration(
                  //             color: Colors.greenAccent,
                  //             borderRadius: BorderRadius.circular(19)),
                  //         child: Center(
                  //             child: Text(
                  //           'BULL BTC',
                  //           style: TextStyle(color: kPrimaryColor),
                  //         )),
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(height: height / 17),
                  Text('Enter Amount in BTC'),
                  SizedBox(height: height / 27),
                  Center(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(
                            bottom: width / 27, // HERE THE IMPORTANT PART
                          ),
                          border: InputBorder.none,
                          hintText: '0.00 BTC',
                          hintStyle: TextStyle(color: Colors.black)),
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 34, color: kPrimaryColor),
                      autofocus: true,
                      showCursor: true,
                      readOnly: _readOnly,
                    ),
                  ),
                  // SizedBox(
                  //   height: height / 17,
                  // ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Min \$100 - Max \$10,00000'),
                      Text('Value (N):  N10,000')
                    ],
                  ),
                  // SizedBox(
                  //   height: height / 12,
                  // ),
                    Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Rate: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        Text(
                          ' 530',
                          style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                              fontSize: 15),
                        )
                      ],
                    ),
                  ),
                  // SizedBox(
                  //   height: height / 20,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //   children: [
                  //     Container(
                  //       width: width / 8,
                  //       height: height / 20,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(color: Colors.grey[400])),
                  //       child: Center(child: Text('0 %')),
                  //     ),
                  //     Container(
                  //       width: width / 8,
                  //       height: height / 20,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(color: Colors.grey[400])),
                  //       child: Center(child: Text('10 %')),
                  //     ),
                  //     Container(
                  //       width: width / 8,
                  //       height: height / 20,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(color: Colors.grey[400])),
                  //       child: Center(child: Text('25 %')),
                  //     ),
                  //     Container(
                  //       width: width / 8,
                  //       height: height / 20,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(color: Colors.grey[400])),
                  //       child: Center(child: Text('50 %')),
                  //     ),
                  //     Container(
                  //       width: width / 8,
                  //       height: height / 20,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(color: Colors.grey[400])),
                  //       child: Center(child: Text('75 %')),
                  //     ),
                  //     Container(
                  //       width: width / 8,
                  //       height: height / 20,
                  //       decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(14),
                  //           border: Border.all(color: Colors.grey[400])),
                  //       child: Center(child: Text('100 %')),
                  //     )
                  //   ],
                  // ),
                  // SizedBox(
                  //   height: height / 12,
                  // ),
                  CustomKeyboard(
                    onTextInput: (myText) {
                      _insertText(myText);
                    },
                    onBackspace: () {
                      _backspace();
                    },
                  ),
                  SizedBox(
                    height: height / 20,
                  ),
                  FlatButton(
                    minWidth: 330,
                    height: height / 15,
                     shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => HomePage()));
                    },
                    child: Text(
                      'Sell',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                    color: kPrimaryColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _insertText(String myText) {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final newText = text.replaceRange(
      textSelection.start,
      textSelection.end,
      myText,
    );
    final myTextLength = myText.length;
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: textSelection.start + myTextLength,
      extentOffset: textSelection.start + myTextLength,
    );
  }

  void _backspace() {
    final text = _controller.text;
    final textSelection = _controller.selection;
    final selectionLength = textSelection.end - textSelection.start;

    // There is a selection.
    if (selectionLength > 0) {
      final newText = text.replaceRange(
        textSelection.start,
        textSelection.end,
        '',
      );
      _controller.text = newText;
      _controller.selection = textSelection.copyWith(
        baseOffset: textSelection.start,
        extentOffset: textSelection.start,
      );
      return;
    }

    // The cursor is at the beginning.
    if (textSelection.start == 0) {
      return;
    }

    // Delete the previous character
    final previousCodeUnit = text.codeUnitAt(textSelection.start - 1);
    final offset = _isUtf16Surrogate(previousCodeUnit) ? 2 : 1;
    final newStart = textSelection.start - offset;
    final newEnd = textSelection.start;
    final newText = text.replaceRange(
      newStart,
      newEnd,
      '',
    );
    _controller.text = newText;
    _controller.selection = textSelection.copyWith(
      baseOffset: newStart,
      extentOffset: newStart,
    );
  }

  bool _isUtf16Surrogate(int value) {
    return value & 0xF800 == 0xD800;
  }
}
