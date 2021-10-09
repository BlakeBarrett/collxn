import 'package:collxn/opensea/asset.dart';
import 'package:collxn/opensea/opensea_api.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(final BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final String _walletId = OpenSea.walletAddress;
  final List<Asset> _walletAssets = [];

  @override
  void initState() {
    super.initState();
    () async {
      final assets = await OpenSea().getNFTsForWallet(_walletId);
      setState(() {
        _walletAssets.addAll(assets);
      });
    }();
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_walletId),
      ),
      body: Column(
        children: <Widget>[
          if (_walletAssets.isEmpty) ...[
            const Loader(),
          ] else ...[
            WalletAssetsPage(title: _walletId, assets: _walletAssets),
          ]
        ],
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Expanded(
        child: Center(
      child: CircularProgressIndicator(),
    ));
  }
}

class WalletAssetsPage extends StatefulWidget {
  const WalletAssetsPage({Key? key, required this.title, required this.assets})
      : super(key: key);

  final String title;
  final List<Asset> assets;

  @override
  State<WalletAssetsPage> createState() => _WalletAssetsPageState();
}

class _WalletAssetsPageState extends State<WalletAssetsPage> {
  @override
  Widget build(final BuildContext context) {
    return AssetListWidget(assets: widget.assets);
  }
}

class AssetListWidget extends StatelessWidget {
  const AssetListWidget({Key? key, required this.assets}) : super(key: key);

  final List<Asset> assets;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
        child: CustomScrollView(shrinkWrap: true, slivers: [
      SliverList(
          delegate: SliverChildBuilderDelegate(
        (final BuildContext context, final int index) {
          final asset = assets[index];
          return ListTile(
            contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
            title: Image.network(asset.imageUrl),
            subtitle: Text(asset.name),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (final BuildContext context) =>
                      AssetPage(asset: asset),
                ),
              );
            },
          );
        },
        childCount: assets.length,
      ))
    ]));
  }
}

class AssetPage extends StatelessWidget {
  const AssetPage({Key? key, required this.asset}) : super(key: key);

  final Asset asset;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(asset.name),
        ),
        body: Column(
          children: [
            Image.network(
              asset.imageUrl,
              fit: BoxFit.fill,
            )
          ],
        ));
  }
}
