import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'custom_divider.dart';
import 'package:portfolio_app/utils.dart';


class ContactInfo extends StatefulWidget {
  final bool dark;
  
  const ContactInfo({
    Key? key,
    required this.dark,
  });

  @override
  _ContactInfoState createState() => _ContactInfoState();
}

class _ContactInfoState extends State<ContactInfo> {
  late TapGestureRecognizer _recognizer;
  final GlobalKey _textKey = GlobalKey();
  final GlobalKey _phoneKey = GlobalKey();
  final GlobalKey _githubKey = GlobalKey();
  
  @override
  void initState() {
    super.initState();

    _recognizer = TapGestureRecognizer()..onTap = _handlePress;
  }

  @override
  void dispose() {
    _recognizer.dispose();
    super.dispose();  
  }

  void _handlePress() {
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: 70.h,
        ),
        child: Column(
          children: [
            CustomDivider(
              text: 'CONTACT'
            ),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // horizontal: 20.w,
                  vertical: 10.h
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    RichText(
                      key: _textKey,
                      text: TextSpan(
                        text: 'EMAIL - ',
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w600,
                          // letterSpacing: 0.5,
                          color: widget.dark ? Colors.white : Colors.black,
                          fontSize: 16.sp
                        ),
                        children: [
                          TextSpan(
                            recognizer: _recognizer,
                            text: 'archibongc4@gmail.com',
                            style: TextStyle(
                              letterSpacing: 0.5,
                              decoration: TextDecoration.underline,
                            )
                          )
                        ]
                      ),
                    ),
                    SizedBox(height: 10.h),
                    RichText(
                      key: _phoneKey,
                      text: TextSpan(
                        text: 'PHONE - ',
                        style: TextStyle(
                          // letterSpacing: 0.5,
                          fontFamily: "Quicksand",
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          color: widget.dark ? Colors.white : Colors.black
                        ),
                        children: [
                          TextSpan(
                            recognizer: _recognizer,
                            text: '+234 8117384652',
                            style: TextStyle(
                              decoration: TextDecoration.underline
                            )
                          )
                        ]
                      ),
                    ),
                    SizedBox(height: 10),
                    RichText(
                      key: _githubKey,
                      text: TextSpan(
                        text: 'GITHUB - ',
                        style: TextStyle(
                          // letterSpacing: 0.5,
                          fontFamily: "Quicksand",
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: widget.dark ? Colors.white : Colors.black
                        ),
                        children: [
                          TextSpan(
                            recognizer: _recognizer,
                            text: 'https://github.com/Arch997',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                            )
                          )
                        ]
                      ),
                    ),
                    /*Text(
                      'EMAIL: ',
                      style: TextStyle(
                        fontFamily: "Quicksand"
                      ),
                    )*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}