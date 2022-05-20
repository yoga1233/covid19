import 'package:covid19/shared/theme.dart';
import 'package:covid19/ui/widgets/status_card.dart';
import 'package:covid19/ui/widgets/tittle_text.dart';
import 'package:flutter/material.dart';

class KasusProvCard extends StatelessWidget {
  final String kota;
  final int positif;
  final int sembuh;
  final int dirawat;
  final int meninggal;
  const KasusProvCard(
      {Key? key,
      required this.kota,
      required this.positif,
      required this.sembuh,
      required this.dirawat,
      required this.meninggal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 10,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 20,
      ),
      decoration: BoxDecoration(
          color: bgColor, borderRadius: BorderRadius.circular(17)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TittleText(text: 'Prov $kota'),
          const SizedBox(
            height: 6,
          ),
          StatusCard(
            total: positif,
            color: yellowColor,
            kasus: 'Positif',
          ),
          StatusCard(
            total: sembuh,
            color: greenColor,
            kasus: 'Sembuh',
          ),
          StatusCard(
            total: dirawat,
            color: blueColor,
            kasus: 'Dirawat',
          ),
          StatusCard(
            total: meninggal,
            color: redColor,
            kasus: 'meninggal',
          ),
        ],
      ),
    );
  }
}
