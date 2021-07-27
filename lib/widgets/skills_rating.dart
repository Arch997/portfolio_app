import 'package:flutter/material.dart';

import 'package:portfolio_app/utils.dart';


class SkillsRating extends StatefulWidget {
  @override
  _SkillsRatingState createState() => _SkillsRatingState();
}


class _SkillsRatingState extends State<SkillsRating> {
  final Color background = Colors.white;
  final Color fill = Colors.green[300] as Color;
  late final List<Color> gradient;
  final double fillPercent = 56;
  late final double fillStop;
  List<double>? _fillerStops;

  @override
  void initState() {
    super.initState();
    gradient = [
      background,
      background,
      fill,
      fill
    ];
    fillStop = (100 - fillPercent) / 100;
    _fillerStops = [0.0, fillStop, fillStop, 1.0];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.w),
      child: Column(
        children: [
          Text(
            "FLUTTER",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 15.sp,
              letterSpacing: 1.0
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h
            ),
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                // color: Colors.green,
                gradient: LinearGradient(
                  colors: gradient,
                  stops: _fillerStops,
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(10.r)
              ),
            ),
          ),
          Text(
            'PYTHON',
            style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 15.sp,
              letterSpacing: 1.0
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h
            ),
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                // color: Colors.green,
                gradient: LinearGradient(
                  colors: gradient,
                  stops: _fillerStops,
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(10)
              ),
            ),
          ),
          Text(
            'REACTJS',
            style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 15.sp,
              letterSpacing: 1.0
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h
            ),
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                // color: Colors.green,
                gradient: LinearGradient(
                  colors: gradient,
                  stops: _fillerStops,
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(10.r)
              ),
            ),
          ),
          Text(
            'DJANGO',
            style: TextStyle(
              fontFamily: "Quicksand",
              fontSize: 15.sp,
              letterSpacing: 1.0
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 4.h
            ),
            child: Container(
              height: 25.h,
              decoration: BoxDecoration(
                // color: Colors.green,
                gradient: LinearGradient(
                  colors: gradient,
                  stops: _fillerStops,
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight
                ),
                borderRadius: BorderRadius.circular(10.r)
              ),
            ),
          ),
          SizedBox(height: 25.h,)
        ],
      ),
    );
  }
}