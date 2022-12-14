import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/styles/eye_icons.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/utils/constants.dart';
import 'package:shortstoryking3/view/common/dialog/alert_dialog.dart';
import 'package:shortstoryking3/view/common/drop_down_button/genre_drop_down_button.dart';
import 'package:shortstoryking3/view/novel/pages/feed_novel_page.dart';
import 'package:shortstoryking3/view_models/feed_novel_view_model.dart';
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
  List<DropdownMenuItem<String>> _genreItems = [];

  // String _selectedGenre = "";

  @override
  void initState() {
    super.initState();
    setGenreItems();
    final novelViewModel = context.read<NovelViewModel>();
    novelViewModel.selectedGenre = _genreItems[0].value!;
    _titleController.addListener(() {
      novelViewModel.writingNovelTitle = _titleController.text;
    });
    _novelContentController.addListener(() {
      novelViewModel.writingNovelContent = _novelContentController.text;
    });
    // selectedGenre = genreItems[0].value!;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _novelContentController.dispose();
    super.dispose();
  }

  void setGenreItems() {
    _genreItems
      ..add(DropdownMenuItem(
        value: "",
        child: Text(""),
      ))
      ..add(DropdownMenuItem(
        value: "??????",
        child: Text("??????"),
      ))
      ..add(DropdownMenuItem(
        value: "???????????????",
        child: Text("???????????????"),
      ))
      ..add(DropdownMenuItem(
        value: "?????????",
        child: Text("?????????"),
      ))
      ..add(DropdownMenuItem(
        value: "??????",
        child: Text("??????"),
      ))
      ..add(DropdownMenuItem(
        value: "??????",
        child: Text("??????"),
      ))
      ..add(DropdownMenuItem(
        value: "SF",
        child: Text("SF"),
      ))
      ..add(DropdownMenuItem(
        value: "??????????????????",
        child: Text("??????????????????"),
      ))
      ..add(DropdownMenuItem(
        value: "??????",
        child: Text("??????"),
      ))
      ..add(DropdownMenuItem(
        value: "??????????????????",
        child: Text("??????????????????"),
      ))
      ..add(DropdownMenuItem(
        value: "??????",
        child: Text("??????"),
      ))
      ..add(DropdownMenuItem(
        value: "?????????",
        child: Text("?????????"),
      ));
  }

  @override
  Widget build(BuildContext context) {
    // //??????????????????????????????????????????????????????????????????????????????????????????
    // final feedNovelViewModel = context.read<FeedNovelViewModel>();
    final novelViewModel = context.read<NovelViewModel>();

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
                label: "???????????????????????????????????????",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.database),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "??????????????????",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => FocusScope.of(context).unfocus(),
              ),
              SpeedDialChild(
                child: FaIcon(FontAwesomeIcons.plus),
                backgroundColor: Colors.white70.withOpacity(0.5),
                label: "???????????????????????????",
                labelStyle: TextStyle(color: Colors.black, fontSize: 18),
                labelBackgroundColor: Colors.transparent,
                onTap: () => _novel(context),
                //  ???????????????????????????????????????????????????????????????????????????????????????
                //   onTap: () => _novel(context,feedNovelViewModel),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              children: [
                    GenreDropDownButton(
                      genreDropDownButtonMode:
                      GenreDropDownButtonMode.WRITING_GENRE_DROP_DOWN,
                    ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  // autofocus: true,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  inputFormatters: [
                    FilteringTextInputFormatter.singleLineFormatter
                  ],
                  maxLines: null,
                  style: TextStyle(fontFamily: NovelSararaBFont, fontSize: 35),
                  controller: _titleController,
                  maxLength: 30,
                  decoration: InputDecoration(
                    labelStyle: TextStyle(
                        fontFamily: NovelSararaBFont, color: Colors.black),
                    // labelText: "????????????",
                    hintText: "??????????????????????????????",
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 2),
                    ),
                  ),
                ),
                TextFormField(
                  // autofocus: true,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  style: TextStyle(
                    fontFamily: NovelSararaRFont,
                    fontSize: 28,
                    color: Colors.black,
                  ),
                  controller: _novelContentController,
                  maxLength: 10000,
                  decoration: InputDecoration(
                    hintText: "????????????????????????",
                    enabledBorder: InputBorder.none,
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  alignment: Alignment.topRight,
                  child: ElevatedButton(
                    onPressed: () => _novel(context),
                    child: Text("????????????",style: TextStyle(fontSize: 30,fontFamily: NovelSararaBFont),),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  //TODO
  _novel(BuildContext context) async {
    //?????????????????????????????????????????????????????????
    //  _novel(BuildContext context, FeedNovelViewModel feedNovelViewModel,) async {
    // String _novelTitle = _titleController.value.text;
    // String _novelContent = _novelContentController.value.text;
    final novelViewModel = context.read<NovelViewModel>();
    if ( novelViewModel.selectedGenre == "") {
      showAlertDialog(
        title: "????????????",
        content: "????????????????????????????????????????????????",
        message: "????????????",
        context: context,
      );
    } else if ( novelViewModel.writingNovelTitle == "") {
      showAlertDialog(
        title: "????????????",
        content: "????????????????????????????????????????????????",
        message: "????????????",
        context: context,
      );
    } else if ( novelViewModel.writingNovelContent == "") {
      showAlertDialog(
        title: "????????????",
        content: "?????????????????????????????????????????????",
        message: "????????????",
        context: context,
      );
    } else {
      final novelViewModel = context.read<NovelViewModel>();
      print("eeeeee:${novelViewModel.selectedGenre}");
      await novelViewModel.novelPosting();

      // ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????
      final feedNovelViewModel = context.read<FeedNovelViewModel>();
      await feedNovelViewModel.getNovels(FeedNovelMode.ALL_NOVELS, null);
      feedNovelViewModel.changeFeedNovelSubPage(
          0, null, FeedNovelMode.ALL_NOVELS);

      // ???????????????????????????????????????
      widget.persistentTabController.jumpToTab(1);

      // Navigator.pushReplacement(context, MaterialPageRoute(
      //     builder: (_) => FeedNovelPage(),));
      // widget.persistentTabController.jumpToTab(1);

      _titleController.clear();
      _novelContentController.clear();
      setState(() {
        novelViewModel.selectedGenre = _genreItems[0].value.toString();
      });
    }
  }
}
