import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/eye_icons.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/common/dialog/alert_dialog.dart';
import 'package:shortstoryking3/view_models/novel_view_model.dart';

class WritingPage extends StatefulWidget {
  final PersistentTabController persistentTabController;

  WritingPage({required this.persistentTabController});

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
                label: "キーボドを消して、確認する",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.database),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "保存だけする",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.plus),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "保存して、投稿する",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => _novel(context),
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
                    hintText: "小説ここに入力",
                    enabledBorder: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //TODO
  _novel(BuildContext context) async {
    String _novelTitle = _titleController.value.text;
    String _novelContent = _novelContentController.value.text;
    if (_novelTitle == "") {
      showAlertDialog(
        title: "おいおい",
        content: "タイトルないでー、やりなおしやー",
        context: context,
      );
    } else if (_novelContent == "") {
      showAlertDialog(
        title: "おいおい",
        content: "小説がないでー、やりなおしやー",
        context: context,
      );
    } else {
      final novelViewModel = context.read<NovelViewModel>();
      await novelViewModel.novelPosting(_novelTitle,_novelContent);
      widget.persistentTabController.jumpToTab(1);
      _titleController.clear();
      _novelContentController.clear();

    }
  }
}
