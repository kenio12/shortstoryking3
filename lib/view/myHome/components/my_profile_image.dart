import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyProfileImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(60.0),
        child: Image.asset('assets/images/level1_avatar/baby2.png')
      ),
    );
  }
}
