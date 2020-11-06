import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skelaton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    int max = (size.width * .6).round();
    int min = (size.width * .3).round();

    Random rnd = new Random();
    int r = min + rnd.nextInt(max - min);

    return Shimmer.fromColors(
      highlightColor: Colors.white,
      baseColor: Colors.grey[300],
      child: Container(
        padding: EdgeInsets.only(top: 15, bottom: 15, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: r.toDouble(),
              height: 15,
              color: Colors.grey,
            ),
            SizedBox(height: 5),
            Container(
              width: 150,
              height: 15,
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
