import 'package:covid19/shared/theme.dart';
import 'package:flutter/material.dart';

class StatusCard extends StatelessWidget {
  final int total;
  final Color color;
  final String kasus;
  const StatusCard(
      {Key? key, required this.total, required this.color, required this.kasus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        bottom: 5,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            'Kasus $kasus',
            style: greyTextStyle.copyWith(fontSize: 14),
          ),
          const Spacer(),
          Text(
            total.toString(),
            style: greyTextStyle.copyWith(fontWeight: semiBold),
          ),
          const SizedBox(
            width: 5,
          ),
          Container(
            width: 10,
            height: 10,
            color: color,
          )
        ],
      ),
    );
  }
}
