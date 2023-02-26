import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/am_client.dart';
import '../api/am_dev_token.dart';
import '../api/am_user_token.dart';

part 'am_api_test.g.dart';

class AmApiTest extends HookConsumerWidget {
  const AmApiTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final devToken = ref.watch(amDevTokenProvider);
    final asyncDevTokenStatus = ref
        .watch(asyncAmApiTestProvider)
        .whenData((response) => response.statusCode);

    final asyncUserToken =
        ref.watch(asyncAmUserTokenProvider).whenData((status) => status);

    return Center(
      child: Column(
        children: [
          Text("isDevTokenGenerated: ${devToken.isNotEmpty.toString()}"),
          asyncDevTokenStatus.when(
            data: (data) => Text("Developer Token Status: $data"),
            loading: () => const CircularProgressIndicator(),
            error: (err, stack) => Text(err.toString()),
          ),
          asyncUserToken.when(
            data: (data) {
              final isNotEmpty = data.isNotEmpty.toString();
              return Text("User Token: $isNotEmpty");
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
