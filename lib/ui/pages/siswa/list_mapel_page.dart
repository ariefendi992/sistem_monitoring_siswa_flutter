import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/mapel/list_mapel_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_card_list_mapel.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class ListMapelPage extends StatefulWidget {
  const ListMapelPage({Key? key}) : super(key: key);

  @override
  State<ListMapelPage> createState() => _ListMapelPageState();
}

class _ListMapelPageState extends State<ListMapelPage> {
  @override
  void initState() {
    context.read<ListMapelCubit>().fetchListMapel();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget appBar() {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage('assets/images/app_bar.png'),
          ),
        ),
      );
    }

    Widget appBarTitle() {
      return SafeArea(
        child: Column(
          children: [
            Container(
              height: 64,
              padding: EdgeInsets.all(defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      context.read<PageCubit>().setPage(0);
                      Navigator.pushReplacementNamed(context, '/mainSiswa');
                    },
                    child: const Image(
                      image: AssetImage('assets/images/left_arrow.png'),
                      height: 24,
                      width: 24,
                    ),
                  ),
                  Text(
                    'MATA PELAJARAN',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                      fontWeight: semiBold,
                    ),
                  ),
                  const SizedBox(),
                ],
              ),
            )
          ],
        ),
      );
    }
    // Widget header() {
    //   return Container(
    //     padding: EdgeInsets.only(
    //         left: defaultPadding, right: defaultPadding, bottom: 24),
    //     width: MediaQuery.of(context).size.width,
    //     height: 146,
    //     decoration: const BoxDecoration(
    //       gradient: LinearGradient(
    //         begin: Alignment.topCenter,
    //         end: Alignment.bottomCenter,
    //         colors: [
    //           Color(0xff54ADAA),
    //           Color(0xff618BAE),
    //         ],
    //       ),
    //     ),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.end,
    //       children: [
    //         Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             GestureDetector(
    //               onTap: () {
    //                 context.read<PageCubit>().setPage(0);
    //                 Navigator.pushReplacementNamed(context, '/mainSiswa');
    //               },
    //               child: Icon(
    //                 CupertinoIcons.arrow_left,
    //                 color: kWhiteColor,
    //                 size: 26,
    //               ),
    //             ),
    //             Text(
    //               'MATA PELAJARAN',
    //               style: whiteTextStyle.copyWith(
    //                 fontSize: 18,
    //                 fontWeight: semiBold,
    //               ),
    //             ),
    //             const SizedBox(),
    //           ],
    //         ),
    //       ],
    //     ),
    //   );
    // }

    Widget body() {
      return Container(
        margin: const EdgeInsets.only(top: 160, bottom: 48),
        padding: EdgeInsets.only(
          left: defaultPadding,
          right: defaultPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Pelajaran Sekolah',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                color: kPurpleCoror,
                fontWeight: semiBold,
              ),
            ),
            Flexible(child: BlocBuilder<ListMapelCubit, ListMapelState>(
              builder: (context, state) {
                if (state is ListMapelLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ListMapelSuccess) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 12),
                    shrinkWrap: true,
                    itemCount: state.mapel.length,
                    itemBuilder: (context, index) {
                      return CustomCardListMapel(state.mapel[index]);
                    },
                  );
                }
                return Container();
              },
            ))
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          // header(),
          appBar(),
          appBarTitle(),
          body(),
        ],
      ),
    );
  }
}
