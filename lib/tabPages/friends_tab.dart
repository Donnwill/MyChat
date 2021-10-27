import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:my_chat/models/friends.dart';

class FriendsTab extends StatefulWidget {
  final List<Friends> friendsList;
  FriendsTab(this.friendsList);
  @override
  _FriendsTabState createState() => _FriendsTabState();
}

class _FriendsTabState extends State<FriendsTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        var friends = widget.friendsList[index];
        return FadeAnimation(
          1.5,
          ListTile(
            title: Text(friends.userName, style: TextStyle(fontSize: 18)),
            leading: (friends.profilePic != "")
                ? Image.network(friends.profilePic)
                : Image.asset("assets/default_image.png"),
            subtitle: Text(friends.phoneNumber, style: TextStyle(fontSize: 15)),
            trailing: ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                  onPrimary: Color(0xff006699),
                  shadowColor: Color(0xff006699),
                  elevation: 18,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
              child: Ink(
                decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xff006699), Color(0xff00ccff)]),
                    borderRadius: BorderRadius.circular(15)),
                child: Container(
                  width: 75,
                  height: 35,
                  alignment: Alignment.center,
                  child: const Text(
                    'View',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: widget.friendsList.length,
    );
  }
}
