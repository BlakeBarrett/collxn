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
          final image = Hero(
            child: Image.network(
              asset.imageUrl,
              fit: BoxFit.fitWidth,
            ),
            tag: asset.token_id.toString(),
          );
          return InkWell(
            child: ListTile(
              contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
              title: image,
              subtitle: Text(asset.name),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) =>
                        AssetPage(asset: asset),
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
  const AssetPage({Key? key, required this.asset}) : super(key: key);

  final Asset asset;

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
              child: Hero(
                child: Image.network(
                  asset.imageUrl,
                  fit: BoxFit.contain,
                ),
                tag: asset.token_id.toString(),
              ),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) => Scaffold(
                      backgroundColor: Colors.black,
                      body: InkWell(
                        autofocus: true,
                        child: Center(
                          child: Hero(
                            child: Image.network(
                              asset.imageUrl,
                              fit: BoxFit.fill,
                            ),
                            tag: asset.token_id.toString(),
                          ),
                        ),
                        onTap: () => Navigator.of(context).pop(),
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
