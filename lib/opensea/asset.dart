// ignore_for_file: non_constant_identifier_names
import 'package:collxn/opensea/account.dart';

/// https://docs.opensea.io/reference/asset-object
class Asset {
  late final String name;
  late final String token_id;
  late final dynamic asset_contract;
  late final String image_url;
  late final String? background_color;
  late final String? external_link;
  late final Account owner;
  late final dynamic traits;
  late final dynamic last_sale;

  Asset({
    required this.name,
    required this.token_id,
    required this.asset_contract,
    required this.image_url,
    required this.owner,
    this.background_color,
    this.external_link,
    this.traits,
    this.last_sale,
  });

  Asset.fromJson(final Map<String, dynamic> json)
      : name = json['name'],
        token_id = json['token_id'],
        asset_contract = json['asset_contract'],
        image_url = json['image_url'],
        background_color = json['background_color'],
        external_link = json['external_link'],
        owner = Account.fromJson(json['owner']),
        traits = json['traits'],
        last_sale = json['last_sale'];

  String get imageUrl => image_url;

  @override
  String toString() =>
      'Asset(name: $name, token_id: $token_id, asset_contract: $asset_contract, image_url: $image_url, background_color: $background_color, external_link: $external_link, owner: $owner, traits: $traits, last_sale: $last_sale)';
}
