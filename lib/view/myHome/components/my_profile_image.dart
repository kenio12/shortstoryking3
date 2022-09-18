// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:provider/provider.dart';
// import 'package:shortstoryking3/data_models/user.dart';
// import 'package:shortstoryking3/view_models/profile_view_model.dart';
//
// class MyProfileImage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final profileViewModel = context.read<ProfileViewModel>();
//     final User currentUser = profileViewModel.currentUser;
//     final String inAppUserImage = currentUser.inAppUserImage;
//
//     return Consumer<ProfileViewModel>(builder: (context, model, child) {
//       print("うおおおおおおおおおおお${model.currentUser.inAppUserImage}");
//       return InkWell(
//         onTap: () => _changeProfileImage(
//             model.currentUser.inAppUserImage, profileViewModel),
//         child: Container(
//           child: Padding(
//             padding: const EdgeInsets.only(top: 30,bottom:30),
//             child: Container(
//               decoration: BoxDecoration(
//                 border: Border.all(
//                   color: Colors.black,
//                   width: 3
//                 )
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Image.asset(
//                   model.currentUser.inAppUserImage,
//                   fit: BoxFit.contain,
//                   width: 280,
//                   height: 280,
//                 ),
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }

  // _changeProfileImage(
  //     String inAppUserImage, ProfileViewModel profileViewModel) async {
  //   await profileViewModel.changeProfileImage(inAppUserImage);
  // }
// }
