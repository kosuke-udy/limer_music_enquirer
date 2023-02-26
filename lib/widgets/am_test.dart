import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/am_client.dart';
import '../api/am_dev_token.dart';
import '../api/am_user_token.dart';

class AmTest extends HookConsumerWidget {
  const AmTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devToken = ref.watch(amDevTokenProvider);
    final asyncDevTokenStatus = ref
        .watch(asyncAmApiTestProvider)
        .whenData((response) => response.statusCode);

    final asyncUserAuthStatus = ref
        .watch(asyncAmUserAuthProvider)
        .whenData((status) => status.toString());

    return Center(
      child: Column(
        children: [
          Text("isDevTokenGenerated: ${devToken.isNotEmpty.toString()}"),
          asyncDevTokenStatus.when(
            data: (data) => Text("Developer Token Status: $data"),
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text(err.toString()),
          ),
          asyncUserAuthStatus.when(
            data: (data) {
              return Text("User Auth Status: $data");
            },
            loading: () {
              return const CircularProgressIndicator();
            },
            error: (err, stack) {
              return Text(err.toString());
            },
          ),
        ],
      ),
    );
  }
}
