import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shortstoryking3/styles/eye_icons.dart';
import 'package:shortstoryking3/styles/textStyle.dart';

class WritingPage extends StatefulWidget {
  @override
  State<WritingPage> createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  final _titleController = TextEditingController();
  final _novelContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 19.0),
          child: SpeedDial(
            direction: SpeedDialDirection.down,
            backgroundColor: Colors.white70.withOpacity(0.2),
            animatedIcon: AnimatedIcons.menu_close,
            overlayColor: Colors.black54,
            children: [
              SpeedDialChild(
                child: Icon(Eye.eye),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "キーボドを消して、確認",
                labelStyle: TextStyle(color: Colors.black,fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.database),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "投稿せず、保存する",
                labelStyle: TextStyle(color: Colors.black,fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.plus),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "投稿する",
                labelStyle: TextStyle(color: Colors.black,fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontFamily: NovelSararaBFont, fontSize: 25),
                  controller: _titleController,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontFamily: NovelSararaBFont, color: Colors.black),
                    labelText: "タイトル",
                    hintText: "ここに入力",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                TextFormField(
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontFamily: NovelSararaRFont, fontSize: 21),
                  controller: _novelContentController,
                  maxLength: 10000,
                  decoration: InputDecoration(
                    // prefixIconColor: Colors.black,
                    // labelStyle: TextStyle(
                    //     fontFamily: NovelSararaBFont,
                    //     color: Colors.black,
                    //     fontSize: 25),
                    // labelText: "小説内容",
                    hintText: "小説ここに入力",
                    enabledBorder: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                // ElevatedButton.icon(
                //   style: ElevatedButton.styleFrom(
                //     primary: Colors.white70.withOpacity(0.2),
                //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
                //   ),
                //   icon: Icon(Eye.eye,color: Colors.black,),
                //   onPressed: ()=>FocusScope.of(context).unfocus(),
                //   label:const Text("登録",style: TextStyle(color: Colors.black),),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
