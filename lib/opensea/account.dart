// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

import 'package:collxn/opensea/user_info.dart';

/// https://docs.opensea.io/reference/account-object
class Account {
  Account({
    required this.user,
    required this.profileImgUrl,
    required this.address,
    required this.config,
    required this.currencies,
  });
  late final User user;
  late final String profileImgUrl;
  late final String address;
  late final String config;
  late final Map? currencies;

  String get userName {
    return user.username;
  }

  Account.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    profileImgUrl = json['profile_img_url'];
    address = json['address'];
    config = json['config'];
    currencies = json['currencies'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['profile_img_url'] = profileImgUrl;
    _data['address'] = address;
    _data['config'] = config;
    _data['currencies'] = currencies;
    return _data;
  }

  @override
  String toString() =>
      'Account{address: $address, profileImgUrl: $profileImgUrl, user: $user, config: $config}';
}
