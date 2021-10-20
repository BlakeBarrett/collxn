import 'package:collxn/asset_list_sliver.dart';
import 'package:collxn/collection_list_sliver.dart';
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
  late final UserInfo _user;
  final List<Asset> _walletAssets = [];
  final List<Collection> _collections = [];

  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    () async {
      final api = OpenSea();
      await api.getUserInfoForWallet(_walletId).then((value) {
        setState(() {
          _user = value;
        });
      });
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
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
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
              title: _walletId,
              user: _user,
              assets: _walletAssets,
              collections: _collections,
              selectedIndex: selectedIndex),
        ],
      ),
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget(
      {Key? key,
      required this.title,
      required this.user,
      required this.assets,
      required this.collections,
      required this.selectedIndex})
      : super(key: key);

  final int selectedIndex;
  final String title;
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

class InfoSliverList extends StatelessWidget {
  final Map info;

  const InfoSliverList({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final keys = info.keys.toList();
    final values = info.values.toList();
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final key = keys[index].toString();
        final value = values[index].toString();
        return ListTile(
          title: Text('$key: $value'),
        );
      }, childCount: keys.length),
    );
  }
}
