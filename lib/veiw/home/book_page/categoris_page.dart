import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:gap/gap.dart';

class CategorisPage extends StatelessWidget {
  final String name;
  const CategorisPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Gap(15),
          Center(
              child: Text(
            name,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          )),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              margin: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: ListView.builder(
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return FadeInUpBig(
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
                          const Expanded(
                              flex: 7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "اسم المشروع",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "نظم معلومات",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "السنة 2022",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    "المشكلة : التعليم",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                  Text(
                                    " المشاريع مقتبس منها : 2",
                                    style: TextStyle(fontSize: 13),
                                  ),
                                ],
                              ))
                        ],
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
