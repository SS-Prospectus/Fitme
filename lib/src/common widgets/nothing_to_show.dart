import 'package:flutter/material.dart';
import 'package:fitme/src/constants/assets.dart';

class NothingToShow extends StatelessWidget {
  const NothingToShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height / 12,
          bottom: MediaQuery.of(context).size.height / 12,
        ),
        child: Image.asset(
          PngAssets.errorImage,
          scale: 10,
        ),
      ),
    );
  }
}