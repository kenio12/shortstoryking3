import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/styles/textStyle.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class MyProfileDetail extends StatefulWidget {
  @override
  State<MyProfileDetail> createState() => _MyProfileDetailState();
}

class _MyProfileDetailState extends State<MyProfileDetail> {
  // final User currentUser ;
  @override
  Widget build(BuildContext context) {
    final profileViewModel = context.read<ProfileViewModel>();
    final User currentUser = profileViewModel.currentUser;

    return Padding(
      padding: const EdgeInsets.only(left: 100,right: 100),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: ()=>null,
            splashColor: Colors.black,
            child: Row(
              children: [
                Text("性　　別：",style: profileTextStyle,),
                Text(" 　${currentUser.sex}",style: profileTextStyle,)
              ],
            ),
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("年　　齢：",style: profileTextStyle,),
              Text(" 　${currentUser.age}",style: profileTextStyle,)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("住　　処：",style: profileTextStyle,),
              Text(" 　${currentUser.address}",style: profileTextStyle,)
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("自己紹介：",style: profileTextStyle,),
            ],
          ),
            Text("${currentUser.bio}",
            style: profileTextStyle,
            softWrap: true,),
        ],
      ),
    );
  }
}
