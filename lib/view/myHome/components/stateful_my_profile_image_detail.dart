import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shortstoryking3/data_models/user.dart';
import 'package:shortstoryking3/view_models/profile_view_model.dart';

class StatefulMyProfileImageDetail extends StatefulWidget {
  @override
  State<StatefulMyProfileImageDetail> createState() =>
      _StatefulMyProfileImageDetail();
}

class _StatefulMyProfileImageDetail
    extends State<StatefulMyProfileImageDetail> {
  String _inAppUserImage = "";

  @override
  void initState() {
    final profileViewModel = context.read<ProfileViewModel>();
    final User currentUser = profileViewModel.currentUser;
    _inAppUserImage = currentUser.inAppUserImage;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: Image.asset(
                      _inAppUserImage,
                      fit: BoxFit.contain,
                      width: 280,
                      height: 280,
                    ),
                  ),
                ),
              ),
            ),
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
    setState(() {
    });
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
