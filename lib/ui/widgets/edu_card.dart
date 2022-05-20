import 'package:covid19/shared/theme.dart';
import 'package:covid19/ui/widgets/subtittle_text.dart';
import 'package:covid19/ui/widgets/tittle_text.dart';
import 'package:flutter/material.dart';

class EduCard extends StatelessWidget {
  final String imageUrl;
  final String tittle;
  final String subTittle;
  final Function() onTap;

  const EduCard({
    Key? key,
    required this.imageUrl,
    required this.tittle,
    required this.subTittle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 24,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(17),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              imageUrl,
              width: 50,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TittleText(text: tittle),
                SubTittleText(text: subTittle)
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: greyColor,
            )
          ],
        ),
      ),
    );
  }
}
