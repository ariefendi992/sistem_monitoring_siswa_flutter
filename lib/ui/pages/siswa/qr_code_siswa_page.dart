import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_button.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/url.dart';

class QrCodeSiswa extends StatelessWidget {
  const QrCodeSiswa({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: kGreenColor,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: <Color>[kGradienGreen, kGradienBlue]),
        ),
        child: Center(
          child: BlocBuilder<SiswaCubit, SiswaState>(
            builder: (context, state) {
              if (state is SiswaSuccess) {
                return Container(
                  margin: const EdgeInsets.only(left: 24, right: 24),
                  child: Column(
                    children: [
                      const SizedBox(height: 70),
                      Text(
                        'Scan Me QR Code',
                        style: whiteTextStyle.copyWith(
                            fontWeight: bold, fontSize: 24),
                      ),
                      const SizedBox(height: 70),
                      state.siswa.qrCode != null
                          ? Container(
                              padding: const EdgeInsets.all(8),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(defaultRadius),
                                child: SizedBox.fromSize(
                                  size: const Size.fromRadius(86),
                                  child: Image.network(
                                    '$baseUrl' '${state.siswa.qrCode}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              margin: const EdgeInsets.only(top: 40),
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: CustomButton(
                                hintText: 'Generate QR Code',
                                onPressed: () {
                                  context.read<SiswaCubit>().generateQrCode();
                                },
                                height: 45,
                                fontSize: 18,
                              ),
                            ),
                      const SizedBox(height: 24),
                      Text(
                        'Scan QR Code for Absen Siswa',
                        style: whiteTextStyle.copyWith(fontSize: 17),
                      ),
                    ],
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ),
    );
  }
}
