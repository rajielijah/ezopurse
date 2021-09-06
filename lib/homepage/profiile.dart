
import 'package:ezopurse/widget/profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Profile extends StatelessWidget {
  // const Profile({ Key? key }) : super(key: key);
// 
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView( 
          child: Container(
            color: Colors.grey[100],
            // height: height,
            width: width,
            child: Column(
              children: [
                Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  
                  decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                          colors: [
                            const Color(0xFF5DD35D),
                            const Color(0xFF5DD35D)
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          // stops: [0.0, 0.1],
                        ),
                      ),
                  height: MediaQuery.of(context).size.height / 3,
                      width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                       Stack(
                         alignment: Alignment.bottomRight,
                         children: [
                           CircleAvatar(child: SvgPicture.asset('images/ellipse6.svg'), radius: 40,),
                           Positioned(
                            //  top: 22,
                             child: Icon(Icons.camera_alt_outlined, color: Colors.white,))
                         ],
                       ),
                       Text('Ben Tom', style: TextStyle(color: Colors.white, fontWeight:FontWeight.w500, fontSize: 20),),
                       Text('Bentom@gmail.com', style: TextStyle(color: Colors.white),),
                       Text('+2341 9977118', style: TextStyle(color: Colors.white,),)
                      ],
                    ),
                  ),
                ),
              ),
              profile(context, SvgPicture.asset('images/vector18.svg'), Text('Profile details', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),
              profile(context, SvgPicture.asset('images/vector17.svg'), Text('Bank details', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),
              profile(context, SvgPicture.asset('images/vector15.svg'), Text('Notifications', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),
              profile(context, SvgPicture.asset('images/vector16.svg'), Text('Security', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),
              profile(context, SvgPicture.asset('images/vector14.svg'), Text('Help and Support', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),
              profile(context, SvgPicture.asset('images/Group.svg'), Text('Terms and Conditions', style: TextStyle(fontSize:19, fontWeight: FontWeight.w500),), Icon(Icons.arrow_forward_ios_sharp)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}