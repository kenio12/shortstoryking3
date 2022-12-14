import 'package:flutter/material.dart';

class Novel {
  bool isPublish;
  String novelId;
  String userId;
  String title;
  String content;
  String postScript;
  String genre;
  String battleType;
  String eventType;
  int battlePoint;
  int eventPoint;
  int wordCount;
  DateTime saveDateTime;
  DateTime postDateTime;

//<editor-fold desc="Data Methods">

  Novel({
    required this.isPublish,
    required this.novelId,
    required this.userId,
    required this.title,
    required this.content,
    required this.postScript,
    required this.genre,
    required this.battleType,
    required this.eventType,
    required this.battlePoint,
    required this.eventPoint,
    required this.wordCount,
    required this.saveDateTime,
    required this.postDateTime,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Novel &&
          runtimeType == other.runtimeType &&
          isPublish == other.isPublish &&
          novelId == other.novelId &&
          userId == other.userId &&
          title == other.title &&
          content == other.content &&
          postScript == other.postScript &&
          genre == other.genre &&
          battleType == other.battleType &&
          eventType == other.eventType &&
          battlePoint == other.battlePoint &&
          eventPoint == other.eventPoint &&
          wordCount == other.wordCount &&
          saveDateTime == other.saveDateTime &&
          postDateTime == other.postDateTime);

  @override
  int get hashCode =>
      isPublish.hashCode ^
      novelId.hashCode ^
      userId.hashCode ^
      title.hashCode ^
      content.hashCode ^
      postScript.hashCode ^
      genre.hashCode ^
      battleType.hashCode ^
      eventType.hashCode ^
      battlePoint.hashCode ^
      eventPoint.hashCode ^
      wordCount.hashCode ^
      saveDateTime.hashCode ^
      postDateTime.hashCode;

  @override
  String toString() {
    return 'Novel{' +
        ' isPublish: $isPublish,' +
        ' novelId: $novelId,' +
        ' userId: $userId,' +
        ' title: $title,' +
        ' content: $content,' +
        ' postScript: $postScript,' +
        ' genre: $genre,' +
        ' battleType: $battleType,' +
        ' eventType: $eventType,' +
        ' battlePoint: $battlePoint,' +
        ' eventPoint: $eventPoint,' +
        ' wordCount: $wordCount,' +
        ' saveDateTime: $saveDateTime,' +
        ' postDateTime: $postDateTime,' +
        '}';
  }

  Novel copyWith({
    bool? isPublish,
    String? novelId,
    String? userId,
    String? title,
    String? content,
    String? postScript,
    String? genre,
    String? battleType,
    String? eventType,
    int? battlePoint,
    int? eventPoint,
    int? wordCount,
    DateTime? saveDateTime,
    DateTime? postDateTime,
  }) {
    return Novel(
      isPublish: isPublish ?? this.isPublish,
      novelId: novelId ?? this.novelId,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      content: content ?? this.content,
      postScript: postScript ?? this.postScript,
      genre: genre ?? this.genre,
      battleType: battleType ?? this.battleType,
      eventType: eventType ?? this.eventType,
      battlePoint: battlePoint ?? this.battlePoint,
      eventPoint: eventPoint ?? this.eventPoint,
      wordCount: wordCount ?? this.wordCount,
      saveDateTime: saveDateTime ?? this.saveDateTime,
      postDateTime: postDateTime ?? this.postDateTime,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'isPublish': this.isPublish,
      'novelId': this.novelId,
      'userId': this.userId,
      'title': this.title,
      'content': this.content,
      'postScript': this.postScript,
      'genre': this.genre,
      'battleType': this.battleType,
      'eventType': this.eventType,
      'battlePoint': this.battlePoint,
      'eventPoint': this.eventPoint,
      'wordCount': this.wordCount,
      'saveDateTime': this.saveDateTime.toIso8601String(),
      'postDateTime': this.postDateTime.toIso8601String(),
    };
  }

  factory Novel.fromMap(Map<String, dynamic> map) {
    return Novel(
      isPublish: map['isPublish'] as bool,
      novelId: map['novelId'] as String,
      userId: map['userId'] as String,
      title: map['title'] as String,
      content: map['content'] as String,
      postScript: map['postScript'] as String,
      genre: (map['genre'] == null) ? "" : map['genre'] as String,
      battleType: map['battleType'] as String,
      eventType: (map['eventType'] == null) ? "" : map['eventType'] as String,
      battlePoint: (map['battlePoint'] == null) ? 0 : map['battlePoint'] as int,
      eventPoint: (map['eventPoint'] == null) ? 0 : map['eventPoint'] as int,
      wordCount: (map['wordCount'] == "") ? (map['content'] as String).length : map['wordCount'] as int,
      saveDateTime: DateTime.parse(map['saveDateTime'] as String).toLocal(),
      postDateTime: DateTime.parse(map['postDateTime'] as String).toLocal(),
    );
  }

//</editor-fold>
}