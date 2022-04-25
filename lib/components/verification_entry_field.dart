import 'package:flutter/material.dart';
import 'package:notify/themes/colors.dart';

class VerificationEntryField extends StatelessWidget {
  final String? initialValue;
  const VerificationEntryField({Key? key, this.initialValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        margin: EdgeInsets.symmetric(vertical: 4, horizontal: 2),
        decoration: BoxDecoration(
            color: entryFieldBackgroundColor,
            borderRadius: BorderRadius.circular(30)),
        child: TextFormField(
          enableInteractiveSelection: true,
          initialValue: initialValue,
          textAlign: TextAlign.center,
          style: theme.textTheme.headline6!.copyWith(
            color: blackTextColor,
          ),
          decoration: InputDecoration(
            enabledBorder: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
