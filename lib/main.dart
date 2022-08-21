import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/di/providers.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/home_screen.dart';
import 'package:shortstoryking3/view/login/screens/login_screen.dart';
import 'package:shortstoryking3/view_models/login_view_model.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

runApp(
MultiProvider(
providers: globalProviders,
child: MyApp(),
)
);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginViewModel = context.read<LoginViewModel>();

    return MaterialApp(
      title: "ShortStoryKing",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: Colors.blueGrey,
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
        builder: (context,AsyncSnapshot<bool> snapshot){
          if(snapshot.hasData && snapshot.data == true){
            return HomeScreen();
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}
