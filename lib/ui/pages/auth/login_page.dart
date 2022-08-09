import 'package:flutter/material.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_button.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBlueColor,
      body: Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/logo.png'),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Aplikasi Monitoring\n &\n Absensi Siwa'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: blackTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                    letterSpacing: 0.6,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(
                      horizontal: defaultPadding,
                      vertical: defaultPadding,
                    ),
                    decoration: BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.circular(defaultRadius),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            cursorColor: kBlackColor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kBlackColor,
                              ),
                              hintText: 'Username',
                              focusColor: kGreyColor,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kBlackColor),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            cursorColor: kBlackColor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key_sharp,
                                color: kBlackColor,
                              ),
                              hintText: 'Password',
                              focusColor: kGreyColor,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kBlackColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                CustomButton(
                  hintText: 'Masuk',
                  onPressed: () {},
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
