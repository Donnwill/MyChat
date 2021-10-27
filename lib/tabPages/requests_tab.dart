import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:my_chat/models/requests.dart';
import 'package:my_chat/models/users.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestsTab extends StatefulWidget {
  final List<Requests> requestsList;
  RequestsTab(this.requestsList);
  @override
  _RequestsTabState createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
  SharedPreferences prefs;
  String uid;
  Users currentUser;
  DocumentSnapshot documentSnapshot;

  acceptRequest(Requests friendRequest, Users currentUser) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users_friends');
    CollectionReference requestedUser = FirebaseFirestore.instance.collection('users_friends');

    users.doc(uid).update({
      'friends': FieldValue.arrayUnion([
        {
          "userName": friendRequest.userName,
          "phoneNumber": friendRequest.phoneNumber,
          "userUid": friendRequest.userUid,
          "profilePic": friendRequest.profilePic
        }
      ])
    });

    requestedUser.doc(friendRequest.userUid).update({
      'friends': FieldValue.arrayUnion([
        {
          "userName": currentUser.userName,
          "phoneNumber": currentUser.phoneNumber,
          "userUid": uid,
          "profilePic": currentUser.profilePic
        }
      ])
    });
  }

  getUserData() async {
    prefs = await SharedPreferences.getInstance();
    uid = prefs.getString("Uid");
    print(uid);
    documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(uid).get();

    setState(() {
      currentUser = Users.fromMap(documentSnapshot.data());
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: [Color(0xffF5FCFF), Color(0xffDBF3FA)], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var requests = widget.requestsList[index];
          return FadeAnimation(
            1.5,
            ListTile(
              title: Text(
                requests.userName,
                style: TextStyle(fontSize: 18),
              ),
              leading: (requests.profilePic != "")
                  ? Image.network(requests.profilePic)
                  : Image.asset("assets/default_image.png"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    requests.phoneNumber,
                    style: TextStyle(fontSize: 15),
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          await acceptRequest(widget.requestsList[index], currentUser);
                        },
                        style: ElevatedButton.styleFrom(
                            onPrimary: Color(0xff57C84D),
                            shadowColor: Color(0xff57C84D),
                            elevation: 18,
                            padding: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                        child: Ink(
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(colors: [Color(0xff57C84D), Color(0xffABE098)]),
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            width: 75,
                            height: 35,
                            alignment: Alignment.center,
                            child: const Text(
                              'Accept',
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              onPrimary: Color(0xffDC1C13),
                              shadowColor: Color(0xffDC1C13),
                              elevation: 18,
                              padding: EdgeInsets.zero,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                          child: Ink(
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(colors: [Color(0xffDC1C13), Color(0xffF1959B)]),
                                borderRadius: BorderRadius.circular(15)),
                            child: Container(
                              width: 75,
                              height: 35,
                              alignment: Alignment.center,
                              child: const Text(
                                'Reject',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
        itemCount: widget.requestsList.length,
      ),
    );
  }
}
