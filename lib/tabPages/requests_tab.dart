import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';
import 'package:my_chat/models/requests.dart';

class RequestsTab extends StatefulWidget {
  final List<Requests> requestsList;
  RequestsTab(this.requestsList);
  @override
  _RequestsTabState createState() => _RequestsTabState();
}

class _RequestsTabState extends State<RequestsTab> {
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
                        onPressed: () async {},
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
