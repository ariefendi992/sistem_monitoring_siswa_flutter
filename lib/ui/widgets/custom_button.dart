import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class CustomButton extends StatelessWidget {
  final String hintText;
  final double width, height, borderRadius, fontSize;
  final Function() onPressed;
  final EdgeInsets margin;

  const CustomButton({
    Key? key,
    required this.hintText,
    required this.onPressed,
    required this.height,
    this.borderRadius = 18.0,
    this.width = double.infinity,
    this.margin = EdgeInsets.zero,
    this.fontSize = 22,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
            // backgroundColor: kGreenColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            padding: const EdgeInsets.all(0)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xff6387AF),
                  Color(0xff4A4CA1),
                ],
              ),
              borderRadius: BorderRadius.circular(2)),
          child: Center(
            child: Text(
              hintText,
              style: whiteTextStyle.copyWith(
                fontWeight: medium,
                fontSize: fontSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
