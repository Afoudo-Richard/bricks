class User {
  final int? id;
  final String? first_name;
  final String? last_name;
  final String? email;
  final String? phone;
  final String? photo;
  final String? name;
  final String? sex;
  final String? about;
  final String? profile_picture;

  User({
    this.id,
    this.first_name,
    this.last_name,
    this.email,
    this.phone,
    this.photo,
    this.name,
    this.sex,
    this.about,
    this.profile_picture,
  });

  factory User.fromMap(Map<String, dynamic> map) => User(
        id: map['id'] as int?,
        first_name: map['first_name'] as String?,
        last_name: map['last_name'] as String?,
        email: map['email'] as String?,
        phone: map['phone'] as String?,
        photo: map['photo'] as String?,
        name: map['name'] as String?,
        sex: map['sex'] as String?,
        about: map['about'] as String?,
        profile_picture: map['profile_picture'] as String?,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'first_name': first_name,
        'last_name': last_name,
        'email': email,
        'phone': phone,
        'photo': photo,
        'name': name,
        'sex': sex,
        'about': about,
        'profile_picture': profile_picture
      };

  User copyWith({
    int? id,
    String? first_name,
    String? last_name,
    String? email,
    String? phone,
    String? photo,
    String? name,
    String? sex,
    String? about,
    String? profile_picture,
  }) {
    return User(
      id: id ?? this.id,
      first_name: first_name ?? this.first_name,
      last_name: last_name ?? this.last_name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      sex: sex ?? this.sex,
      about: about ?? this.about,
      profile_picture: profile_picture ?? this.profile_picture,
    );
  }
}
