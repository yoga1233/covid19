import 'package:covid19/shared/theme.dart';
import 'package:flutter/material.dart';

class InformasiCard extends StatelessWidget {
  final String imageUrl;
  final String tittle;
  final Color color;
  final Function() onTap;
  const InformasiCard(
      {Key? key,
      required this.imageUrl,
      required this.tittle,
      required this.color,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 24),
        width: 180,
        height: 180,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(18)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageUrl,
              color: whiteColor,
              width: 100,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              tittle,
              style:
                  whiteTextStyle.copyWith(fontSize: 24, fontWeight: semiBold),
            )
          ],
        ),
      ),
    );
  }
}
