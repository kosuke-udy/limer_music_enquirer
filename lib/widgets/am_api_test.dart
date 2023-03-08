import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../api/am_dio.dart';
// import '../util/app_logger.dart';

// final _logger = AppLogger.get("am_api_test.dart");

class AmApiTest extends ConsumerWidget {
  const AmApiTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: ref.watch(asyncAmDioProvider).when(
            data: (client) {
              return const Text("Client is Ready");
            },
            loading: () => const CircularProgressIndicator(),
            error: (error, stack) => Text(error.toString()),
          ),
    );
  }
}
