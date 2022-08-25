import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class ProfilSiswaPage extends StatelessWidget {
  const ProfilSiswaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bottomWidget() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            color: kBackgroundColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(defaultRadius),
              topRight: Radius.circular(defaultRadius),
            ),
          ),
          child: Column(
            children: const [],
          ),
        ),
      );
    }

    return Scaffold(
      backgroundColor: kGreenColor,
      body: Stack(children: [
        bottomWidget(),
      ]),
    );
  }
}
