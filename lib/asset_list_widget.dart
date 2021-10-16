import 'package:collxn/opensea/user_info.dart';
import 'package:collxn/opensea/asset.dart';
import 'package:collxn/user_sliver_app_bar_widget.dart';
import 'package:flutter/material.dart';

class AssetListWidget extends StatelessWidget {
  const AssetListWidget(
      {Key? key, required this.assets, required this.userInfo})
      : super(key: key);

  final List<Asset> assets;
  final UserInfo userInfo;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
        child: CustomScrollView(shrinkWrap: true, slivers: [
      UserSliverAppBarWidget(userInfo: userInfo),
      SliverGrid(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200.0,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
            childAspectRatio: 1.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (final BuildContext context, final int index) {
              final asset = assets[index];
              final image = Image.network(asset.imageUrl, fit: BoxFit.fitWidth);
              return ListTile(
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                title: image,
                subtitle: Text(asset.name),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (final BuildContext context) =>
                          AssetPage(asset: asset, image: image),
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
  const AssetPage({Key? key, required this.asset, required this.image})
      : super(key: key);

  final Asset asset;
  final Image image;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        appBar: AppBar(
          title: Text(asset.name),
        ),
        body: Column(
          children: [
            image,
          ],
        ));
  }
}
