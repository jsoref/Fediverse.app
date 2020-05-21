import 'package:fedi/app/ui/button/text/fedi_filled_text_button.dart';
import 'package:fedi/pleroma/field/pleroma_field_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AccountFieldGridItemWidget extends StatelessWidget {
  final IPleromaField field;

  const AccountFieldGridItemWidget({@required this.field});

  @override
  Widget build(BuildContext context) {
    return FediFilledTextButton(
      field.name,
      onPressed: () {
        // todo: refactor extracting url
        String link = extractUrl(field.value);
        print(link);
        canLaunch(link).then((result) {
          launch(link);
        });
      },
    );
  }

  String extractUrl(String value) {
    String string = value.replaceAll(RegExp("</a>"), "");
    return string.replaceAll(RegExp("<a[^>]*>"), "");
  }
}