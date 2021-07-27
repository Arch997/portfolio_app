import 'package:flutter/material.dart';

import 'package:portfolio_app/utils.dart';


// ignore: must_be_immutable
class LeadBanner extends StatelessWidget {
  Key? key;
  LeadBanner({
    this.key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height.h * 0.72,
      width: MediaQuery.of(context).size.width.w,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/coffee-mug-0.jpeg'),
          fit: BoxFit.cover
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50.r),
          //topRight: Radius.circular(50),
        )
      ),
      child: Padding(
        padding: EdgeInsets.only(top: 10.h, left: 20.w, right: 20.w),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 10.w,
                vertical: 10.h
              ),
              width: 70.w,
              height: 70.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 5.0,
                )
              ),
              child: Text(
                'CE',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 30.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
              ),
              child: Text(
                'Hello, hola, \n ciao!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontSize: 30.sp,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Text(
                '''I grind Flutter UIs and then wield them with some backend functionality into beautiful and efficient applications.
                ''',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: "Quicksand",
                  fontWeight: FontWeight.w700,
                  fontSize: 20.sp
                )
              )
            ),
            
          ],
        ),
      ),
    );
  }
}