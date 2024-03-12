import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:grad_project/model_view/textfromfieldcustom.dart';
import 'package:grad_project/view/home/homepage.dart';
import 'package:grad_project/view/login_signup/regester.dart';
import '../../model_view/constant/login_constant.dart';
import '../../model_view/controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 10),
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
                          child: Image.asset("assets/images/logo.png")),
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
                                  width: MediaQuery.sizeOf(context).width - 50,
                                  controller: emailController,
                                  text: "الاميل"),
                              const SizedBox(
                                height: 17,
                              ),
                              textFromFieldcustom(
                                  pass: true,
                                  hight: 19,
                                  width: MediaQuery.sizeOf(context).width - 50,
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
                              Get.to(const MyHomePage());
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
      ),
    );
  }
}
