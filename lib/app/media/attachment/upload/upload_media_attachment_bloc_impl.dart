import 'package:fedi/app/media/attachment/upload/upload_media_attachment_bloc.dart';
import 'package:fedi/app/media/attachment/upload/upload_media_attachment_model.dart';
import 'package:fedi/disposable/disposable.dart';
import 'package:fedi/disposable/disposable_owner.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_model.dart';
import 'package:fedi/pleroma/media/attachment/pleroma_media_attachment_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:logging/logging.dart';
import 'package:rxdart/rxdart.dart';

var _logger = Logger("upload_media_attachment_bloc_impl.dart");

class UploadMediaAttachmentBloc extends DisposableOwner
    implements IUploadMediaAttachmentBloc {
  final IPleromaMediaAttachmentService pleromaMediaAttachmentService;

  final FilePickerFile filePickerFile;
  @override
  IPleromaMediaAttachment pleromaMediaAttachment;

  // ignore: close_sinks
  BehaviorSubject<UploadMediaAttachmentState> uploadStateSubject =
      BehaviorSubject.seeded(UploadMediaAttachmentState.notUploaded);

  @override
  Stream<UploadMediaAttachmentState> get uploadStateStream =>
      uploadStateSubject.stream;

  @override
  UploadMediaAttachmentState get uploadState => uploadStateSubject.value;

  UploadMediaAttachmentBloc(
      {@required this.pleromaMediaAttachmentService,
      @required this.filePickerFile}) {
    assert(pleromaMediaAttachmentService != null);
    addDisposable(subject: uploadStateSubject);
    addDisposable(disposable: CustomDisposable(() async {
      if (filePickerFile.isNeedDeleteAfterUsage) {
        await filePickerFile.file.delete();
      }
    }));
  }

  @override
  void startUpload() {
    assert(uploadState == UploadMediaAttachmentState.notUploaded ||
        uploadState == UploadMediaAttachmentState.failed);
    uploadStateSubject.add(UploadMediaAttachmentState.uploading);

    pleromaMediaAttachmentService
        .uploadMedia(file: filePickerFile.file)
        .then((pleromaMediaAttachment) {
      this.pleromaMediaAttachment = pleromaMediaAttachment;
      uploadStateSubject.add(UploadMediaAttachmentState.uploaded);
    }).catchError((error, stackTrace) {
      _logger.severe(() => "error during uploading", error, stackTrace);
      uploadStateSubject.add(UploadMediaAttachmentState.failed);
    });
  }

  @override
  String get filePath => filePickerFile.file.path;

  @override
  bool get isMedia => filePickerFile.isMedia;
}
