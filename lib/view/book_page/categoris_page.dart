import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:grad_project/view/progect_detials/project_detials.dart';

class CategorisPage extends StatelessWidget {
  final String name;
  const CategorisPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          name,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        )),
      ),
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(15),
          // Center(
          //     child: Text(
          //   name,
          //   style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          // )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                itemCount: projects.length,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInUpBig(
                    child: InkWell(
                      onTap: () {
                        Get.to(const ProjectDetials());
                      },
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(139, 255, 193, 7),
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Expanded(
                                flex: 3,
                                child: Image.asset(
                                  "assets/icons/book.png",
                                  height: 80,
                                )),
                            Container(
                              height: 120,
                              width: 2,
                              color: const Color.fromARGB(96, 0, 0, 0),
                            ),
                            Expanded(
                                flex: 7,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      projects[index]["name"],
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      projects[index]["de"],
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "السنة ${projects[index]["years"]}",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      "المشكلة : ${projects[index]["problem"]}",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                    Text(
                                      " المشاريع مقتبس منها : ${projects[index]["number"]}",
                                      style: const TextStyle(fontSize: 13),
                                    ),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

List projects = [
  {
    "name": "نظافة حي غرب المنصورة",
    "de": "نظم معلومات",
    "years": "2022",
    "problem": "البيئة",
    "number": "2",
  }
];
