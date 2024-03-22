import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/view/add_project/add_project.dart';
import 'package:grad_project/view/home/homepage_helper/cardimportant_homepage.dart';
import 'package:grad_project/view/home/homepage_helper/categorycard_homepage.dart';
import 'package:grad_project/view/home/homepage_helper/search_card.dart';
import 'package:grad_project/view/home/homepage_helper/years_categorise.dart';
import 'package:grad_project/view/setting_page/setting_page.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isAdmin = true;
    return Scaffold(
      body: SafeArea(
          child: Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
          margin: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "موسوعة كاملة لمشاريع التخرج",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const SettingPage());
                      },
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/icons/boy.png",
                            height: 50,
                            width: 50,
                          )),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "تستطيع ايجاد ما تبحث عنه في  \nمشاريع التخرج السابقة",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    if (isAdmin == true)
                      IconButton(
                          onPressed: () {
                            Get.to(const AddProject());
                          },
                          icon: const Icon(
                            Icons.add_rounded,
                            size: 32,
                          ))
                    else
                      Container(),
                  ],
                ),
                const Divider(),
                searchCardHomePage(context),
                const Divider(),
                Center(
                  child: Container(
                    margin: const EdgeInsets.all(15),
                    height: 55,
                    width: MediaQuery.sizeOf(context).width,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 145, 80, 1),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                        child: Text(
                      "الاقسام",
                      style: GoogleFonts.alexandria(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )),
                  ),
                ),
                categoryCard(),
                const Gap(15),
                const Text(
                  "سنوات المشاريع",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                yearsCategorise(),
                cardimportantHomePage()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
