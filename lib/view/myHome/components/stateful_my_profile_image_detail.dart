import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view/common/dialog/alert_dialog.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class StatefulMyProfileImageDetail extends StatefulWidget {
  final ScrollController scrollController;

  StatefulMyProfileImageDetail({required this.scrollController});

  @override
  State<StatefulMyProfileImageDetail> createState() =>
      _StatefulMyProfileImageDetail();
}

class _StatefulMyProfileImageDetail
    extends State<StatefulMyProfileImageDetail> {
  String _inAppUserImage = "";
  String _sex = "";

  // int _age = 0;
  String _era = "";
  String _address = "";
  String _bio = "";
  double _width = 0.0;
  TextEditingController _bioController = TextEditingController();

  List<String> _sexList = [
    '',
    '男性',
    '女性',
  ];

  List<String> _eraList = [
    '',
    '３９歳まで',
    '４０歳以上',
  ];

  List<String> _addressList = [
    '',
    '外国',
    '北海道',
    '青森県',
    '岩手県',
    '宮城県',
    '秋田県',
    '山形県',
    '福島県',
    '茨城県',
    '栃木県',
    '群馬県',
    '埼玉県',
    '千葉県',
    '東京都',
    '神奈川県',
    '新潟県',
    '富山県',
    '石川県',
    '福井県',
    '山梨県',
    '長野県',
    '岐阜県',
    '静岡県',
    '愛知県',
    '三重県',
    '滋賀県',
    '京都府',
    '大阪府',
    '兵庫県',
    '奈良県',
    '和歌山県',
    '鳥取県',
    '島根県',
    '岡山県',
    '広島県',
    '山口県',
    '徳島県',
    '香川県',
    '愛媛県',
    '高知県',
    '福岡県',
    '佐賀県',
    '長崎県',
    '熊本県',
    '大分県',
    '宮崎県',
    '鹿児島県',
    '沖縄県',
  ];

  @override
  void initState() {
    final profileViewModel = context.read<ProfileViewModel>();
    final User currentUser = profileViewModel.currentUser;
    _sex = currentUser.sex;
    _inAppUserImage = currentUser.inAppUserImage;
    // _age = currentUser.age;
    _era = currentUser.era;
    _address = currentUser.address;

    _bioController.text = currentUser.bio;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Center(
          child: InkWell(
            onTap: () => _statefulChangeProfileImage(_inAppUserImage),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      children: [
                        Image.asset(
                          _inAppUserImage,
                          fit: BoxFit.contain,
                          width: 280,
                          height: 280,
                        ),
                        Positioned(
                            right: 0,
                            child: Text("LV1",style: profileTextStyle,)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: _width / 2 - 180, right: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "性　　別：　",
                    style: profileTextStyle,
                  ),
                  DropdownButton<String>(
                      value: _sex,
                      items: _sexList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: profileTextStyle,
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _sex = value!;
                        });
                      })
                  // Text(" 　${_sex}",style: profileTextStyle,)
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "年　　代：　",
                    style: profileTextStyle,
                  ),
                  DropdownButton<String>(
                      value: _era,
                      items: _eraList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: profileTextStyle,
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _era = value!;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "住　　処：　",
                    style: profileTextStyle,
                  ),
                  DropdownButton<String>(
                      value: _address,
                      items: _addressList
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: profileTextStyle,
                            ));
                      }).toList(),
                      onChanged: (String? value) {
                        setState(() {
                          _address = value!;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    "自己紹介：　",
                    style: profileTextStyle,
                  ),
                  FaIcon(
                    FontAwesomeIcons.arrowDown,
                    color: Colors.black,
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    // autofocus: true,
                    cursorColor: Colors.black,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    style: TextStyle(fontSize: 30.0,fontFamily: NovelSararaBFont),
                    controller: _bioController,
                    maxLength: 100,
                    decoration: InputDecoration(
                      border:
                          OutlineInputBorder(borderSide: BorderSide(width: 1)),
                      hintText: "ここに自己紹介入力",
                      enabledBorder: InputBorder.none,
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black87,
                  ),
                  onPressed: () {
                    _changeProfile(_inAppUserImage, _sex, _era, _address,
                        _bioController.text, widget.scrollController);
                  },
                  child: Text("このプロフィールにする？"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  _statefulChangeProfileImage(String inAppUserImage) {
    switch (inAppUserImage) {
      case "assets/images/level1_avatar/baby.png":
        inAppUserImage = "assets/images/level1_avatar/baby2.png";
        break;
      case "assets/images/level1_avatar/baby2.png":
        inAppUserImage = "assets/images/level1_avatar/baby3.png";
        break;
      case "assets/images/level1_avatar/baby3.png":
        inAppUserImage = "assets/images/level1_avatar/baby4.png";
        break;
      case "assets/images/level1_avatar/baby4.png":
        inAppUserImage = "assets/images/level1_avatar/baby5.png";
        break;
      case "assets/images/level1_avatar/baby5.png":
        inAppUserImage = "assets/images/level1_avatar/baby.png";
        break;
    }
    _inAppUserImage = inAppUserImage;
    setState(() {});
  }

  void _changeProfile(
    String inAppUserImage,
    String sex,
    String era,
    String address,
    String text,
    ScrollController scrollController,
  ) async {
    final profileViewModel = context.read<ProfileViewModel>();
    await profileViewModel.changeProfile(
      inAppUserImage,
      sex,
      era,
      address,
      text,
    );
    primaryFocus?.unfocus();
    setState(() {});
    scrollController.animateTo(
      0,
      duration: Duration(microseconds: 2),
      curve: Curves.linear,
    );
    showAlertDialog(
      title: "プロフィール",
      content: "変えたでー",
      message: "はいはい",
      context: context,
    );
  }
}

// return Consumer<ProfileViewModel>(builder: (context, model, child) {
//   print("うおおおおおおおおおおお${model.currentUser.inAppUserImage}");
//   return InkWell(
//     onTap: () => _changeProfileImage(
//         model.currentUser.inAppUserImage, profileViewModel),
//     child: Container(
//       child: Padding(
//         padding: const EdgeInsets.only(top: 30,bottom:30),
//         child: Container(
//           decoration: BoxDecoration(
//             border: Border.all(
//               color: Colors.black,
//               width: 3
//             )
//           ),
//           child: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Image.asset(
//               model.currentUser.inAppUserImage,
//               fit: BoxFit.contain,
//               width: 280,
//               height: 280,
//             ),
//           ),
//         ),
//       ),
//     ),
//   );
// });
// }

// _changeProfileImage(
//     String inAppUserImage, ProfileViewModel profileViewModel) async {
//   await profileViewModel.changeProfileImage(inAppUserImage);}
