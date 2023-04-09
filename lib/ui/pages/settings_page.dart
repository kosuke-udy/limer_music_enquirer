import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../router/routes.dart';
import '../common_parts/common_parts.dart';
import '../common_values/common_values.dart';
import '../components/components.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return PageScaffold(
      appBarTitle: const Text("Settings"),
      body: RefreshableListView(children: [
        Area(
          child: FilledCard(
            margin: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
              vertical: common.size.insetsSmall,
            ),
            child: ListTile(
              title: const Text("Metadata Locale"),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: common.size.infoIcon,
              ),
              onTap: () => MetadataLocaleSettingPageRoute().go(context),
            ),
          ),
        ),
      ]),
    );
  }
}
