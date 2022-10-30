class User {
  final String userId;
  final String twitterName; //Firebaseに登録したUser情報に紐付いているtwitterのユーザー名
  final String inAppUserName;
  final String inAppUserImage;
  final String bio;
  final String address;
  final String sex;
  final String writerGenre;
  final String writerWordCount;
  final int age;
  final String era;

//<editor-fold desc="Data Methods">

  const User({
    required this.userId,
    required this.twitterName,
    required this.inAppUserName,
    required this.inAppUserImage,
    required this.bio,
    required this.address,
    required this.sex,
    required this.writerGenre,
    required this.writerWordCount,
    required this.age,
    required this.era,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          runtimeType == other.runtimeType &&
          userId == other.userId &&
          twitterName == other.twitterName &&
          inAppUserName == other.inAppUserName &&
          inAppUserImage == other.inAppUserImage &&
          bio == other.bio &&
          address == other.address &&
          sex == other.sex &&
          writerGenre == other.writerGenre &&
          writerWordCount == other.writerWordCount &&
          age == other.age &&
          era == other.era);

  @override
  int get hashCode =>
      userId.hashCode ^
      twitterName.hashCode ^
      inAppUserName.hashCode ^
      inAppUserImage.hashCode ^
      bio.hashCode ^
      address.hashCode ^
      sex.hashCode ^
      writerGenre.hashCode ^
      writerWordCount.hashCode ^
      age.hashCode ^
      era.hashCode;

  @override
  String toString() {
    return 'User{' +
        ' userId: $userId,' +
        ' twitterName: $twitterName,' +
        ' inAppUserName: $inAppUserName,' +
        ' inAppUserImage: $inAppUserImage,' +
        ' bio: $bio,' +
        ' address: $address,' +
        ' sex: $sex,' +
        ' writerGenre: $writerGenre,' +
        ' writerWordCount: $writerWordCount,' +
        ' age: $age,' +
        ' era: $era,' +
        '}';
  }

  User copyWith({
    String? userId,
    String? twitterName,
    String? inAppUserName,
    String? inAppUserImage,
    String? bio,
    String? address,
    String? sex,
    String? writerGenre,
    String? writerWordCount,
    int? age,
    String? era,
  }) {
    return User(
      userId: userId ?? this.userId,
      twitterName: twitterName ?? this.twitterName,
      inAppUserName: inAppUserName ?? this.inAppUserName,
      inAppUserImage: inAppUserImage ?? this.inAppUserImage,
      bio: bio ?? this.bio,
      address: address ?? this.address,
      sex: sex ?? this.sex,
      writerGenre: writerGenre ?? this.writerGenre,
      writerWordCount: writerWordCount ?? this.writerWordCount,
      age: age ?? this.age,
      era: era ?? this.era,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': this.userId,
      'twitterName': this.twitterName,
      'inAppUserName': this.inAppUserName,
      'inAppUserImage': this.inAppUserImage,
      'bio': this.bio,
      'address': this.address,
      'sex': this.sex,
      'writerGenre': this.writerGenre,
      'writerWordCount': this.writerWordCount,
      'age': this.age,
      'era': this.era,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userId: map['userId'] as String,
      twitterName: map['twitterName'] as String,
      inAppUserName: map['inAppUserName'] as String,
      inAppUserImage: map['inAppUserImage'] as String,
      bio: map['bio'] as String,
      address: map['address'] as String,
      sex: map['sex'] as String,
      writerGenre: (map['writerGenre'] == null) ? "" : map['writerGenre'] as String,
      writerWordCount: (map['writerWordCount'] == null) ? "" : map['writerWordCount'] as String,
      age: map['age'] as int,
      era: map['era'] as String,
    );
  }

//</editor-fold>
}