// ignore_for_file: avoid_print

import 'package:collxn/opensea/opensea_api.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late OpenSea? sdk;

  setUp(() {
    sdk = OpenSea();
  });

  tearDown(() {
    sdk = null;
  });

  test("Testing loading user info over actual network call", () async {
    final actual = await sdk?.getUserInfoForWallet(OpenSea.walletAddress);
    print(actual);
    assert(actual != null);
  });

  test("Testing loading all NFTs over actual network call", () async {
    final actual = await sdk?.getNFTsForWallet(OpenSea.walletAddress);
    print("NFTs for Wallet ${OpenSea.walletAddress}");
    print(actual);
    assert(actual!.isNotEmpty);
  });

  test("Testing loading all NFT Collections over actual network call",
      () async {
    final actual = await sdk?.getCollections(OpenSea.walletAddress);
    print("NFT Collections for Wallet ${OpenSea.walletAddress}");
    print(actual);
    assert(actual!.isNotEmpty);
    assert(actual!.length > 1);
  });

  test("Test parsing Collections from response of network call", () async {
    final actual = await sdk?.getCollections(OpenSea.walletAddress);
    assert(actual!.isNotEmpty);
    assert(actual!.length > 1);
    for (var collection in actual!) {
      print("Collection.name: ${collection.name}");
      print("Collection.imageUrl: ${collection.imageUrl}");
      print("Collection.bannerImageUrl: ${collection.bannerImageUrl}");
      print("Collection.featuredImageUrl: ${collection.featuredImageUrl}");
      print("Collecton.description: ${collection.description}");
      assert(collection.name != null);
      assert(collection.imageUrl != null);
      assert(collection.bannerImageUrl != null);
      assert(collection.featuredImageUrl != null);
      assert(collection.description != null);
    }
  });

  test("Testing loading a real NFT over actual network call", () async {
    final actual =
        await sdk?.getNFT(OpenSea.nftAssetContractAddress, OpenSea.nftTokenId);
    print("NFT ${OpenSea.nftAssetContractAddress}/${OpenSea.nftTokenId}");
    print(actual);
    assert(actual != null);
  });
}
