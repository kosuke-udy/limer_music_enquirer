import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:udy_flutter_layout/udy_flutter_layout.dart';

import '../../router/routes.dart';
import '../../translations.g.dart';
import '../common_parts/common_parts.dart';
import '../common_values/common_values.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final common = ref.watch(commonValuesProvider);

    return PageScaffold(
      appBarTitle: Text(t.settings.settings),
      body: RefreshableListView(children: [
        Area(
          headline: Headline(t.settings.general),
          child: FilledCard(
            margin: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
              vertical: common.size.insetsSmall,
            ),
            child: ListTile(
              title: Text(t.settings.regeonsAndLanguages),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: common.size.infoIcon,
              ),
              onTap: () => ApStorefrontSettingPageRoute().go(context),
            ),
          ),
        ),
        Area(
          headline: Headline(t.settings.metadataOrder),
          child: FilledCard(
            margin: EdgeInsets.symmetric(
              horizontal: common.size.insetsLarge,
              vertical: common.size.insetsSmall,
            ),
            child: ListTile(
              title: Text(t.settings.song),
              trailing: Icon(
                Icons.arrow_forward_ios_rounded,
                size: common.size.infoIcon,
              ),
              onTap: () => SongMetadataOrderSettingPageRoute().go(context),
            ),
          ),
        ),
      ]),
    );
  }
}
