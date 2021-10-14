import 'package:collxn/opensea/collection.dart';
import 'package:flutter/material.dart';

class CollectionListWidget extends StatefulWidget {
  final List<Collection> collections;

  const CollectionListWidget({Key? key, required this.collections})
      : super(key: key);

  @override
  _CollectionListWidgetState createState() => _CollectionListWidgetState();
}

class _CollectionListWidgetState extends State<CollectionListWidget> {
  @override
  Widget build(final BuildContext context) {
    return Expanded(
        child: CustomScrollView(shrinkWrap: true, slivers: [
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (final BuildContext context, final int index) {
            final collection = widget.collections[index];
            return ListTile(
              title: Text('${collection.name}'),
              subtitle: Text('${collection.description}'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (final BuildContext context) =>
                        CollectionPage(collection: collection),
                  ),
                );
              },
            );
          },
          childCount: widget.collections.length,
        ),
      )
    ]));
  }
}

class CollectionPage extends StatelessWidget {
  const CollectionPage({Key? key, required this.collection}) : super(key: key);

  final Collection collection;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('${collection.name}'),
        ),
        body: Column(
          children: [
            Image.network(
              '${collection.imageUrl}',
              fit: BoxFit.fill,
            )
          ],
        ));
  }
}
