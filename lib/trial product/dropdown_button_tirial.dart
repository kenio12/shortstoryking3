import 'package:dropdown_button2/dropdown_button2.dart';

//TODO とりあえず作りかけ作品
// final List<String> _unfinishedNovels = [
//   "unfinished Item1",
//   "unfinished Item2",
//   "unfinished Item3",
//   "unfinished Item4",
// ];

// String? selectedValue;

//　以下没にしたボタン
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0),
//             child: DropdownButton2(
//               // customButton: ,
//               // icon: Icon(FontAwesomeIcons.featherAlt,),
//               buttonHeight: 35,
//               buttonPadding: const EdgeInsets.all(8.0),
//               buttonDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 color: Color(0xffDEDEDE),
//               ),
//               dropdownDecoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8.0),
//                 color: Color(0xffDEDEDE),
//               ),
//               hint: Text("作りかけ作品を触る",style: TextStyle(color: Color(0xff899998),fontSize:15.0),),
//               items: _unfinishedNovels.map((e) =>
//               DropdownMenuItem<String>(
//                 value: e,
//                 child: Text(e,style: TextStyle(color: Color(0xff899998),fontSize:15.0) ,),
//               ),).toList(),
//               value: selectedValue,
//               onChanged: (e){
// setState(() {
//   selectedValue = e as String;
// });
//               }
//             ),
//           ),