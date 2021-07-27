
import 'package:flutter/material.dart';
import 'package:portfolio_app/widgets/contact_info.dart';
import 'package:portfolio_app/widgets/skills_rating.dart';

import 'widgets/custom_divider.dart';
import 'widgets/drawer_list.dart';
import 'widgets/lead_banner.dart';
import 'widgets/projects.dart';
import 'widgets/services_container.dart';

import 'utils.dart';

void main() {
  runApp(ScreenUtilInit(
    designSize: Size(325, 667),
    builder: () => PortfolioApp(title: "My Portfolio"))
  );
}


class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> 
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation _colorAnim;

  bool _isDark = false;

  GlobalKey<ScaffoldState> drawerKey = GlobalKey();
  GlobalKey introKey = GlobalKey();
  ScrollController _scrollController = ScrollController();

  Animatable bgColor = TweenSequence([
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.red, end: Colors.blue),
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.blue, end: Colors.green), 
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.green, end: Colors.yellow), 
        weight: 1.0,
      ),
      TweenSequenceItem(
        tween: ColorTween(begin: Colors.yellow, end: Colors.red),
        weight: 1.0,
      ),
    ]
  );

  // List<double> _stops = [0.0, 0.7];

  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.green,
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black.withOpacity(1),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
  
  void _onTap() {
    drawerKey.currentState!.openDrawer();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
      debugLabel: 'Name Animation',
    )
    ..forward()
    ..repeat()
    .whenComplete(() => setState(() {}));

    _colorAnim = bgColor.animate(_animationController);
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _dark,
      theme: _light,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      title: 'Portfolio App',
      home: Scaffold(
        key: drawerKey,
        // drawer: DrawerList(action: Scrollable.ensureVisible(context, alignment: 30)),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            'Charles',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              fontFamily: "Quicksand",
              fontWeight: FontWeight.w600,
              color: _isDark ? Colors.white : Colors.black,
            ),
          ),
          centerTitle: true,
          /*leading:  GestureDetector(
            onTap: () => _onTap(),
            child: Icon(
              Icons.menu_rounded,
              color: _isDark ? Colors.white : Colors.black,
              size: 30,
            ),
          ),*/
          actions: [
            Switch.adaptive(
              value: _isDark,
              inactiveThumbColor: Colors.black,
              onChanged: (v) {
                setState(() => _isDark = !_isDark);
                /*_scrollController.animateTo(
                      5,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                    );*/
              },
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                LeadBanner(key: introKey),
                SizedBox(height: 30.h),
                CustomDivider(text: "ABOUT ME"),
                Container(
                  width: 200.w,
                  margin: EdgeInsets.only(bottom: 10.h),
                  /*padding: EdgeInsets.symmetric(
                    horizontal: 50.w, 
                    vertical: 10.h,
                  ),*/
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                    radius: 50.0.r,
                    backgroundImage: AssetImage(
                      'assets/images/cartoon_avi.png',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "HI THERE \u{1F44B}, I'M ",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'Quicksand',
                      fontSize: 9.sp,
                      color: _isDark ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Wrap(
                  verticalDirection: VerticalDirection.down,
                  alignment: WrapAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 10.h
                      ),
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Text(
                            'charles',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: _colorAnim.value,
                              fontWeight: FontWeight.bold,
                              fontSize: 30.sp,
                              fontFamily: 'Quicksand',
                              letterSpacing: 1.0,
                            )
                          );
                        }),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w
                      ),
                      child: Text(
                        """A full stack software developer from Nigeria,\nfocused on building web/mobile products, and learning their architecture. I've got experience in Python, Django, ReactJS, and Flutter for cross-platform development. Here's to hoping my design chops can also be activated on this journey \u{1f942}.
                        """,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Quicksand',
                          letterSpacing: 0.5,
                          fontSize: 12.sp,
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SkillsRating(),
                    MyServices(),
                    CustomDivider(text: 'MY WORK'),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 10.h,
                        horizontal: 10.w
                      ),
                      child: Text(
                        'I have worked on a number of projects, so I have picked only the latest for you. -',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Quicksand",
                          fontSize: 17.sp,
                        ),
                      ) ,
                    ),
                    SizedBox(height: 5.h),
                    Align(
                      alignment: Alignment.center,
                      child: Text(
                        'FEATURED PROJECTS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Quicksand',
                          fontSize: 12.sp,
                          color: _isDark ? Colors.tealAccent :
                            Colors.black
                        ),
                      ),
                    )
                  ],
                ),
                ProjectCarousel(),
                ContactInfo(dark: _isDark),
              ],
            ),
            
          ),
        ),
      )
      
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}

