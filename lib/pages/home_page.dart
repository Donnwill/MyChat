import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/helper/authentication.dart';
import 'package:my_chat/models/users.dart';
import 'package:my_chat/pages/loginAndRegister/login_register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Stream documentStream;
  SharedPreferences prefs;
  Users users;

  String uid;
  bool loading = true;
  @override
  void initState() {
    getUserData();
    super.initState();
  }

  getUserData() async {
    prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("Uid");
    print(uid);
    setState(() {
      documentStream = FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
    });
  }

  PopupMenuItem popupMenuItemBuilder(IconData icon, String text, int value) {
    return PopupMenuItem(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 8.0),
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
      value: value,
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            ),
            Tab(
              text: "REQUESTS",
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
        body: StreamBuilder<DocumentSnapshot>(
            stream: documentStream,
            builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
              if (snapshot.hasError) {
                return Container();
              }
              if (!snapshot.hasData) {
                return Container();
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Container();
              }

              var value = snapshot.data;
              users = Users.fromMap(value.data());

              // print(users.friends);

              return TabBarView(
                  children: <Widget>[Text(users.phoneNumber), Text("Global"), Text("Friends"), Text("Requests")]);
            }),
      ),
    );
  }
}
