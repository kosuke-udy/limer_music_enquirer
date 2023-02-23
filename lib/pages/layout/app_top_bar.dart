import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget {
  const AppTopBar(
    this.titleData, {
    Key? key,
    this.actions,
  }) : super(key: key);

  final String titleData;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar.medium(
      pinned: true,
      snap: true,
      floating: true,
      title: Text(
        titleData,
      ),
    );
  }
}
