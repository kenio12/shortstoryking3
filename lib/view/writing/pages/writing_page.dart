import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/common/buttom_with_icon.dart';

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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontFamily: NovelSararaBFont, fontSize: 25),
                  controller: _titleController,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelText: "タイトル",
                    hintText: "ここに入力",
                  ),
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(fontFamily: NovelSararaRFont, fontSize: 21),
                  controller: _novelContentController,
                  maxLength: 10000,
                  decoration: InputDecoration(
                    labelText: "小説",
                    hintText: "ここに入力",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
