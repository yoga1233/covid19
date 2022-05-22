import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimerKasus extends StatelessWidget {
  const ShimerKasus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: Container(
          margin: const EdgeInsets.only(bottom: 5),
          child: Column(
            children: [
              Column(
                children: const [
                  SizedBox(
                    width: 120,
                    height: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 50,
                    height: 10,
                  ),
                ],
              ),
              Row(
                children: const [
                  SizedBox(
                    width: 120,
                    height: 10,
                  ),
                  Spacer(),
                  SizedBox(
                    width: 50,
                    height: 10,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ],
          ),
        ),
        baseColor: Colors.grey.shade200,
        highlightColor: Colors.white);
  }
}
