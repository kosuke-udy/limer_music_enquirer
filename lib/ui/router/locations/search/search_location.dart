import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

import '../util_methods.dart';

class SearchLocation extends BeamLocation<BeamState> {
  @override
  List<String> get pathPatterns => ['/search'];

  @override
  List<BeamPage> buildPages(BuildContext context, BeamState state) {
    return [
      BeamPage(
        key: getPageKey("/search"),
        title: "Search",
        child: const Center(
          child: Text("Search"),
        ),
      ),
    ];
  }
}
