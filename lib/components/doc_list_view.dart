import 'package:flutter/material.dart';
import 'package:notify/themes/colors.dart';
import 'package:notify/locale/locales.dart';

class DocDetails {
  final String image;
  final String? title;
  final String? subtitle;

  DocDetails(this.image, this.title, this.subtitle);
}

class DocListView extends StatelessWidget {
  final int? count;
  const DocListView({this.count});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<DocDetails> _docDetails = [
      DocDetails("assets/extensions/.doc.png", "Dr Peter Hohn Proposal",
          context.getTranslationOf('word')),
      DocDetails(
          "assets/extensions/.pdf.png",
          context.getTranslationOf('appointment_letter'),
          context.getTranslationOf('pdf')),
      DocDetails(
          "assets/extensions/.xls.png",
          context.getTranslationOf('monthly_report'),
          context.getTranslationOf('excel')),
    ];
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: count,
        itemBuilder: (context, index) {
          return Container(
              color: theme.scaffoldBackgroundColor,
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 4),
              child: ListTile(
                minLeadingWidth: 60,
                leading: Image.asset(
                  _docDetails[index].image,
                  width: 34,
                  height: 40,
                  fit: BoxFit.fill,
                ),
                title: Text(
                  _docDetails[index].title!,
                  style: theme.textTheme.subtitle2!.copyWith(
                    color: blackTextColor,
                  ),
                ),
                subtitle: Text(
                  _docDetails[index].subtitle!,
                  style: theme.textTheme.caption,
                ),
              ));
        });
  }
}
