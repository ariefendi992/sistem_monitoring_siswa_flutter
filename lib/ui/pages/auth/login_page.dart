import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/auth/auth_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/cubit/siswa/siswa_cubit.dart';
import 'package:sistem_monitoring_siswa_flutter/ui/widgets/custom_button.dart';
import 'package:sistem_monitoring_siswa_flutter/utils/theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
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
                    fontWeight: semiBold,
                    fontSize: 17,
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
                      vertical: 22,
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
                            controller: usernameController,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kBlackColor,
                              ),
                              hintText: 'Username',
                              hintStyle: greyTextStyle.copyWith(),
                              focusColor: kGreyColor,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kBlackColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            cursorColor: kBlackColor,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.vpn_key_sharp,
                                color: kBlackColor,
                              ),
                              hintText: 'Password',
                              hintStyle: greyTextStyle.copyWith(),
                              focusColor: kGreyColor,
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: kBlackColor),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        BlocConsumer<AuthCubit, AuthState>(
                          listener: (context, state) {
                            if (state is AuthSuccess) {
                              // debugPrint('group = ${state.users.group}');
                              if (state.users.group == 'guru') {
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/mainGuru', (route) => false);
                              } else if (state.users.group == 'siswa') {
                                context.read<SiswaCubit>().getOneSiswa();
                                Navigator.pushNamedAndRemoveUntil(
                                    context, '/mainSiswa', (route) => false);
                              }
                            } else if (state is AuthFailed) {
                              debugPrint(state.error);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: Colors.redAccent,
                                  content: Text(state.error),
                                ),
                              );
                            }
                          },
                          builder: (context, state) {
                            return CustomButton(
                              height: 50,
                              borderRadius: 6.0,
                              width: double.infinity,
                              hintText: 'Masuk',
                              onPressed: () {
                                // prosesLogin();
                                context.read<AuthCubit>().login(
                                      username: usernameController.text,
                                      password: passwordController.text,
                                    );
                              },
                            );
                          },
                        ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
