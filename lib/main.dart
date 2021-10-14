import 'package:collxn/asset_list_widget.dart';
import 'package:collxn/collection_list_widget.dart';
import 'package:collxn/loader_widget.dart';
import 'package:collxn/opensea/asset.dart';
import 'package:collxn/opensea/collection.dart';
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
      theme: ThemeData(
          primarySwatch: Colors.blueGrey, backgroundColor: Colors.blueGrey),
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
  final List<Collection> _collections = [];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    () async {
      final api = OpenSea();
      await api.getCollections(_walletId).then((value) {
        setState(() {
          _collections.clear();
          _collections.addAll(value);
        });
      });
      api.getNFTsForWallet(_walletId).then((value) {
        setState(() {
          _walletAssets.clear();
          _walletAssets.addAll(value);
        });
      });
    }();
  }

  @override
  Widget build(final BuildContext context) {
    if (_walletAssets.isEmpty || _collections.isEmpty) {
      return const LoaderWidget();
    }

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        title: Text(_walletId),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.image_sharp),
            label: 'Assets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.collections),
            label: 'Collections',
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          WalletContentsPage(
              title: _walletId,
              assets: _walletAssets,
              collections: _collections,
              selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}

class WalletContentsPage extends StatelessWidget {
  const WalletContentsPage(
      {Key? key,
      required this.title,
      required this.assets,
      required this.collections,
      required this.selectedIndex})
      : super(key: key);

  final int selectedIndex;
  final String title;
  final List<Asset> assets;
  final List<Collection> collections;

  @override
  Widget build(final BuildContext context) {
    final children = <Widget>[
      AssetListWidget(assets: assets),
      CollectionListWidget(collections: collections),
    ];
    return children[selectedIndex];
  }
}
