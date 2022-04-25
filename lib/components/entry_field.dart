import 'package:flutter/material.dart';
import 'package:notify/themes/colors.dart';

class EntryField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixWidget;
  final String? initialValue;
  final EdgeInsets? margin;
  final EdgeInsets? padding;

  const EntryField(
      {Key? key,
      this.hintText,
      this.suffixWidget,
      this.initialValue,
      this.margin,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Container(
      padding: padding ?? EdgeInsets.symmetric(vertical: 4, horizontal: 20),
      margin: margin ?? EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      decoration: BoxDecoration(
          color: entryFieldBackgroundColor,
          borderRadius: BorderRadius.circular(30)),
      child: TextFormField(
        enableInteractiveSelection: true,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          hintText: hintText,
          hintStyle: theme.textTheme.subtitle2!.copyWith(
            color: entryFieldHintColor,
          ),
          suffixIcon: suffixWidget ?? SizedBox.shrink(),
        ),
      ),
    );
  }
}
