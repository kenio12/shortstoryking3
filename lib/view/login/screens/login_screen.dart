import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/home_screen.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //うまく認証できないので、とりあえずこうした。
    // Timer(
    //   Duration(seconds: 10),
    //   () => Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => HomeScreen(),
    //     ),
    //   ),
    // );

    return Scaffold(
      //TODO
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Short Story King",
            style: loginTitleTextStyle,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
            Buttons.Twitter,
            text: "ツイッターでログイン♪",
            onPressed: () => login(context),
          ),
        ],
      )),
    );
  }

  login(BuildContext context) async {
    final loginViewModel = context.read<LoginViewModel>();
    await loginViewModel.signIn();
    //  TODO
  }
}
