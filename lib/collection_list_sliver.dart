import 'package:collxn/info_sliver_list.dart';
import 'package:collxn/opensea/user_info.dart';
import 'package:collxn/opensea/collection.dart';
import 'package:flutter/material.dart';

class CollectionSliverList extends StatefulWidget {
  final UserInfo owner;
  final List<Collection> collections;

  const CollectionSliverList(
      {Key? key, required this.collections, required this.owner})
      : super(key: key);

  @override
  _CollectionSliverListState createState() => _CollectionSliverListState();
}

class _CollectionSliverListState extends State<CollectionSliverList> {
  @override
  Widget build(final BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (final BuildContext context, final int index) {
          final selectedCollection = widget.collections[index];
          return InkWell(
            child: ListTile(
              title: Hero(
                child: Image.network(
                  '${selectedCollection.imageUrl}',
                  fit: BoxFit.cover,
                ),
                tag: '${selectedCollection.imageUrl}',
              ),
              subtitle: Text('${selectedCollection.description}'),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) =>
                        CollectionPage(collection: selectedCollection),
                  ),
                );
              },
            ),
          );
        },
        childCount: widget.collections.length,
      ),
    );
  }
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key, required this.collection}) : super(key: key);

  final Collection collection;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection.name ?? ''),
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
                  '${collection.imageUrl}',
                  fit: BoxFit.contain,
                ),
                tag: '${collection.imageUrl}',
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
                              '${collection.imageUrl}',
                              fit: BoxFit.fill,
                            ),
                            tag: '${collection.imageUrl}',
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
                InfoSliverList(info: collection.toJson()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
