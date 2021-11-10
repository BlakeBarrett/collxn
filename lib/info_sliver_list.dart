import 'package:collxn/main.dart';
import 'package:flutter/material.dart';

class InfoSliverList extends StatelessWidget {
  final Map info;

  const InfoSliverList({Key? key, required this.info}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    final keys = info.keys.toList();
    final values = info.values.toList();
    return SliverAnimatedList(
        itemBuilder: (final context, final index, final animation) {
          final key = keys[index].toString();
          final value = values[index].toString();
          return ListTile(
            title: Text('$key: $value'),
            onTap: () {
              if (key == 'username' || key == 'address') {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (final BuildContext context) =>
                        HomePage(wallet: value),
                  ),
                );
              }
            },
          );
        },
        initialItemCount: keys.length);
  }
}
