import 'package:flutter/material.dart';

class AudioGridView extends StatelessWidget {
  final int? count;

  const AudioGridView({Key? key, this.count}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<String> time = [
      "1:20",
      "0:20",
      "4:33",
      "0.58",
      "1:48",
      "1:20",
      "0.20",
      "4.33"
    ];
    return GridView.builder(
        padding: EdgeInsets.zero,
        itemCount: count,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.2, crossAxisCount: 3),
        itemBuilder: (context, index) {
          return Container(
            color: theme.scaffoldBackgroundColor,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Icon(
                  Icons.headset,
                  color: theme.primaryColor,
                  size: 50,
                ),
                SizedBox(
                  height: 6,
                ),
                Text(
                  time[index],
                  style: theme.textTheme.caption!.copyWith(
                    color: theme.primaryColor,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        });
  }
}
