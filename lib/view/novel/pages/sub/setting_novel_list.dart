import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class SettingNovelList extends StatefulWidget {
  final BuildContext context;
  final FeedNovelMode feedNovelMode;
  final PersistentTabController persistentTabController;
  final FeedNovelViewModel model;

  SettingNovelList(
      {required this.context,
      required this.feedNovelMode,
      required this.persistentTabController,
      required this.model});

  @override
  State<SettingNovelList> createState() => _SettingNovelListState();
}

class _SettingNovelListState extends State<SettingNovelList> {
  final _titleSearchController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.black12,
              // borderRadius: BorderRadius.circular(20),
              border: Border(
                top: BorderSide(
                  width: 4
                ),
                  bottom: BorderSide(
                    width: 4
                  )
              )
            ),
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "設定画面",
                style: TextStyle(fontSize: 30),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: _titleSearchController,
            style: TextStyle(fontSize: 20),
            cursorColor: Colors.black,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                vertical: 30,
                horizontal: 20,
              ),
              // prefixIcon: Icon(Icons.search),
              // prefixIconColor: Colors.black,
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 22.0),
                child: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.search, size: 40),
                  onPressed: () => _SearchNovelFromTitle(_titleSearchController),
                ),
              ),
              suffixIconColor: Colors.black,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),

              labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
              labelText: '  タイトル頭文字による検索',
              floatingLabelStyle:
                  const TextStyle(fontSize: 20, color: Colors.black),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide(
                  color: Colors.black,
                  width: 3.0,
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.topRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: StadiumBorder(),
              ),
              onPressed: () => _finishSettingNovelList(context),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "設定終了",
                  style: TextStyle(fontSize: 30),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  _finishSettingNovelList(BuildContext context) {
    Navigator.pop(context);
  }

  _SearchNovelFromTitle(TextEditingController titleSearchController) {}
}
