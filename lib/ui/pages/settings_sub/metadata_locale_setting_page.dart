import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../../providers/apple_music/providers.dart';
import '../../../providers/db/providers.dart';
import '../../common_parts/common_parts.dart';
import '../../common_values/common_values.dart';
import '../../components/components.dart';

class MetadataLocaleSettingPage extends ConsumerWidget {
  const MetadataLocaleSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return PageScaffold(
      appBarTitle: const Text("Settings: Metadata Locale"),
      body: RefreshableListView(
        children: [
          Area(
            headline: const Headline("Selected Locales"),
            child: FilledCard(
              margin: EdgeInsets.symmetric(
                horizontal: common.size.insetsLarge,
              ),
              child: Column(
                children: ref.watch(metadataLocalesProvider).map((e) {
                  return ListTile(
                    title: Text(
                      "${e.countryCode.toUpperCase()}: ${e.languageCode}",
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
                        const Center(child: CircularProgressIndicator()),
                    error: (error, stackTrace) =>
                        const Center(child: Text("Error")),
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
