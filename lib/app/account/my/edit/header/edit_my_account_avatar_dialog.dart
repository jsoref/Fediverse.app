import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:fedi/app/file/image/crop/file_image_crop_helper.dart';
import 'package:fedi/file/picker/file_picker_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showEditMyAccountAvatarDialog(
    BuildContext context,
    FilePickerFile filePickerFile,
    FilePickerSelectedFileCallback selectedCallback) {
  showDialog(
      context: context,
      child: AlertDialog(
        title: Text(tr("app.account.my.edit.field.avatar.dialog.title")),
        content: Image.file(filePickerFile.file),
        actions: <Widget>[
          FlatButton(
              onPressed: () async {
                File croppedFile =
                    await cropImageToSquare(filePickerFile.file, context);

                dismissDialog(context);
                if (croppedFile != null) {
                  if (filePickerFile.isNeedDeleteAfterUsage) {
                    await filePickerFile.file.delete();
                  }

                  selectedCallback(FilePickerFile(
                      file: croppedFile,
                      type: filePickerFile.type,
                      isNeedDeleteAfterUsage: true));
                } else {
                  selectedCallback(filePickerFile);
                }
              },
              child: Text(tr(
                  "app.account.my.edit.field.avatar.dialog.action.select_and_crop"))),
          FlatButton(
              onPressed: () {
                dismissDialog(context);
              },
              child: Text(tr(
                  "app.account.my.edit.field.avatar.dialog.action.cancel"))),
        ],
      ));
}

void dismissDialog(BuildContext context) {
  Navigator.pop(context);
}