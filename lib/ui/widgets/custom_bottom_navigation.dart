import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigation extends StatelessWidget {
  final IconData icons;
  final int index;
  final String titleMenu;

  const CustomNavigation({
    Key? key,
    required this.icons,
    required this.index,
    required this.titleMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<PageCubit>().setPage(index);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              Icon(
                icons,
                size: 30,
                color: context.read<PageCubit>().state == index
                    ? kGreenColor
                    : kBlackColor,
              ),
              Text(
                titleMenu,
                style: context.read<PageCubit>().state == index
                    ? greenTextStyle.copyWith(fontWeight: medium)
                    : blackTextStyle.copyWith(fontWeight: medium),
              ),
              const SizedBox(),
              // const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
