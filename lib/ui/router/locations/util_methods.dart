import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

String getPageKeyValue(String path) {
  // const divider = "-";
  // return ValueKey(path.replaceFirst("/", "").replaceAll("/", "-") +
  //     divider +
  //     DateTime.now().millisecondsSinceEpoch.toString());
  return path.replaceFirst("/", "").replaceAll("/", "-");
}

ValueKey<String> getPageKey(String path) {
  return ValueKey(getPageKeyValue(path));
}

List<BeamPage> generatePageHistory({
  required BuildContext context,
  required BeamParameters parameters,
  required String path,
  required String title,
  required Widget child,
}) {
  final currentPages = context.currentBeamPages;
  final keyValue = getPageKeyValue(path);

  final index =
      currentPages.indexWhere((element) => element.key == ValueKey(keyValue));
  if (index != -1) {
    final isBack = parameters.transitionDelegate is ReverseTransitionDelegate;

    if (isBack) {
      return currentPages.sublist(0, index + 1);
    } else {
      return [
        ...currentPages,
        BeamPage(
          key: ValueKey("$keyValue-${DateTime.now().millisecondsSinceEpoch}"),
          title: title,
          child: child,
        ),
      ];
    }
  } else {
    return [
      ...context.currentBeamPages,
      BeamPage(
        key: ValueKey(keyValue),
        title: title,
        child: child,
      ),
    ];
  }
}
