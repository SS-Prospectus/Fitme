import 'package:flutter/material.dart';
import 'package:fitme/src/constants/constants.dart';

class iconContent extends StatelessWidget {
  iconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(height: 15.0,),
        Text(
          label,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}