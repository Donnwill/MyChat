import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:my_chat/models/users.dart';

class AddUsers extends StatefulWidget {
  final String searchedUserName;
  AddUsers(this.searchedUserName);
  @override
  _AddUsersState createState() => _AddUsersState();
}

class _AddUsersState extends State<AddUsers> {
  Stream allUsersShapshot;
  List<Users> allUsersData;
  List<DocumentSnapshot> _allUsersDataDocument;
  List<Users> filteredUsers = [];

  getAllUsersData() {
    allUsersShapshot = FirebaseFirestore.instance.collection('users').snapshots();
  }

  filterSearchedUser(List<Users> allUsersData, String searchedUserName) {
    for (int i = 0; i < allUsersData.length; i++) {
      bool isUserNameSame = allUsersData[i].userName == searchedUserName;
      if (isUserNameSame) {
        filteredUsers.add(allUsersData[i]);
      } else {
        filteredUsers.remove(allUsersData[i]);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    getAllUsersData();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: allUsersShapshot,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          if (!snapshot.hasData) {
            return Container();
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container();
          }
          _allUsersDataDocument = snapshot.data.docs;
          allUsersData = _allUsersDataDocument.map((DocumentSnapshot usersCollectionFields) {
            return Users.fromMap(usersCollectionFields.data());
          }).toList();
          filterSearchedUser(allUsersData, widget.searchedUserName);

          return Expanded(
              child: (filteredUsers.isNotEmpty)
                  ? ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        var usersData = filteredUsers[index];

                        return FadeAnimation(
                          1,
                          ListTile(
                            onTap: () {
                              //implement view profile here
                            },
                            title: Text(
                              usersData.userName,
                              style: TextStyle(fontSize: 18),
                            ),
                            leading: (usersData.profilePic != "")
                                ? Image.network(usersData.profilePic)
                                : Image.asset("assets/default_image.png"),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  usersData.phoneNumber,
                                  style: TextStyle(fontSize: 15),
                                ),
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () async {},
                                      style: ElevatedButton.styleFrom(
                                          onPrimary: Color(0xff006699),
                                          shadowColor: Color(0xff006699),
                                          elevation: 18,
                                          padding: EdgeInsets.zero,
                                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            gradient:
                                                const LinearGradient(colors: [Color(0xff006699), Color(0xff00ccff)]),
                                            borderRadius: BorderRadius.circular(15)),
                                        child: Container(
                                          width: 95,
                                          height: 35,
                                          alignment: Alignment.center,
                                          child: const Text(
                                            'Add Friend',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
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
                      itemCount: filteredUsers.length,
                    )
                  : Center(
                      child: Text(
                        "User name does not match",
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff00ccff),
                        ),
                      ),
                    ));
        });
  }
}
