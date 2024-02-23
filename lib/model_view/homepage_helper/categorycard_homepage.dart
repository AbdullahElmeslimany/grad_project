import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:grad_project/model_view/constant/category_list.dart/category_list_constant.dart';
import 'package:grad_project/veiw/home/book_page/categoris_page.dart';

categoryCard() {
  return Container(
    height: 260,
    padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
    decoration: BoxDecoration(
        color: const Color.fromARGB(214, 218, 218, 218),
        borderRadius: BorderRadius.circular(15)),
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            Get.to(CategorisPage(name:categoryList[index]["name"]));
          },
          child: Container(
            margin: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: ExactAssetImage(
                    categoryList[index]["image"],
                  )),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color.fromARGB(59, 245, 245, 245),
                  ),
                  margin: const EdgeInsets.all(11),
                  child: Center(
                    child: Text(
                      categoryList[index]["name"],
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    ),
  );
}
