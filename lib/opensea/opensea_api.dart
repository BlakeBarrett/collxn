// ignore_for_file: file_names
import 'dart:convert';
import 'package:collxn/opensea/asset.dart';
import 'package:collxn/opensea/collection.dart';
import 'package:collxn/opensea/user_info.dart';
import 'package:http/http.dart' as http;

class OpenSea {
  // for use when testing
  static const walletAddress = '0xb3532718af7218ec4ce2fe4d6b66283257f4b3f0';
  static const nftAssetContractAddress =
      '0x495f947276749ce646f68ac8c248420045cb7b5e';
  static const nftTokenId =
      '81110918036404122233458993428491379538347624814123393756341562125755476869130';

  Future<UserInfo> getUserInfoForWallet(final String wallet) async {
    final String endpoint = 'https://api.opensea.io/api/v1/user/$wallet';
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return UserInfo.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load user info');
    }
  }

  /// Returns a map of the NFT token information for the given wallet address.
  Future<List<Asset>> getNFTsForWallet(final String wallet) async {
    final String endpoint =
        'https://api.opensea.io/api/v1/assets?owner=$wallet';
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final responseMap = json.decode(response.body);
      final assets = responseMap['assets'] as List<dynamic>;
      return assets.map((element) {
        return Asset.fromJson(element);
      }).toList();
    } else {
      throw Exception('Failed to load NFTs');
    }
  }

  Future<List<Collection>> getCollections(final String wallet) async {
    final String endpoint =
        'https://api.opensea.io/api/v1/collections?asset_owner=$wallet';
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final collections = json.decode(response.body) as List<dynamic>;
      return collections.map((item) {
        return Collection.fromJson(item);
      }).toList();
    } else {
      throw Exception('Failed to load collections');
    }
  }

  Future<Asset> getNFT(final String wallet, final String tokenId) async {
    final String endpoint =
        'https://api.opensea.io/api/v1/asset/$wallet/$tokenId';
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      return Asset.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load NFT');
    }
  }
}
