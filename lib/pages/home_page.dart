import 'package:flutter/material.dart';
import 'package:my_chat/helper/authentication.dart';
import 'package:my_chat/pages/loginAndRegister/login_register_page.dart';

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
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(indicatorColor: Colors.white, tabs: [
            Tab(
              text: "CHATS",
            ),
            Tab(
              text: "GLOBAL",
            ),
            Tab(
              text: "FRIENDS",
            )
          ]),
          actions: [
            PopupMenuButton(
                color: Color(0xff00ccff),
                onSelected: (value) async {
                  if (value == 2) {
                    bool shouldNavigate = await signOut();
                    if (shouldNavigate) {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginRegisterPage()));
                    }
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
          child: TabBarView(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[Text("Chats"), Text("Global"), Text("Friends")]
              // TabBarView(children: [Text("data")]),
              // TabBarView(children: [Text("data")])

              ),
        ),
      ),
    );
  }
}
