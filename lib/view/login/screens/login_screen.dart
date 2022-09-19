import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/home_screen.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';

class LoginScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //TODO
      body: Center(child: Consumer<LoginViewModel>(
        builder: (context, model, child) {
          return model.isLoading
              ? CircularProgressIndicator()
              : Column(
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
                );
        },
      )),
    );
  }

  login(BuildContext context) async {
    final loginViewModel = context.read<LoginViewModel>();
    await loginViewModel.signIn();
    if (!loginViewModel.isSuccessful) {
      Fluttertoast.showToast(msg: "サインイン失敗");
      return;
    }
    _openHomeScreen(context);
  }

  void _openHomeScreen(BuildContext context) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
              (route) => false);

    // Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //     builder: (_) => HomeScreen(),
    //   ),
    // );
  }
}
