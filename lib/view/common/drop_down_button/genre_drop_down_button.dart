import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view_models/drop_button_view_model.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/novel_view_model.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

class GenreDropDownButton extends StatefulWidget {
  final GenreDropDownButtonMode genreDropDownButtonMode;
  late final bool reset;
  static bool genre_reset = false;

  GenreDropDownButton(
      {required this.reset, required this.genreDropDownButtonMode});

  @override
  State<GenreDropDownButton> createState() => _GenreDropDownButtonState();
}

//実験
class _GenreDropDownButtonState extends State<GenreDropDownButton> {
  List<DropdownMenuItem<String>> _genreItems = [];
  String _selectedGenre = "";

  @override
  void initState() {
    super.initState();
    setGenreItems();

    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    if (widget.genreDropDownButtonMode ==
            GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN &&
        feedNovelViewModel.selectedGenre != "") {
      _selectedGenre = feedNovelViewModel.selectedGenre;
      setState(() {
        _selectedGenre = "";
      });
    }

    final writerViewModel = context.read<WriterViewModel>();
    if (widget.genreDropDownButtonMode ==
            GenreDropDownButtonMode.WRITER_GENRE_DROP_DOWN &&
        writerViewModel.selectedGenre != "") {
      _selectedGenre = writerViewModel.selectedGenre;
      setState(() {
        _selectedGenre = "";
      });
    }

    writerViewModel.selectedGenre = feedNovelViewModel.selectedGenre;
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
    final novelViewModel = context.read<NovelViewModel>();
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    final writerViewModel = context.read<WriterViewModel>();
    // bool genre_reset = false;
    if (GenreDropDownButton.genre_reset == false) {
      GenreDropDownButton.genre_reset = true;
    } else if (GenreDropDownButton.genre_reset == true) {
      GenreDropDownButton.genre_reset = false;
    }
    // bool genre_reset = widget.reset;
    // print("なんやああ${genre_reset}");
    if (GenreDropDownButton.genre_reset == true) {
      setState(() {
        _selectedGenre = "";
      });
    }
    ;
    // } else if (feedNovelViewModel.selectedGenre == "" && _selectedGenre == "") {
    //   // setState(() {
    //     _selectedGenre = "";
    //   // });
    // } else if (writerViewModel.selectedGenre == "" && _selectedGenre == "") {
    //   // setState(() {
    //     _selectedGenre = "";
    //   // });
    // };
    //
    // // if reset {};

    // switch (widget.genreDropDownButtonMode) {
    //   case GenreDropDownButtonMode.WRITING_GENRE_DROP_DOWN:
    //     return Consumer<NovelViewModel>(

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

        change_dropdown_button(widget.genreDropDownButtonMode),

        // break;

        //   case GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN:
        // Consumer<feedNovelViewModel>(
        // builder: (BuildContext context, model, Widget? child) {
        // return DropdownButton(
        // elevation: 20,
        // items: _genreItems,
        // value: model.selectedGenre,
        // style: TextStyle(
        // fontSize: 30,
        // color: Colors.black,
        // fontFamily: NovelSararaBFont),
        // onChanged: (String? selectedValue) {
        // setState(
        // () {
        // model.selectedGenre = selectedValue!;
        // });
        // },
        // );
        // },
        // ),

        //
        // },
      ],
    );
  }

  change_dropdown_button(GenreDropDownButtonMode genreDropDownButtonMode) {

    switch (widget.genreDropDownButtonMode) {
      case GenreDropDownButtonMode.WRITING_GENRE_DROP_DOWN:
        return Consumer<NovelViewModel>(
          builder: (BuildContext context, model, Widget? child) {
            return DropdownButton(
              elevation: 20,
              items: _genreItems,
              value: model.selectedGenre,
              // value: novelViewModel.selectedGenre,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: NovelSararaBFont),
              onChanged: (String? selectedValue) {
                setState(() {
                  // novelViewModel.selectedGenre = selectedValue!;
                  model.selectedGenre = selectedValue!;
                });
              },
            );
          },
        );
        break;
      case GenreDropDownButtonMode.WRITER_GENRE_DROP_DOWN:
        return Consumer<WriterViewModel>(
          builder: (BuildContext context, model, Widget? child) {
            return DropdownButton(
              elevation: 20,
              items: _genreItems,
              value: model.selectedGenre,
              // value: novelViewModel.selectedGenre,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: NovelSararaBFont),
              onChanged: (String? selectedValue) {
                setState(() {
                  // novelViewModel.selectedGenre = selectedValue!;
                  model.selectedGenre = selectedValue!;
                });
              },
            );
          },
        );
        break;
      case GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN:
        return Consumer<FeedNovelViewModel>(
          builder: (BuildContext context, model, Widget? child) {
            return DropdownButton(
              elevation: 20,
              items: _genreItems,
              value: model.selectedGenre,
              // value: novelViewModel.selectedGenre,
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontFamily: NovelSararaBFont),
              onChanged: (String? selectedValue) {
                setState(() {
                  // novelViewModel.selectedGenre = selectedValue!;
                  model.selectedGenre = selectedValue!;
                });
              },
            );
          },
        );
        break;
      default:
        return Container();
        break;
    }

  }

// final novelViewModel = context.read<NovelViewModel>();
}
// if (_selectedGenre != ""){
//   GenreDropDownButton.genre_reset = true;
// };

// switch (widget.genreDropDownButtonMode) {
//   case GenreDropDownButtonMode.WRITING_GENRE_DROP_DOWN:
//     novelViewModel.selectedGenre = selectedValue;
//     break;
//   case GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN:
//     feedNovelViewModel.selectedGenre = selectedValue;
//     break;
//   case GenreDropDownButtonMode.WRITER_GENRE_DROP_DOWN:
//     writerViewModel.selectedGenre = selectedValue;
//     break;
//   case GenreDropDownButtonMode.CLEAR:
//     setState(() {
//       _selectedGenre = "";
//     });
//     break;
// }

//
// },
// );
// },
// ),
// },
//       ],
//     );

//   break;
// case GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN:
//
//   break;
// case GenreDropDownButtonMode.WRITER_GENRE_DROP_DOWN:
//
//   break;
// case GenreDropDownButtonMode.CLEAR:
//   setState(() {
//     _selectedGenre = "";
//   });
//   break;
