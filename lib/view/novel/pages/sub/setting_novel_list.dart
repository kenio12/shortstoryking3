import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/common/drop_down_button/genre_drop_down_button.dart';
import 'package:shortstoryking3/view/common/drop_down_button/word_count_drop_down_button.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';

class SettingNovelList extends StatefulWidget {
  final BuildContext context;
  final FeedNovelMode feedNovelMode;
  final PersistentTabController persistentTabController;

  SettingNovelList({
    required this.context,
    required this.feedNovelMode,
    required this.persistentTabController,
  });

  @override
  State<SettingNovelList> createState() => _SettingNovelListState();
}

class _SettingNovelListState extends State<SettingNovelList> {
  final _titleSearchController = TextEditingController();

  @override
  void initState() {
    _titleSearchController.addListener(() {
      _onTitleUpDated();
    });
    super.initState();
  }

  @override
  void dispose() {
    _titleSearchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedNovelViewModel>(builder: (context, model, child) {
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
                      "???????????????",
                      style: TextStyle(fontSize: 30, letterSpacing: 20),
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
                  onFieldSubmitted: (String? value) {
                    print(value);
                    _searchNovelFromTitle();
                  },
                  // keyboardType: TextInputType.multiline,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  maxLength: 30,
                  // maxLines: null,
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
                        onPressed: () => _searchNovelFromTitle(),
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
                    labelText: '  ????????????????????????????????????',
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
                    "?????????????????????",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  children: [
                    GenreDropDownButton(genreDropDownButtonMode:
                    GenreDropDownButtonMode.FEED_GENRE_DROP_DOWN,),
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
                    onPressed: () => _novelsSearchedByMultipleConditions(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "??????",
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
              //       onPressed: () => _novelsSearchedByMultipleConditions(),
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
                    onPressed: () => _AllNovelList(),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        "?????????????????????",
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
                        "?????????",
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

  _onTitleUpDated() {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    // if (feedNovelViewModel.selectedTitle != "" && _titleSearchController.text == "")
    //   {
    //     _titleSearchController.text = feedNovelViewModel.selectedTitle;
    //   }
    feedNovelViewModel.selectedTitle = _titleSearchController.text;
    // print("${feedNovelViewModel.title}");
  }

  _searchNovelFromTitle() async {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    await feedNovelViewModel.getNovels(FeedNovelMode.SELECTED_NOVELS, null);
    Navigator.pop(context);
  }

  _novelsSearchedByMultipleConditions() async{
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    await feedNovelViewModel.getNovels(FeedNovelMode.SEARCHED_BY_MULTIPLE_NOVELS, null);
    Navigator.pop(context);
  }

  _AllNovelList() async {
    final feedNovelViewModel = context.read<FeedNovelViewModel>();
    await feedNovelViewModel.getNovels(FeedNovelMode.ALL_NOVELS, null);
    Navigator.pop(context);
  }
}
