import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  PopupMenuItem popupMenuItemBuilder(IconData icon, String text, int value) {
    return PopupMenuItem(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              icon,
              color: Colors.black,
            ),
          ),
          Text(text),
        ],
      ),
      value: value,
    );
  }

// Color(0xff006699), Color(0xff00ccff)
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
              color: Color(0xff00ccff),
              onSelected: (value) {
                if (value == 2) {
                  //logOut
                } else {
                  //navigate to user profile page
                }
              },
              elevation: 10,
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.white70,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              icon: Image.asset(
                "assets/default_image.png",
                color: Colors.white,
                width: 30,
              ),
              itemBuilder: (context) => [
                    popupMenuItemBuilder(Icons.settings, "Settings", 1),
                    popupMenuItemBuilder(Icons.logout, "LogOut", 2),
                  ]),
        ],
        leading: Container(),
        iconTheme: new IconThemeData(color: Colors.white),
        centerTitle: true,
        title: Text("MyChat"),
        flexibleSpace: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: <Color>[Color(0xff006699), Color(0xff00ccff)])),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
    );
  }
}
