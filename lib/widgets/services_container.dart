import 'package:flutter/material.dart';

import 'custom_divider.dart';
import 'package:portfolio_app/utils.dart';


class MyServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.green[300],
            borderRadius: BorderRadius.only(
              // topLeft: Radius.circular(50),
              bottomLeft: Radius.circular(50.r),
              // topRight: Radius.circular(50)
            )
          ),
          child: Padding(padding: EdgeInsets.symmetric(
              vertical: 25.h,
              horizontal: 10.w
            ),
            child: Column(
              children: [
                CustomDivider(text: 'SERVICES'),
                Padding(
                  padding: EdgeInsets.only(top: 15.h),
                  child: Icon(
                    Icons.search,
                    size: 45.w,
                  ),
                ),
                Text(
                  'Consulting',
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Offer assistance to new developers as they navigate the excitement of software development. I answer questions and provide clarification as needed.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 15.sp
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: Icon(
                    Icons.code,
                    size: 45.w,
                  ),
                ),
                Text(
                  'Web Development',
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 5.h),
                Text(
                  "Build crisp, modern and responsive web applications using a variety of technologies. I'm fairly comfortable with implementations for the Web frontend and backend. So, fullstack?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 15.sp
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 10.h
                  ),
                  child: Icon(
                    Icons.mobile_friendly,
                    size: 45.w,
                  ),
                ),
                Text(
                  'Mobile Development',
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "I'm a mobile applications developer using Flutter to serve cross-platform apps. Most of the work I do these days revolve around Flutter because of this versatility. I led the mobile team of 4 in an internship I took part in for a project which was developed to the MVP stage. Check that out in the link attached to my featured projects.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(height: 10),
                Divider(
                  thickness: 3.0,
                  indent: 10.w,
                  endIndent: 10.w,
                  color: Colors.white38,
                ),
                Text(
                  "Want to find out more information, or just want to chat?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: "Quicksand",
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  width: 150.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white
                    )
                  ),
                  child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(
                          horizontal: 10.w)
                      ),
                      overlayColor: MaterialStateProperty.all(Colors.green)
                    ),
                    child: Text(
                      'CONTACT ME',
                      style: TextStyle(
                        fontFamily: "Quicksand",
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  )
                ),
                
              ],
            ),
          ),
        ),
        SizedBox(height: 20.h),
      ],
    ); 
  }
}