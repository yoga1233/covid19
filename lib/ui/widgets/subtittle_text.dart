import 'package:covid19/shared/theme.dart';
import 'package:flutter/material.dart';

class SubTittleText extends StatelessWidget {
  final String text;
  const SubTittleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: greyTextStyle.copyWith(fontSize: 14, fontWeight: light),
    );
  }
}
