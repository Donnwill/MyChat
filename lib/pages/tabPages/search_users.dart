import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';

class SearchUser extends StatefulWidget {
  final Function showSearchList;
  final Function getSearchedUserName;
  SearchUser(this.showSearchList, this.getSearchedUserName);
  @override
  _SearchUserState createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  String searchedUserName;
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        2,
        Container(
          width: double.infinity,
          height: 55,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xff006699), width: 1),
              boxShadow: const [
                BoxShadow(color: Color(0xff006699), blurRadius: 10, offset: Offset(1, 1)),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(Icons.search_outlined),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: TextFormField(
                    maxLines: 1,
                    decoration: const InputDecoration(
                      labelText: " Search friends by user name",
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      border: InputBorder.none,
                    ),
                    onChanged: (userSearch) {
                      searchedUserName = userSearch;
                      widget.getSearchedUserName(searchedUserName);

                      if (userSearch != "") {
                        widget.showSearchList(true);
                      } else {
                        widget.showSearchList(false);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
