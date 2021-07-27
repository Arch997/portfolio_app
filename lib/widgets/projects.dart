import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:url_launcher/url_launcher.dart';

import 'custom_divider.dart';
import 'package:portfolio_app/utils.dart';


class ProjectCarousel extends StatefulWidget {
  @override
  _ProjectCarouselState createState() => _ProjectCarouselState();
}

class _ProjectCarouselState extends State<ProjectCarousel> {
  late PageController _pageController;
  int initialPage = 0;

  List _projects = [
    'Bunkie',
    'Flutter Chat',
    'Email MicroApi',
    'Covid-19 Tracker'
  ];

  List assets = [
    'assets/images/living_room4.jpeg',
    'assets/images/Retina-MacBook-Pro-Workspace-Mockup-.jpg',
    'assets/images/api.jpg',
    'assets/images/bicycles27.jpg',
  ];

  List desc = [
    'A project that aims to solve the problem of housing in Nigerian universities.',
    'A very minimal realtime chat application using Firebase Auth and Cloud Firestore for persistence.',
    'Backend microservices project intended to spawn endpoints to facilitate common email functions. Written in Python (Django).',
    'Minimal app that simply returns daily Covid-19 statistics by country.'
  ];

  List urls = [
    'https://appho.st/d/xLc1cy0D',
    '',
    '',
    '',
  ];

  List githubUrls = [
    '',
    'https://github.com/Arch997/flutter_chat',
    'https://github.com/Arch997/email-microapi-1',
    ''
  ];
  
  void _launchUrl(url) async {
    await canLaunch(url) ? await launch(url) : throw 'Could not launch URL';
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: initialPage
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.zero,
      child: AspectRatio(
        aspectRatio: 0.85.w,
        child: PageView.builder(
          onPageChanged: (v) => setState(() => initialPage = v),
          controller: _pageController,
          physics: ClampingScrollPhysics(),
          itemCount: _projects.length,
          itemBuilder: (context, index) => buildProjectSlider(index) 
        )
      ),
    );
  }

  Widget buildProjectSlider(int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0.0;
      if (_pageController.position.haveDimensions) {
        value = index - _pageController.page!;
        // We use 0.038 because 180*0.038 = 7 (almost), and we need to rotate our poster 7 degree
        // we use clamp so that our value vary from -1 to 1
        value = (value * 0.038).clamp(-1, 1);
      }
      return AnimatedOpacity(
        opacity: initialPage == index ? 1 : 0.4,
        duration: Duration(milliseconds: 350),
        child: Transform.rotate(
          angle: math.pi * value, 
          child: Stack(
            children: [
              Container(
                margin: EdgeInsets.all(15.w),
                padding: EdgeInsets.all(50.w),
                width: double.infinity,
                height: 300.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(assets[index]),
                    fit: BoxFit.cover
                  ),
                  borderRadius: BorderRadius.circular(10.0.r),
                  ),
                child: Column(
                  children: [
                    
                    /*Text(
                      _tapped ? '' : 'Tap for details',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontFamily: "Quicksand",
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    )*/
                  ],
                )
              ),
              Positioned(
                height: 300.h,
                width: 230.w,
                top: 15.h,
                left: 15.w,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10.0)
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 2.h
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              alignment: Alignment.centerRight,
                              onPressed: () => _launchUrl(githubUrls[index]),
                              icon: Image.asset(
                                'assets/images/github-mark.png',
                                scale: 9,
                              ),
                            ),
                            
                            /*IconButton(
                              alignment: Alignment.centerRight,
                              onPressed: () {},
                              iconSize: 22,
                              icon: Icon(
                                Icons.launch,
                                color: Colors.white70,
                              ),
                            )*/
                          ]
                        ),
                        CustomDivider(text: _projects[index], fontSize: 15.sp, color: Colors.white),
                        Wrap(
                          verticalDirection: VerticalDirection.down,
                          alignment: WrapAlignment.start,
                          children: [
                            Text(
                              desc[index],
                              softWrap: true,
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                color: Colors.white,
                              ),
                            )
                          ] 
                        ),
                        SizedBox(height: 15.h),
                        Container(
                          width: 100.w,
                          height: 30.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white
                            )
                          ),
                          child: TextButton(
                            onPressed: () => _launchUrl(urls[index]),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                  horizontal: 2.w)
                              ),
                              overlayColor: MaterialStateProperty.all(Colors.green)
                            ),
                            child: Text(
                              'VISIT APP',
                              style: TextStyle(
                                fontFamily: "Quicksand",
                                color: Colors.white,
                                fontSize: 14.sp,
                              ),
                            ),
                          )
                        ),
                        
                      ]
                    ),
                  )
                ),
              )
            ]
          )
        )
      );
    },
  );
}


