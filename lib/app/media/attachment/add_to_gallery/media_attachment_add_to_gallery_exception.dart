import 'package:fedi/mastodon/media/attachment/mastodon_media_attachment_model.dart';

class MediaAttachmentCantAddToGalleryException implements Exception {
  final IMastodonMediaAttachment mediaAttachment;
  MediaAttachmentCantAddToGalleryException(this.mediaAttachment);
}