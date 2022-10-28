import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/novel_view_model.dart';

class WordCountDropDownButton extends StatefulWidget {
  @override
  State<WordCountDropDownButton> createState() =>
      _WordCountDropDownButtonState();
}

class _WordCountDropDownButtonState extends State<WordCountDropDownButton> {
  List<DropdownMenuItem<String>> _genreItems = [];
  String _selectedGenre = "最大10,000文字数内";

  @override
  void initState() {
    super.initState();
    setGenreItems();
  }

  void setGenreItems() {
    _genreItems
      ..add(
        DropdownMenuItem(
          value: "最大10,000文字数内",
          child: Text("最大10,000文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "5,000文字数内",
          child: Text("5,000文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "3,000文字数内",
          child: Text("3,000文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "2,000文字数内",
          child: Text("2,000文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "1,000文字数内",
          child: Text("1,000文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "500文字数内",
          child: Text("500文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "200文字数内",
          child: Text("200文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "100文字数内",
          child: Text("100文字数内"),
        ),
      )
      ..add(
        DropdownMenuItem(
          value: "50文字数内",
          child: Text("50文字数内"),
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          height: 20,
        ),
        Text(
          "文字数",
          style: TextStyle(fontSize: 30, fontFamily: NovelSararaBFont),
        ),
        SizedBox(
          width: 25,
        ),
        DropdownButton(
          elevation: 20,
          items: _genreItems,
          value: _selectedGenre,
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontFamily: NovelSararaBFont),
          onChanged: (String? selectedValue) {
            setState(() {
              _selectedGenre = selectedValue!;
              final feedNovelViewModel = context.read<FeedNovelViewModel>();
              feedNovelViewModel.selectedWordCount = selectedValue;
            });
          },
        ),
      ],
    );
  }
}
