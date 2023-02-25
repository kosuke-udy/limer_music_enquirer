import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/am_client.dart';
import '../api/am_dev_token.dart';

class AmTest extends HookConsumerWidget {
  const AmTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final token = ref.watch(amDevTokenProvider);
    final asyncStatusCode = ref
        .watch(asyncAmApiTestProvider)
        .whenData((response) => response.statusCode);

    return Center(
      child: Column(
        children: [
          Text("isTokenGenerated: ${token.isNotEmpty.toString()}"),
          asyncStatusCode.when(
            data: (data) => Text("statusCode: $data"),
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text(err.toString()),
          ),
        ],
      ),
    );
  }
}
