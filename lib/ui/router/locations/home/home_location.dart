import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../../../pages/home_page.dart';
import '../../paths.dart';
import '../util_methods.dart';

class HomeLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => [
        appPath.home,
      ];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: getPageKey(appPath.home),
        title: "Home",
        child: const HomePage(),
      ),
    ];
  }
}
