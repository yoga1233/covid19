import 'package:covid19/model/indo_model.dart';
import 'package:covid19/ui/widgets/status_card.dart';
import 'package:flutter/material.dart';

import '../../shared/theme.dart';
import 'subtittle_text.dart';
import 'tittle_text.dart';

class KasusHarian extends StatelessWidget {
  final IndoModel indo;
  const KasusHarian(
    this.indo, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String tanggal = indo.lastUpdate;
    var splitted = tanggal.substring(0, 10);
    var hasil = splitted.split('-');

    return Column(
      children: [
        Row(
          children: [
            const TittleText(text: 'Update Kasus Hari Ini'),
            const SizedBox(
              width: 10,
            ),
            SubTittleText(text: hasil[2] + '  ' + hasil[1] + '  ' + hasil[0]),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        StatusCard(
          total: indo.positif,
          color: yellowColor,
          kasus: 'Positif',
        ),
        StatusCard(
          total: indo.sembuh,
          color: greenColor,
          kasus: 'Sembuh',
        ),
        StatusCard(
          total: indo.dirawat,
          color: blueColor,
          kasus: 'Dirawat',
        ),
        StatusCard(
          total: indo.positif,
          color: redColor,
          kasus: 'meninggal',
        ),
      ],
    );
  }
}
