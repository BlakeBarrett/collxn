// ignore_for_file: file_names
import 'dart:convert';
import 'package:http/http.dart' as http;

class OpenSea {
  // for use when testing
  static const walletAddress = '0xb3532718af7218ec4ce2fe4d6b66283257f4b3f0';
  static const nftAssetContractAddress =
      '0x495f947276749ce646f68ac8c248420045cb7b5e';
  static const nftTokenId =
      '81110918036404122233458993428491379538347624814123393756341562125755476869130';

  /// Returns a map of the NFT token information for the given wallet address.
  Future<dynamic> getNFTsForWallet(final String wallet) async {
    final String endpoint =
        'https://api.opensea.io/api/v1/assets?owner=$wallet';
    final response = await http.get(Uri.parse(endpoint));
    return json.decode(response.body);
  }

  Future<dynamic> getCollections(final String wallet) async {
    final String endpoint =
        'https://api.opensea.io/api/v1/collections?asset_owner=$wallet';
    final response = await http.get(Uri.parse(endpoint));
    return json.decode(response.body);
  }

  Future<Map> getNFT(final String wallet, final String tokenId) async {
    final String endpoint =
        'https://api.opensea.io/api/v1/asset/$wallet/$tokenId';
    final response = await http.get(Uri.parse(endpoint));
    return json.decode(response.body);
  }
}
