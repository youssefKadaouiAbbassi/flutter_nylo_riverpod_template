class AccessToken {
  late String accessToken;

  toJson() => {
    "accessToken": accessToken,
  };

  AccessToken.fromJson(dynamic data) {
    accessToken = data['accessToken'];
  }

}
