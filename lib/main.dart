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
      body: Center(
        child: Column(
          children: <Widget>[
            if (_walletAssets.isEmpty) ...[
              const Center(
                child: Loader(),
              ),
            ] else ...[
              WalletAssetsPage(title: _walletId, assets: _walletAssets),
            ]
          ],
        ),
      ),
    );
  }
}

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
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
        flex: 1,
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: assets.length,
            itemBuilder: (context, index) {
              return Image.network(assets[index].imageUrl);
            }));
  }
}
