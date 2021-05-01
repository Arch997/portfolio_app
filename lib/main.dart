
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      title: 'Portfolio App',
      home: PortfolioApp(title: 'My Portfolio Page'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PortfolioApp extends StatefulWidget {
  PortfolioApp({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _PortfolioAppState createState() => _PortfolioAppState();
}

class _PortfolioAppState extends State<PortfolioApp> 
    with SingleTickerProviderStateMixin {

  late AnimationController _controller;
  late Animation _colorAnim;

  bool _isDark = false;

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

  List<double> _stops = [0.0, 0.7];

  ThemeData _light = ThemeData.light().copyWith(
    primaryColor: Colors.green,
  );
  ThemeData _dark = ThemeData.dark().copyWith(
    primaryColor: Colors.black87.withOpacity(1),
  );
  
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 3000),
      debugLabel: 'Name Animation',
    )
    ..forward()
    ..repeat()
    .whenComplete(() => setState(() {}));

    _colorAnim = bgColor.animate(_controller);
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: _dark,
      theme: _light,
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey,
          title: Text(
            'Charles\' Portfolio',
            textDirection: TextDirection.ltr,
          ),
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {},
            child: Switch.adaptive(
              value: _isDark,
              onChanged: (v) {
                setState(() => _isDark = !_isDark);
              },
            ),
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()
            ),
            controller: _scroll,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 300,
                  margin: EdgeInsets.only(bottom: 10.0),
                  padding: EdgeInsets.only(right: 30.0, top: 10),
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    foregroundColor: Colors.black,
                    radius: 50.0,
                    backgroundImage: AssetImage(
                      'assets/images/cartoon_avi.png',
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    "HI THERE \u{1F44B}, I'M ",
                    textDirection: TextDirection.ltr,
                    style: TextStyle(
                      fontFamily: 'Montserrat',
                      fontSize: 9,
                      color: _isDark ? Colors.white : Colors.blue,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Wrap(
                  verticalDirection: VerticalDirection.down,
                  alignment: WrapAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 8.0,
                        top: 5.0,
                        right: 180.0,
                        left: 10
                      ),
                      child: AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          return Text(
                            'charles.',
                            textDirection: TextDirection.ltr,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              color: _colorAnim.value,
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              fontFamily: 'Raleway Regular',
                              letterSpacing: 1.0,
                            )
                          );
                        }),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: 8,
                        right: 8,
                      ),
                      child: Text(
                        """A full stack software developer from Nigeria, focused on building web products and learning its architecture. I've only recently picked up Flutter for cross-platform development. Here's to hoping my design chops can also be activated on this journey \u{1f942}.
                        """,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Bahij Janna',
                          letterSpacing: 0.5,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                        left: 10,
                        right: 10,
                      ),
                      child: Text(
                        'FEATURED PROJECTS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Raleway Regular',
                          fontSize: 10,
                          color: _isDark ? Colors.tealAccent :
                            Colors.black87.withOpacity(1)
                        ),
                      ),
                    )
                  ],
                ),

                Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      //padding: EdgeInsets.all(50),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [Colors.pinkAccent, Colors.red],
                          stops: _stops,
                        )
                        ),
                      child: Column(
                        children: [
                           IconButton(
                            icon: Image.asset(
                              'assets/images/github-mark.png',
                              scale: 8.0,
                            ),
                            alignment: Alignment.topRight,
                            onPressed: () {},
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                              right: 8.0,
                              top: 8.0,
                              left: 230.0
                            ),
                          ),
                          Text(
                            'Email MicroApi',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black87.withOpacity(1),
                            ),
                          )
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.all(15),
                      //padding: EdgeInsets.all(50),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                            colors: [Colors.deepOrange, Colors.yellow],
                            stops: _stops
                          ) 
                        ),
                      child: Column(
                        children: [
                           IconButton(
                            icon: Image.asset(
                              'assets/images/github-mark.png',
                              scale: 8.0,
                            ),
                            alignment: Alignment.topRight,
                            onPressed: () {},
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                              right: 8.0,
                              top: 8.0,
                              left: 230.0
                            ),
                          ),
                          Text(
                            'Learning Logs',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black87.withOpacity(1),
                            ),
                          )
                        ],
                      )
                    ),

                    Container(
                      margin: EdgeInsets.all(15),
                      width: double.infinity,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.lime],
                          stops: _stops
                        )
                      ),
                      child: Column(
                        children: [
                           IconButton(
                            icon: Image.asset(
                              'assets/images/github-mark.png',
                              scale: 8.0,
                            ),
                            alignment: Alignment.topRight,
                            onPressed: () {},
                            padding: EdgeInsets.only(
                              bottom: 50.0,
                              right: 8.0,
                              top: 8.0,
                              left: 230.0
                            ),
                          ),
                          Text(
                            'Haggle - Ecommerce App',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                              color: Colors.black87.withOpacity(1),
                            ),
                          )
                        ],
                      )
                    ),
                  ],
                ),
                SizedBox(height: 10.0),

                Padding(
                  padding: EdgeInsets.only(
                    top: 50,
                    left: 10,
                    right: 250,
                    bottom: 5
                  ),
                  child: Text(
                    'CONTACT',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Raleway Regular',
                      fontSize: 10,
                      color: _isDark ? Colors.tealAccent :
                      Colors.black87.withOpacity(1)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30,
                    left: 10,
                    right: 250,
                    bottom: 1
                  ),
                  child: Text(
                    'EMAIL',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Raleway Regular',
                      fontSize: 10,
                      color: _isDark ? Colors.tealAccent :
                        Colors.black87.withOpacity(1)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 100,
                    bottom: 20,
                  ),
                  child: Text(
                    'archibongc4@gmail.com',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Bahij Janna'
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8.0,
                    right: 250,
                    bottom: 10,
                  ),
                  child: Text(
                    'PHONE',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Raleway Regular',
                      fontSize: 10,
                      color: _isDark ? Colors.tealAccent :
                        Colors.black87.withOpacity(1)
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 150,
                    bottom: 10,
                  ),
                  child: Text(
                    '+(234) 8117384652',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Bahij Janna',
                    ),
                  )
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 250,
                    bottom: 10,
                  ),
                  child: Text(
                    'GITHUB',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Raleway Regular',
                      fontSize: 10,
                      color: _isDark ? Colors.tealAccent : 
                        Colors.black87.withOpacity(1),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 8,
                    right: 100,
                    bottom: 30,
                  ),
                  child: Text(
                    'https://github.com/Arch997',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontWeight: FontWeight.w900
                    ),
                  )
                )
              ],
            ),
            
          ),
        ),
      )
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

