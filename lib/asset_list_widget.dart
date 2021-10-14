import 'package:collxn/opensea/asset.dart';
import 'package:flutter/material.dart';

class AssetListWidget extends StatelessWidget {
  const AssetListWidget({Key? key, required this.assets}) : super(key: key);

  final List<Asset> assets;

  @override
  Widget build(final BuildContext context) {
    return Expanded(
        child: CustomScrollView(shrinkWrap: true, slivers: [
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
              return ListTile(
                contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                title: Image.network(asset.imageUrl, fit: BoxFit.fitWidth),
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
        backgroundColor: Theme.of(context).backgroundColor,
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
