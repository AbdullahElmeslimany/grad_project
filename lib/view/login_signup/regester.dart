import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:grad_project/model_view/textfromfieldcustom.dart';
import 'package:grad_project/view/login_signup/login.dart';
import '../../model_view/constant/login_constant.dart';
import '../../model_view/controller/regester_controller.dart';
import '../home/homepage.dart';

class RegesterPage extends StatelessWidget {
  const RegesterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(17.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/images/logo.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                  const Gap(25),
                  const Text(
                    "انشاء حساب",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  const Gap(12),
                  Form(
                    key: regesterKey,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 15),
                      // height: 210,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          textFromFieldcustom(
                              rtl: true,
                              keyboardType: TextInputType.name,
                              hight: 18,
                              width: MediaQuery.sizeOf(context).width - 50,
                              controller: namecontrol,
                              text: "الاسم"),
                          const Gap(10),
                          textFromFieldcustom(
                              keyboardType: TextInputType.emailAddress,
                              hight: 18,
                              width: MediaQuery.sizeOf(context).width - 50,
                              controller: emailController,
                              text: "الاميل"),
                          const Gap(10),
                          textFromFieldcustom(
                              keyboardType: TextInputType.number,
                              hight: 18,
                              width: MediaQuery.sizeOf(context).width - 50,
                              controller: idController,
                              text: "ID الجامعي"),
                          const Gap(10),
                          textFromFieldcustom(
                              keyboardType: TextInputType.visiblePassword,
                              hight: 18,
                              width: MediaQuery.sizeOf(context).width - 50,
                              controller: passwordController,
                              text: "الباسورد"),
                        ],
                      ),
                    ),
                  ),
                  const Gap(15),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.cyan[800],
                      ),
                      width: MediaQuery.sizeOf(context).width / 1.3,
                      child: MaterialButton(
                        height: 30,
                        child: loadRegesterButton == true
                            ? const CircularProgressIndicator()
                            : const Text(
                                "انشاء الحساب",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.bold),
                              ),
                        onPressed: () async {
                          if (regesterKey.currentState!.validate()) {
                            Get.to(const MyHomePage());
                          }
                        },
                      ),
                    ),
                  ),
                  const Gap(20),
                  Row(
                    children: [
                      const Text("لدي حساب:  ",
                          style: TextStyle(
                            fontSize: 12,
                          )),
                      InkWell(
                        onTap: () {
                          Get.offAll(
                            const LoginPage(),
                          );
                        },
                        child: const Text(
                          "تسجيل الدخول",
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
            ),
          ),
        ),
      ),
    );
  }
}
