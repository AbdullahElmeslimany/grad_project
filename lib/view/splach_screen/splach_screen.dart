import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:grad_project/view/home/homepage.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 2300), () {
      // Get.to(
      //   const Directionality(
      //       textDirection: TextDirection.rtl, child: MyHomePage()),
      // );
    });
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/images/logo.png"),
            const Gap(15),
            FadeInUpBig(
              duration: const Duration(milliseconds: 900),
              child: const Text(
                "معهد مصر العالي للتجارة والحاسبات",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const Gap(8),
            FadeInUpBig(
              duration: const Duration(seconds: 2),
              child: const Text(
                "مرحبا بكم في المنصة الشاملة لمشاريع التخرج",
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          ],
        ),
      ),
    );
  }
}
