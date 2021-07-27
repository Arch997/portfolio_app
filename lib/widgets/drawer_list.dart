import 'package:flutter/material.dart';


// ignore: must_be_immutable
class DrawerList extends StatelessWidget {
  var action;

  DrawerList({
    Key? key,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        child: ListView(
          children: [
            IconButton(
              alignment: Alignment.centerRight,
              onPressed: () => Navigator.pop(context),
              icon: Icon(
                Icons.close,
              )
            ),
            Column(
              children: [
                ListTile(
                  onTap: () => action,
                  title: Text(
                    "INTRO",
                    style: TextStyle(
                      fontFamily: "Quicksand"
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'ABOUT',
                    style: TextStyle(
                      fontFamily: "Quicksand",
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'SERVICES',
                    style: TextStyle(
                      fontFamily: "Quicksand",
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'MY WORK',
                    style: TextStyle(
                      fontFamily: "Quicksand",
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'CONTACT',
                    style: TextStyle(
                      fontFamily: "Quicksand",
                    ),
                  ),
                )
              ]
            )
          ]
        )
      ),
    );
  }
}