import 'package:covid19/model/prov_model.dart';
import 'package:covid19/shared/theme.dart';
import 'package:covid19/ui/widgets/status_card.dart';
import 'package:covid19/ui/widgets/tittle_text.dart';
import 'package:flutter/material.dart';

class KasusProvCard extends StatelessWidget {
  final ProvModel prov;

  const KasusProvCard(
    this.prov, {
    Key? key,
  }) : super(key: key);

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
          TittleText(text: prov.provinsi),
          const SizedBox(
            height: 6,
          ),
          StatusCard(
            total: prov.positif,
            color: yellowColor,
            kasus: 'Positif',
          ),
          StatusCard(
            total: prov.sembuh,
            color: greenColor,
            kasus: 'Sembuh',
          ),
          StatusCard(
            total: prov.dirawat,
            color: blueColor,
            kasus: 'Dirawat',
          ),
          StatusCard(
            total: prov.meninggal,
            color: redColor,
            kasus: 'meninggal',
          ),
        ],
      ),
    );
  }
}
