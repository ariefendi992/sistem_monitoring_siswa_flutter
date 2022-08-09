import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String hintText;
  final double width;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({
    Key? key,
    required this.hintText,
    required this.onPressed,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: width,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: kTealColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultRadius),
          ),
        ),
        child: Text(
          hintText,
          style: whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
        ),
      ),
    );
  }
}
