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

  test("Testing loading all NFTs over actual network call", () async {
    final actual = await sdk?.getNFTsForWallet(OpenSea.walletAddress);
    print("NFTs for Wallet ${OpenSea.walletAddress}");
    print(actual);
    assert(actual!.isNotEmpty);
    assert(actual?["assets"].length > 0);
  });

  test("Testing loading all NFT Collections over actual network call",
      () async {
    final actual = await sdk?.getCollections(OpenSea.walletAddress);
    print("NFT Collections for Wallet ${OpenSea.walletAddress}");
    print(actual);
    assert(actual!.isNotEmpty);
  });

  test("Testing loading a real NFT over actual network call", () async {
    final actual =
        await sdk?.getNFT(OpenSea.nftAssetContractAddress, OpenSea.nftTokenId);
    print("NFT: ${OpenSea.nftAssetContractAddress}/${OpenSea.nftTokenId}");
    print(actual);
    assert(actual!.isNotEmpty);
  });
}
