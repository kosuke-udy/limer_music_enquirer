import 'package:flutter/material.dart';
<<<<<<< Updated upstream
import 'package:hooks_riverpod/hooks_riverpod.dart';
=======
import 'package:flutter_riverpod/flutter_riverpod.dart';
>>>>>>> Stashed changes
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/providers.dart';
import '../../../providers/db/providers.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';

class ApStorefrontSettingPage extends ConsumerWidget {
  const ApStorefrontSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PageScaffold(
<<<<<<< Updated upstream
=======
      isAllowedToPopScreen: true,
>>>>>>> Stashed changes
      appBarTitle: const Text("Settings: Metadata Locale"),
      body: ref.watch(apStorefrontSettingProvider).when(
            data: (data) => _afterPreloaded(context, ref, data),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
            error: (error, stackTrace) => const Center(child: Text("Error")),
          ),
    );
  }

  Widget _afterPreloaded(
    BuildContext context,
    WidgetRef ref,
    ApStorefrontSettingCollection setting,
  ) {
    final userLocales = setting.list;

    final common = ref.watch(commonValuesProvider);

    return RefreshableListView(
      children: [
        Area(
          headline: const Headline("Selected Locales"),
          child: FilledCard(
            margin: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
            ),
            child: Column(
              children: userLocales.map((e) {
                return ListTile(
                  title: Text(
                    "${e.countryId.toUpperCase()}: ${e.languageTag}",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
        Area(
          headline: const Headline("Available Locales"),
          child: FilledCard(
            margin: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
            ),
            child: ref.watch(allStorefrontsProvider).when(
                  data: (data) {
                    return Column(
                      children: data.map((e) {
                        return ListTile(
                          title: Text(
                            "${e.id}: ${e.attributes!.defaultLanguageTag}",
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          trailing: Icon(
                            Icons.add,
                            size: common.size.infoIcon,
                          ),
                        );
                      }).toList(),
                    );
                  },
                  loading: () =>
                      const Center(child: CircularProgressIndicator.adaptive()),
                  error: (error, stackTrace) =>
                      const Center(child: Text("Error")),
                ),
          ),
        ),
      ],
    );
  }
}
