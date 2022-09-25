import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyProfile extends StatelessWidget {
  final ScrollController scrollController;

  MyProfile({required this.scrollController});

  @override
  Widget build(BuildContext context) {
    double _width = 0.0;
    _width = MediaQuery.of(context).size.width;

    final profileViewModel = context.read<ProfileViewModel>();
    final User currentUser = profileViewModel.currentUser;
    final _sex = currentUser.sex;
    final _inAppUserImage = currentUser.inAppUserImage;
    final _era = currentUser.era;
    final _address = currentUser.address;
    final _bio = currentUser.bio;

    return Column(
      children: [
        Center(
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
                      Positioned(
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(width: 2)),
                          child: Center(
                            child: Text(
                              "児",
                              style: profileTextStyle,
                            ),
                          ),
                        ),
                      ),
                      Image.asset(
                        _inAppUserImage,
                        fit: BoxFit.contain,
                        width: 280,
                        height: 280,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Container(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "性　　別：　",
                    style: profileTextStyle,
                  ),
                  Text(
                    "${_sex}",
                    style: profileTextStyle,
                  ), // Text(" 　${_sex}",style: profileTextStyle,)
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
                  Text(
                    "${_era}",
                    style: profileTextStyle,
                  ), //
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
                  Text(
                    "${_address}",
                    style: profileTextStyle,
                  ), //
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
                  // FaIcon(
                  //   FontAwesomeIcons.arrowDown,
                  //   color: Colors.black,
                  // ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    // color: Colors.black12,
                    //     borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1)
                    ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "${_bio}",
                    style: TextStyle(
                      fontSize: 22.0,
                      fontFamily: NovelSararaBFont,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
