library apple_music_providers;

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../api/apple_music_api/apple_music_api.dart';
import '../../utils/app_logger.dart';
import '../db/ap_storefront.dart';

export 'recently_played/songs.dart';
export 'recently_played/resources.dart';

part 'requests/album_from_track_id.dart';

final _client = AppleMusicApiClient();
