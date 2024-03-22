import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';

import '../edit_project/edit_project.dart';

class ProjectDetials extends StatelessWidget {
  final data;
  const ProjectDetials({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(EditProject(
                  data: data,
                ));
              },
              icon: Icon(
                Icons.edit_outlined,
                size: 30,
                color: Colors.grey[900],
              )),
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.download,
                  size: 30,
                  color: Colors.blue[900],
                )),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              "assets/images/proj1.png",
              height: 210,
              width: MediaQuery.sizeOf(context).width,
              fit: BoxFit.cover,
            ),
            Column(
              children: [
                const Gap(8),

                Container(
                  height: 110,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      Center(
                          child: Text(
                        data["name"],
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue[900]),
                      )),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "الشعبة",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                              ),
                              Text(
                                data["grad"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "السنة",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                              ),
                              Text(
                                data["year"],
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "المشكلة",
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey.shade500),
                              ),
                              Text(
                                data["problem"],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // const Gap(5),
                Container(
                  height: 60,
                  padding: const EdgeInsets.all(18),
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        data["dr"],
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade500),
                      ),
                      const Text(
                        "  : الدكتور المشرف",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 90,
                  padding: const EdgeInsets.all(17),
                  margin:
                      const EdgeInsets.symmetric(vertical: 1, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      const Text(
                        "  : معيد مساعد",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            data["acctant"][0],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey.shade500),
                          ),
                          Text(
                            data["acctant"][1],
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 13,
                                color: Colors.grey.shade500),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        ": اعداد",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w900,
                            color: Colors.grey.shade500),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 180,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            mainAxisExtent: 28,
                            crossAxisCount: 2,
                            mainAxisSpacing: 2),
                    itemCount: nameStudent.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          "${nameStudent[index]["name"]}",
                          style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  // height: 85,
                  padding: const EdgeInsets.all(18),
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "فكرة المشروع",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Gap(10),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          data["idea"],
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 13,
                              color: Colors.grey.shade500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 150,
                  padding: const EdgeInsets.all(18),
                  margin:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        "اللغات المستخدمة",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const Gap(10),
                      Container(
                        height: imagelang.length * 30,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(162, 215, 90, 45),
                            borderRadius: BorderRadius.circular(15)),
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 50,
                                  mainAxisSpacing: 10),
                          itemCount: imagelang.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(70),
                              child: Image.asset(
                                imagelang[index],
                                height: 15,
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

List nameStudent = [
  {"name": "عبدالرحمن كمال"},
  {"name": "عبدالرحمن علي مرتضي"},
  {"name": "عبدالله حاتم السيد شريف"},
  {"name": "عبدالله علي محمد"},
  {"name": "عبدالرحمن فرحات سرحان"},
  {"name": "محمود محمد الامام"},
  {"name": "محمدالبرعي شاكر"},
  {"name": "محمود مدحت السعيد"},
  {"name": "عبدالرحمن محمد"},
  {"name": "مصطفي محمد عبدالعزيز"},
];

List imagelang = [
  "assets/langcode/a.jpg",
  "assets/langcode/b.png",
  "assets/langcode/c.png",
  // "assets/langcode/d.jpg",
  "assets/langcode/e.jpg",
  "assets/langcode/f.jpg",
  "assets/langcode/g.png"
];
