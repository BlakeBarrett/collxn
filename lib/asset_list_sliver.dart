import 'package:collxn/info_sliver_list.dart';
import 'package:collxn/opensea/user_info.dart';
import 'package:collxn/opensea/asset.dart';
import 'package:flutter/material.dart';

class AssetSliverGrid extends StatelessWidget {
  const AssetSliverGrid(
      {Key? key, required this.assets, required this.userInfo})
      : super(key: key);

  final List<Asset> assets;
  final UserInfo userInfo;

  @override
  Widget build(final BuildContext context) {
    return SliverGrid(
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
          return InkWell(
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              title: image,
              subtitle: Text(asset.name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) =>
                        AssetPage(asset: asset, image: image),
                  ),
                );
              },
            ),
          );
        },
        childCount: assets.length,
      ),
    );
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
      appBar: AppBar(
        title: Text(asset.name),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
      body: Column(
        children: [
          Expanded(
            flex: 7,
            child: InkWell(
              autofocus: true,
              child: Image.network(
                asset.imageUrl,
                fit: BoxFit.contain,
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) => Scaffold(
                      backgroundColor: Theme.of(context).backgroundColor,
                      body: Column(
                        children: [
                          Image.network(
                            asset.imageUrl,
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            flex: 3,
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              shrinkWrap: true,
              slivers: [
                InfoSliverList(info: asset.toJson()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
