import 'package:flutter/material.dart';
import 'package:shortstoryking3/styles/textStyle.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Short Story King",
              style: loginTitleTextStyle,),
            SizedBox(height: 8.0,),

          ],
        )
      ),
    );
  }
}
