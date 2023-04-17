import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:metadata_fetch/metadata_fetch.dart';

final providerOfPeamanMetadata =
    FutureProvider.family<Metadata?, String>((ref, url) async {
  if (url.isEmpty) return null;

  if (!url.contains('https')) {
    url = 'https://$url';
  }

  final result = await MetadataFetch.extract(url);
  return result;
});
