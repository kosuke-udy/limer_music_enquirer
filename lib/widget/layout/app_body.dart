import 'package:flutter/material.dart';

import 'app_top_bar.dart';

class AppBody extends StatelessWidget {
  const AppBody({
    Key? key,
    this.fillRemaining = false,
    required this.topBar,
    required this.body,
  }) : super(key: key);

  final AppTopBar topBar;
  final Widget body;
  final bool fillRemaining;

  @override
  Widget build(BuildContext context) {
    if (fillRemaining) {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            topBar,
            SliverFillRemaining(child: body),
          ],
        ),
      );
    } else {
      return Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            topBar,
            SliverToBoxAdapter(child: body),
          ],
        ),
      );
    }
  }
}
