import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class GuruHomePage extends StatefulWidget {
  const GuruHomePage({Key? key}) : super(key: key);

  @override
  State<GuruHomePage> createState() => _GuruHomePageState();
}

class _GuruHomePageState extends State<GuruHomePage> {
  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return SliverAppBar(
        title: Padding(
          padding: EdgeInsets.only(left: defaultPadding),
          child: Text(
            'Selamat Datang...',
            style: whiteTextStyle.copyWith(fontSize: 16),
          ),
        ),
        centerTitle: false,
        floating: false,
        titleSpacing: 0,
        shadowColor: Colors.transparent,
        expandedHeight: 160,
        backgroundColor: kRedColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(defaultRadius),
            bottomRight: Radius.circular(defaultRadius),
          ),
        ),
        flexibleSpace: FlexibleSpaceBar(
          background: Container(
            margin: const EdgeInsets.only(top: 70),
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundColor: kWhiteColor,
                            child: const CircleAvatar(
                              radius: 37,
                              backgroundImage:
                                  AssetImage('assets/images/nancy.jpg'),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'NIP : 12345678890',
                                style: whiteTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Nama : Nancy Momoland',
                                style: whiteTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                'Guru : Bahasa Indonesia',
                                style: whiteTextStyle.copyWith(fontSize: 14),
                              ),
                              const SizedBox(height: 2),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        appBar(),
      ],
    ));
  }
}
