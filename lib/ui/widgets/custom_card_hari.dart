import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class CustomHariCard extends StatelessWidget {
  final String hari;
  const CustomHariCard({
    super.key,
    required this.hari,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: AssetImage('assets/images/calendar.png'),
            height: 64,
          ),
          Text(
            hari,
            style: blackTextStyle.copyWith(
              fontWeight: medium,
            ),
          )
        ],
      ),
    );
  }
}
