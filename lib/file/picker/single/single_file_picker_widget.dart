import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/disposable/disposable_provider.dart';
import 'package:fedi/file/gallery/file_gallery_bloc.dart';
import 'package:fedi/file/gallery/file_gallery_bloc_impl.dart';
import 'package:fedi/file/gallery/file_gallery_widget.dart';
import 'package:fedi/file/picker/file_picker_bloc.dart';
import 'package:fedi/file/picker/file_picker_body_widget.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:fedi/file/picker/gallery/file_picker_gallery_adapter.dart';
import 'package:fedi/media/media_video_player_widget.dart';
import 'package:fedi/permission/storage_permission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SingleFilePickerWidget extends FilePickerBodyWidget {
  @override
  Widget build(BuildContext context) => buildBody(context);

  @override
  Widget buildBodyGalleryWidget(
      BuildContext context, IFilePickerBloc filePickerBloc) {
    return DisposableProvider<IFileGalleryBloc>(create: (BuildContext context) {
      var fileGalleryBloc = FileGalleryBloc(
          fileTypesToPick: filePickerBloc.fileTypesToPick,
          storagePermissionBloc:
              IStoragePermissionBloc.of(context, listen: false));

      fileGalleryBloc.performAsyncInit();

      return fileGalleryBloc;
    }, child: FileGalleryWidget(
      galleryFileTapped: (galleryFile) {
        FilePickerFile filePickerFile = mapGalleryToFilePickerFIle(galleryFile);
        if (filePickerFile.type == FilePickerFileType.video) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: Text(tr("file.picker.single.video.confirm.dialog.title")),
                  content: MediaVideoPlayerWidget.localFile(
                    localFile: filePickerFile.file,
                  ),
                  actions: [
                    FlatButton(
                      child: Text(tr("file.picker.single.video.confirm.dialog"
                              ".action.select")),
                      onPressed: () {
                        Navigator.pop(context);
                        filePickerBloc
                            .onFileSelected(filePickerFile = filePickerFile);
                      },
                    ),
                    FlatButton(
                      child: Text(tr("file.picker.single.video.confirm.dialog"
                              ".action.cancel")),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    )
                  ]
//                actions: actions,
                  );
            },
          );
        } else {
          filePickerBloc.onFileSelected(filePickerFile = filePickerFile);
        }
      },
    ));
  }
}
