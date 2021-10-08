// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

/// https://docs.opensea.io/reference/account-object
class Account {
  late final String address;
  late final String profile_img_url;
  late final Map user;
  late final String config;

  Account.fromJson(final Map<String, dynamic> json)
      : address = json['address'],
        profile_img_url = json['profile_img_url'],
        user = json['user'],
        config = json['config'];

  @override
  String toString() =>
      'Account{address: $address, profile_img_url: $profile_img_url, user: $user, config: $config}';
}
