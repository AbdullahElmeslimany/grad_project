import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/model_view/textfromfieldcustom.dart';
import 'package:grad_project/view/home/homepage.dart';
import 'package:grad_project/view/login_signup/regester.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../../model_view/constant/login_constant.dart';
import '../../model_view/controller/login_controller.dart';
import '../../model_view/bloc/login_regester_cubit/login_and_regester_cubit.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<LoginAndRegesterCubit>(context);
    String imagelogo = "assets/images/logo.png";
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: BlocConsumer<LoginAndRegesterCubit, LoginAndRegesterState>(
          listener: (BuildContext context, LoginAndRegesterState state) {
            if (state is ErrorState) {
              Get.snackbar("Error", state.message);
            }
          },
          builder: (context, state) {
            return ModalProgressHUD(
              inAsyncCall: cubit.loading,
              child: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 220,
                                height: 200,
                                child: Image.asset(imagelogo)),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "مرحبا بك",
                              style: GoogleFonts.alexandria(
                                  fontSize: 30, color: darkcolor),
                            ),
                            const Gap(12),
                            Form(
                              key: loginkey,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 20),
                                // height: 210,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(25)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    textFromFieldcustom(
                                        hight: 19,
                                        width:
                                            MediaQuery.sizeOf(context).width -
                                                50,
                                        controller: emailController,
                                        text: "البريد الالكتروني"),
                                    const SizedBox(
                                      height: 17,
                                    ),
                                    textFromFieldcustom(
                                        pass: true,
                                        hight: 19,
                                        width:
                                            MediaQuery.sizeOf(context).width -
                                                50,
                                        controller: passwordController,
                                        text: "الباسورد"),
                                    const Gap(8),
                                    InkWell(
                                      onTap: () {},
                                      child: const Text(
                                        "نسيت كلمة السر",
                                        style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Gap(30),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.cyan[800],
                              ),
                              width: MediaQuery.sizeOf(context).width / 1.4,
                              child: MaterialButton(
                                height: 30,
                                child: loadButton == true
                                    ? const CircularProgressIndicator()
                                    : const Text(
                                        "تسجيل الدخول",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold),
                                      ),
                                onPressed: () async {
                                  if (loginkey.currentState!.validate()) {
                                    cubit.login(
                                        email: emailController.text,
                                        password: passwordController.text);
                                  }
                                },
                              ),
                            ),
                            const Gap(15),
                            Row(
                              children: [
                                const Text(
                                  "ليس لدي حساب:  ",
                                ),
                                InkWell(
                                  onTap: () {
                                    Get.offAll(
                                      const RegesterPage(),
                                    );
                                  },
                                  child: const Text(
                                    "انشاء حساب",
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.blue,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
