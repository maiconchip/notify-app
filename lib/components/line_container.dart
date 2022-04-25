import 'package:flutter/material.dart';

class LineContainer extends StatelessWidget {
  const LineContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.5,
      color: Theme.of(context).hintColor,
    );
  }
}
