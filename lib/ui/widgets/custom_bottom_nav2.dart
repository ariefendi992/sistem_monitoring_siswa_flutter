import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/page_cubit.dart';

class MyBottomNavigation extends StatelessWidget {
  final IconData icons;
  final int index;
  final String titleMenu;
  final Color colorIcon;
  final Color colorText;

  const MyBottomNavigation({
    this.colorIcon = const Color.fromARGB(255, 126, 215, 144),
    this.colorText = const Color.fromARGB(255, 126, 215, 144),
    required this.icons,
    required this.index,
    required this.titleMenu,
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageCubit, int>(
      builder: (context, state) {
        return BottomNavigationBar(
          selectedFontSize: 12,
          unselectedFontSize: 12,
          selectedLabelStyle: Theme.of(context).textTheme.headline5,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                icons,
                color: context.read<PageCubit>().state == index
                    ? colorIcon
                    : Colors.blueGrey[200],
              ),
              label: titleMenu,
            ),
          ],
        );
      },
    );
  }
}
