import 'package:flutter/material.dart';

class LoaderWidget extends StatelessWidget {
  const LoaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Column(children: const [
      Expanded(
          child: Center(
        child: CircularProgressIndicator(),
      ))
    ]);
  }
}
