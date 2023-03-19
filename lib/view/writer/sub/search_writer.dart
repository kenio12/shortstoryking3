import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/common/drop_down_button/genre_drop_down_button.dart';
import 'package:shortstoryking3/view/common/drop_down_button/word_count_drop_down_button.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
import 'package:shortstoryking3/view_models/writer_view_model.dart';

import '../../../view_models/writer_view_model.dart';
import '../../../view_models/writer_view_model.dart';

class SearchWriter extends StatefulWidget {
  final BuildContext context;
  final PersistentTabController persistentTabController;

  SearchWriter({
    required this.context,
    required this.persistentTabController,
  });

  @override
  State<SearchWriter> createState() => _SearchWriter();
}

class _SearchWriter extends State<SearchWriter> {
  final _writerSearchController = TextEditingController();

  @override
  void initState() {
    _writerSearchController.addListener(() {
      _onWriterNameUpDated();
    });
    super.initState();
  }

  @override
  void dispose() {
    _writerSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WriterViewModel>(builder: (context, model, child) {
      if (model.isFeedNovel) {
        Future(() {
          Navigator.pop(context);
        });
      }

      return GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 18) {
            Navigator.pop(context);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 60),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      // borderRadius: BorderRadius.circular(20),
                      border: Border(
                          top: BorderSide(width: 4),
                          bottom: BorderSide(width: 4))),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "作家の検索",
                      style: TextStyle(fontSize: 30, letterSpacing: 20),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "複合条件の検索",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  onFieldSubmitted: (String? value) {
                    print(value);
                    // _searchWriterFromWriterName();
                  },
                  // keyboardType: TextInputType.multiline,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  maxLength: 30,
                  // maxLines: null,
                  controller: _writerSearchController,
                  style: TextStyle(fontSize: 20),
                  cursorColor: Colors.black,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 30,
                      horizontal: 20,
                    ),
                    // prefixIcon: Icon(Icons.search),
                    // prefixIconColor: Colors.black,
                    //TODO 消した
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.only(right: 22.0),
                    //   child: IconButton(
                    //     color: Colors.black,
                    //     icon: Icon(Icons.search, size: 40),
                    //     onPressed: () => _searchWriterFromWriterName(),
                    //   ),
                    // ),
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
                    labelText: '作家の頭文字による検索',
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

              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    GenreDropDownButton(genreDropDownButtonMode:
                    GenreDropDownButtonMode.WRITER_GENRE_DROP_DOWN, selectedGenre: '', onChanged: (String? selectedValue) {  },),
                    WordCountDropDownButton(),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  // alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    onPressed: () => _writerSearchedByMultipleConditions(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "検　索",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(right: 22.0),
              //   child: Container(
              //     alignment: Alignment.center,
              //     child: IconButton(
              //       color: Colors.black,
              //       icon: Icon(Icons.search, size: 50),
              //       onPressed: () => _writerSearchedByMultipleConditions(),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Divider(
                  color: Colors.black,
                  thickness: 3,
                ),
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  // alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    onPressed: () async{
                      await model.getWriter(FeedWriterMode.All_Writer, null);
                      Navigator.pop(context);
                      _writerSearchController.text = "";
                      GenreDropDownButton(genreDropDownButtonMode: GenreDropDownButtonMode.CLEAR, selectedGenre: '', onChanged: (String? selectedValue) {  },);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "全　員　検　索",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: double.infinity,
                  // alignment: Alignment.topRight,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: StadiumBorder(),
                    ),
                    onPressed: () => _finishSettingNovelList(context),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "戻　る",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      );
    });
  }

  _finishSettingNovelList(BuildContext context) {
    Navigator.pop(context);
  }

  _onWriterNameUpDated() {
    final writerViewModel = context.read<WriterViewModel>();
    // if (feedNovelViewModel.selectedTitle != "" && _titleSearchController.text == "")
    //   {
    //     _titleSearchController.text = feedNovelViewModel.selectedTitle;
    //   }
    writerViewModel.selectedWriterName = _writerSearchController.text;
    // print("${feedNovelViewModel.title}");
  }

  // _searchWriterFromWriterName() async {
  //   final writerViewModel = context.read<WriterViewModel>();
  //   await writerViewModel.get(FeedNovelMode.SELECTED_NOVELS, null);
  //   Navigator.pop(context);
  // }

  _writerSearchedByMultipleConditions() async{
    final writerViewModel = context.read<WriterViewModel>();
    await writerViewModel.writerSearchedByMultipleConditions();
    Navigator.pop(context);
    _writerSearchController.text = "";
    GenreDropDownButton(genreDropDownButtonMode: GenreDropDownButtonMode.CLEAR, selectedGenre: '', onChanged: (String? selectedValue) {  },);
  }


}
