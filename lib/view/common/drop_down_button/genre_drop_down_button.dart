import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/novel_view_model.dart';

class GenreDropDownButton extends StatefulWidget {
  final GenreDropDownButtonMode genreDropDownButtonMode;
  GenreDropDownButton({required this.genreDropDownButtonMode});

  @override
  State<GenreDropDownButton> createState() => _GenreDropDownButtonState();
}

class _GenreDropDownButtonState extends State<GenreDropDownButton> {
  List<DropdownMenuItem<String>> _genreItems = [];
  String _selectedGenre = "";

  @override
  void initState() {
    super.initState();
    setGenreItems();
    // switch (widget.genreDropDownButtonMode) {
    //   case GenreDropDownButtonMode.WRITING_GENRE_DROP_DOWN:
    //     final novelViewModel = context.read<NovelViewModel>();
    //     novelViewModel.selectedGenre = _genreItems[0].value!;
    //     break;
    //   case GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN:
    //     //TODO あとで直す。
    //     final novelViewModel = context.read<NovelViewModel>();
    //     novelViewModel.selectedGenre = _genreItems[0].value!;
    // }
  }

  void setGenreItems() {
    _genreItems
      ..add(DropdownMenuItem(
        value: "",
        child: Text(""),
      ))
      ..add(DropdownMenuItem(
        value: "恋愛",
        child: Text("恋愛"),
      ))
      ..add(DropdownMenuItem(
        value: "歴史・時代",
        child: Text("歴史・時代"),
      ))
      ..add(DropdownMenuItem(
        value: "ホラー",
        child: Text("ホラー"),
      ))
      ..add(DropdownMenuItem(
        value: "推理",
        child: Text("推理"),
      ))
      ..add(DropdownMenuItem(
        value: "日常",
        child: Text("日常"),
      ))
      ..add(DropdownMenuItem(
        value: "SF",
        child: Text("SF"),
      ))
      ..add(DropdownMenuItem(
        value: "ファンタジー",
        child: Text("ファンタジー"),
      ))
      ..add(DropdownMenuItem(
        value: "社会",
        child: Text("社会"),
      ))
      ..add(DropdownMenuItem(
        value: "奇妙・不思議",
        child: Text("奇妙・不思議"),
      ))
      ..add(DropdownMenuItem(
        value: "官能",
        child: Text("官能"),
      ))
      ..add(DropdownMenuItem(
        value: "その他",
        child: Text("その他"),
      ));
  }

  @override
  Widget build(BuildContext context) {
        return Row(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "ジャンル",
              style: TextStyle(fontSize: 30, fontFamily: NovelSararaBFont),
            ),
            SizedBox(
              width: 25,
            ),
            DropdownButton(
              elevation: 20,
              items: _genreItems,
              value: _selectedGenre,
              // value: novelViewModel.selectedGenre,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: NovelSararaBFont),
              onChanged: (String? selectedValue) {
                setState(() {
                  // novelViewModel.selectedGenre = selectedValue!;
                  _selectedGenre = selectedValue!;

                  switch (widget.genreDropDownButtonMode) {
                    case GenreDropDownButtonMode.WRITING_GENRE_DROP_DOWN:
                      final novelViewModel = context.read<NovelViewModel>();
                      novelViewModel.selectedGenre = selectedValue;
                      break;
                    case GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN:
                      //TODO あとで直す。
                      final novelViewModel = context.read<NovelViewModel>();
                      novelViewModel.selectedGenre = selectedValue;
                  }



                });
              },
            ),
          ],
        );

    }

    // final novelViewModel = context.read<NovelViewModel>();
  }

