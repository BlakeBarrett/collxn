// ignore_for_file: non_constant_identifier_names
import 'dart:collection';

import 'package:collxn/opensea/account.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

/// https://docs.opensea.io/reference/asset-object
class Asset {
  late final String name;
  late final String token_id;
  late final dynamic asset_contract;
  late final String image_url;
  late final String? background_color;
  late final String? external_link;
  late final Account owner;
  late final Account creator;
  late final dynamic traits;
  late final dynamic last_sale;

  Asset({
    required this.name,
    required this.token_id,
    required this.asset_contract,
    required this.image_url,
    required this.owner,
    required this.creator,
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
        creator = Account.fromJson(json['creator']),
        traits = json['traits'],
        last_sale = json['last_sale'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = HashMap<String, dynamic>();
    data['name'] = name;
    data['token_id'] = token_id;
    data['asset_contract'] = asset_contract;
    data['image_url'] = image_url;
    data['background_color'] = background_color;
    data['external_link'] = external_link;
    data['owner'] = owner.toJson();
    data['creator'] = creator.toJson();
    data['traits'] = traits;
    data['last_sale'] = last_sale;
    return data;
  }

  String get imageUrl => image_url;
  Color get backgroundColor => HexColor(background_color ?? '');

  @override
  String toString() =>
      'Asset(name: $name, token_id: $token_id, asset_contract: $asset_contract, image_url: $image_url, background_color: $background_color, external_link: $external_link, owner: $owner, traits: $traits, last_sale: $last_sale)';
}
