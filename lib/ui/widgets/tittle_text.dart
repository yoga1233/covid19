import 'package:covid19/shared/theme.dart';
import 'package:flutter/material.dart';

class TittleText extends StatelessWidget {
  final String text;
  const TittleText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: blackTextStyle.copyWith(fontSize: 18, fontWeight: medium),
    );
  }
}
