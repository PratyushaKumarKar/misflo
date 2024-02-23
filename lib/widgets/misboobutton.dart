import 'package:flutter/material.dart';
import 'package:misflo/pages/home.dart';
import 'package:misflo/pages/misboo.dart';
import 'package:misflo/utils/screentools.dart';

class MisbooButton extends StatelessWidget {
  const MisbooButton({
    super.key,
    required this.widget,
  });

  final Home widget;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => SectionChat(
                      user: widget.user,
                    )));
      },
      child: Image.asset(
        "assets/misboo.png",
        height: height(context, 95),
        width: width(context, 95),
      ),
    );
  }
}
