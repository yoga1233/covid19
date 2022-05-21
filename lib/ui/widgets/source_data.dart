import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class SourceData extends StatelessWidget {
  final String tittle;
  final String subTittle;
  const SourceData({Key? key, required this.tittle, required this.subTittle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Text(
              tittle,
              style: greyTextStyle.copyWith(fontWeight: medium),
            ),
            const Spacer(),
            Text(
              subTittle,
              style: greyTextStyle.copyWith(fontWeight: light, fontSize: 12),
            ),
          ],
        ));
  }
}
