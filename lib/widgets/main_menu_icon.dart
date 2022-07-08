import 'package:flutter/cupertino.dart';

class MainMenuIcon extends StatelessWidget {
  final Color? color;

  final int index;
  const MainMenuIcon({Key? key, required this.color, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (() {
        switch (index) {
          case 0:
            return Icon(
              CupertinoIcons.collections,
              color: color,
            );

          case 1:
            return Icon(
              CupertinoIcons.briefcase,
              color: color,
            );

          case 2:
            return Icon(
              CupertinoIcons.search,
              color: color,
            );

          case 3:
            return Icon(
              CupertinoIcons.settings,
              color: color,
            );

          case 4:
            Icon(
              CupertinoIcons.collections,
              color: color,
            );
            break;
          default:
        }
        // your code here
      }()),
    );
  }
}
