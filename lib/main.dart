import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:shortstoryking3/di/providers.dart';
import 'package:shortstoryking3/firebase_options.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/home_screen.dart';
import 'package:shortstoryking3/view/login/screens/login_screen.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: globalProviders,
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();

    return MaterialApp(
      //responsive_framework　レスポンシブになるパッケージらしく、面白がって入れてみたが、効果がよくわからん（笑）
      builder: (context,child) => ResponsiveWrapper.builder(
      child,
        maxWidth: 1200,
        minWidth: 480,
          defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
      ),
      initialRoute: "/",
      //ここまでがレスポンシブのコードだが、よく分からん。

      title: "ShortStoryKing",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.grey,
          ),
        ),
        primaryIconTheme: IconThemeData(
          color: Colors.orangeAccent,
        ),
        iconTheme: IconThemeData(color: Colors.pinkAccent),
        fontFamily: BoldFont,
      ),
      home: FutureBuilder(
        future: loginViewModel.isSighIn(),
        builder: (context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data == true) {
            return GestureDetector(
                onTap:() => primaryFocus?.unfocus(),
                child: HomeScreen(),);
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
