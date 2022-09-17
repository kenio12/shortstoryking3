import 'package:flutter/material.dart';
import 'package:shortstoryking3/styles/textStyle.dart';

class ChangeJapaneaseDay extends StatelessWidget {
  final DateTime postDateTime;
  ChangeJapaneaseDay({required this.postDateTime,});
  @override
  Widget build(BuildContext context) {
    final String? year = postDateTime.year.toString();
    final String? month = postDateTime.month.toString();
    final String? day = postDateTime.day.toString();
    final String? hour = postDateTime.hour.toString();
    final String? minute = postDateTime.minute.toString();
    final String? second = postDateTime.second.toString();
    return Text("${year}年${month}月${day}日 ${hour}時${minute}分${second}秒"
    ,style: TextStyle(fontSize: 18,fontFamily: NovelSararaBFont),);
  }
}
