import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../model_view/homepage_helper/search_card.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
            child: Container(
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("مكتبة موسوعة مشاريع التخرج"),
              const Gap(50),
              searchCardHomePage(context),
              const Gap(50),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/electronic2.png",
                    height: 150,
                  ),
                ],
              ),
              const Gap(50),
              Center(
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(25)),
                  child: MaterialButton(
                    onPressed: () {},
                    child: const Text("اضغظ"),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
