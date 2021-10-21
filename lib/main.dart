import 'package:collxn/asset_list_sliver.dart';
import 'package:collxn/collection_list_sliver.dart';
import 'package:collxn/info_sliver_list.dart';
import 'package:collxn/loader_widget.dart';
import 'package:collxn/opensea/asset.dart';
import 'package:collxn/opensea/collection.dart';
import 'package:collxn/opensea/opensea_api.dart';
import 'package:collxn/opensea/user_info.dart';
import 'package:collxn/profile_header_sliver_app_bar.dart';
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
      home: const HomePage(wallet: OpenSea.walletAddress),
    );
  }
}

class HomePage extends StatefulWidget {
  final String wallet;

  const HomePage({Key? key, required this.wallet}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final UserInfo _user;
  final List<Asset> _walletAssets = [];
  final List<Collection> _collections = [];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    () async {
      final api = OpenSea();
      await api.getUserInfoForWallet(widget.wallet).then((final value) {
        setState(() {
          _user = value;
        });
      });
      await api.getCollections(_user.account.address).then((final value) {
        setState(() {
          _collections.clear();
          _collections.addAll(value);
        });
      });
      api.getNFTsForWallet(_user.account.address).then((final value) {
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (final index) {
          setState(() {
            selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
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
          ProfileWidget(
            user: _user,
            assets: _walletAssets,
            collections: _collections,
            selectedIndex: selectedIndex,
          ),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {Key? key,
      required this.user,
      required this.assets,
      required this.collections,
      required this.selectedIndex})
      : super(key: key);

  final int selectedIndex;
  final UserInfo user;
  final List<Asset> assets;
  final List<Collection> collections;

  @override
  Widget build(final BuildContext context) {
    final children = <Widget>[
      InfoSliverList(info: user.toJson()),
      AssetSliverGrid(assets: assets, userInfo: user),
      CollectionSliverList(
        collections: collections,
        owner: user,
      ),
    ];
    return Expanded(
      child: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          ProfileHeaderSliverAppBar(userInfo: user),
          children[selectedIndex]
        ],
      ),
    );
  }
}
