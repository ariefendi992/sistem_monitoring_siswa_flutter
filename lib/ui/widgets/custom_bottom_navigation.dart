import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomNavigation extends StatelessWidget {
  final IconData icons;
  final int index;
  final String titleMenu;
  final Color colorIcon;
  final Color colorText;

  const CustomNavigation({
    Key? key,
    this.colorIcon = const Color.fromARGB(255, 126, 215, 144),
    this.colorText = const Color.fromARGB(255, 126, 215, 144),
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
                size: 18,
                color: context.read<PageCubit>().state == index
                    ? colorIcon
                    : Colors.blueGrey[200],
              ),
              Text(
                titleMenu,
                style: context.read<PageCubit>().state == index
                    ? greenTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 14,
                        color: colorText,
                      )
                    : greyTextStyle.copyWith(
                        fontWeight: medium,
                        color: Colors.blueGrey[200],
                        fontSize: 14),
              ),
              // const SizedBox(),
              // const SizedBox(),
            ],
          ),
        );
      },
    );
  }
}
