class User {
  String? _id;
  String? firstName;
  String? lastName;
  String? profilePicture;
  String? email;
  String? locale;
  bool? disabled;

  User.fromJson(dynamic data) {
    _id = data['_id'];
    firstName = data['first_name'];
    lastName = data['last_name'];
    profilePicture = data['profile_picture'];
    email = data['email'];
    locale = data['locale'];
    disabled = data['disabled'];
  }

  toJson() => {
        '_id': _id,
        "first_name": firstName,
        "last_name": lastName,
        "profile_picture": profilePicture,
        "email": email,
        "locale": locale,
        "disabled": disabled
      };

  getId() => _id;
}
