import 'package:flutter/material.dart';
import 'package:my_chat/helper/fade_animation.dart';

class CustomContainer extends StatefulWidget {
  final Widget child;
  CustomContainer({@required this.child});

  @override
  _CustomContainerState createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        2,
        Container(
            width: double.infinity,
            height: 70,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                border: Border.all(color: Color(0xff006699), width: 1),
                boxShadow: const [
                  BoxShadow(color: Color(0xff006699), blurRadius: 10, offset: Offset(1, 1)),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20))),
            child: widget.child));
  }
}
