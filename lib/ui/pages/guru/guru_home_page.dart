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
        expandedHeight: 170,
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
        const SliverPadding(
          padding: EdgeInsets.only(top: 10),
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recent Menu',
                    style: blackTextStyle.copyWith(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                    ),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: kWhiteColor,
                        borderRadius: BorderRadius.circular(4),
                        boxShadow: [
                          BoxShadow(
                            color: kLightBlueColor,
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                            blurStyle: BlurStyle.outer,
                          )
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jam Mulai',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              const Text('08.00')
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Divider(
                            thickness: 1.0,
                            height: 2,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Jam Selesai',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              const Text('9.30')
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Divider(
                            thickness: 1.0,
                            height: 2,
                          ),
                          const SizedBox(height: 6),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Kelas',
                                style:
                                    blackTextStyle.copyWith(fontWeight: medium),
                              ),
                              const Text('VII-1')
                            ],
                          ),
                          const SizedBox(height: 4),
                          const Divider(
                            thickness: 1.0,
                            height: 2,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
        // SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     ((_, int index) {
        //       return Padding(
        //         padding: EdgeInsets.symmetric(
        //           horizontal: defaultPadding,
        //           vertical: 16,
        //         ),
        //         child: Container(
        //           height: 174,
        //           padding: const EdgeInsets.all(16),
        //           decoration: BoxDecoration(
        //             borderRadius: BorderRadius.circular(4),
        //             color: kWhiteColor,
        //           ),
        //         ),
        //       );
        //     }),
        //   ),
        // ),
      ],
    ));
  }
}
