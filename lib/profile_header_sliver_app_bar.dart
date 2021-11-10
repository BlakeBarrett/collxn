import 'package:collxn/opensea/user_info.dart';
import 'package:flutter/material.dart';

class ProfileHeaderSliverAppBar extends StatelessWidget {
  final UserInfo userInfo;

  const ProfileHeaderSliverAppBar({Key? key, required this.userInfo})
      : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return SliverAppBar(
      pinned: true,
      stretch: true,
      expandedHeight: 300.0,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              userInfo.account.profileImgUrl,
              fit: BoxFit.cover,
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 0.5),
                  end: Alignment.center,
                  colors: <Color>[
                    Color(0x60000000),
                    Color(0x00000000),
                  ],
                ),
              ),
            ),
          ],
        ),
        stretchModes: const <StretchMode>[
          StretchMode.zoomBackground,
          StretchMode.blurBackground,
          StretchMode.fadeTitle,
        ],
        centerTitle: true,
        title: Text(
          userInfo.username,
          style: const TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
