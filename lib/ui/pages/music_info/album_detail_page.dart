import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

class AlbumDetailPage extends ConsumerWidget {
  /* ---------- Properties ---------- */

  final String id;

  /* ---------- Constructor ---------- */

  const AlbumDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  /* ---------- Build ---------- */

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageScaffold(
      appBarTitle: const Text("Album Detail"),
      onBackButtonPressed: () => context.beamBack(),
      body: Container(),
    );
  }
}
