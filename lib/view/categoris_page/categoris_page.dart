import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:grad_project/view/progect_detials/project_detials.dart';
import '../../model_view/bloc/categoris_cubit/get_categoris_data_cubit.dart';

class CategorisPage extends StatelessWidget {
  final String name;
  const CategorisPage({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final cubitt = BlocProvider.of<GetCategorisDataCubit>(context);
    cubitt.getData(problem: name);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Get.back();
            cubitt.data.clear();
          },
        ),
        title: Center(
            child: Text(
          name,
          style: const TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
        )),
      ),
      body: SafeArea(
          child: BlocConsumer<GetCategorisDataCubit, GetCategorisDataState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is WaitingDataState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SuccessDataState) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(15),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    margin: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    child: ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return FadeInUpBig(
                          child: InkWell(
                            onTap: () {
                              Get.to(ProjectDetials(
                                data: state.data[index],
                              ));
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            state.data[index]["name"],
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            state.data[index]["grad"],
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            "السنة ${state.data[index]["year"]}",
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            "المشكلة : ${state.data[index]["problem"]}",
                                            style:
                                                const TextStyle(fontSize: 13),
                                          ),
                                          Text(
                                            " المشاريع مقتبس منها : ${projects[index]["number"]}",
                                            style:
                                                const TextStyle(fontSize: 13),
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
            );
          }
          return Container();
        },
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
