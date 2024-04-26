import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/model_view/bloc/Add_Project_cubit/add_project_cubit.dart';
import '../../model_view/textfromfieldcustom.dart';
import '../../model_view/bloc/cubit_image/select_image_cubit.dart';
import 'helper/card_search.dart';

TextEditingController yearProjectController = TextEditingController();
TextEditingController selectedValue = TextEditingController();

class AddProject extends StatelessWidget {
  const AddProject({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> addProjectKey = GlobalKey<FormState>();
    TextEditingController nameProjectController = TextEditingController();
    TextEditingController drProjectController = TextEditingController();
    TextEditingController asstanst1ProjectController = TextEditingController();
    TextEditingController asstanst2ProjectController = TextEditingController();
    TextEditingController ideaProjectController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "اضافة مشروع",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: Form(
          key: addProjectKey,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: SingleChildScrollView(
              child: BlocBuilder<SelectImageCubit, SelectImageState>(
                builder: (context, state) {
                  final cubit = BlocProvider.of<AddProjectCubit>(context);
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(20),
                      if (BlocProvider.of<SelectImageCubit>(context).isdata ==
                          true)
                        InkWell(
                          onTap: () {
                            BlocProvider.of<SelectImageCubit>(context)
                                .selectImage();
                          },
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: Image.file(
                                BlocProvider.of<SelectImageCubit>(context)
                                    .imagefile!,
                                height: 150,
                                width: 450,
                                fit: BoxFit.fitHeight,
                              )),
                        )
                      else
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<SelectImageCubit>(context)
                                  .selectImage();
                            },
                            icon: const Icon(
                              Icons.add_a_photo,
                              size: 50,
                            )),
                      const Gap(20),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: nameProjectController,
                          text: "اسم المشروع"),
                      const Gap(15),
                      // textFromFieldcustom(
                      //     rtl: true,
                      //     hight: 18,
                      //     backgroundAnable: true,
                      //     width: MediaQuery.sizeOf(context).width - 30,
                      //     controller: yearProjectController,
                      //     keyboardType: TextInputType.number,
                      //     text: "السنة"),
                      const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: drProjectController,
                          text: "اسم المشرف"),
                      const Gap(15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          textFromFieldcustom(
                              rtl: true,
                              hight: 18,
                              backgroundAnable: true,
                              width: MediaQuery.sizeOf(context).width / 2.3,
                              controller: asstanst1ProjectController,
                              text: "اسم المعيد  1"),
                          textFromFieldcustom(
                              rtl: true,
                              hight: 18,
                              backgroundAnable: true,
                              width: MediaQuery.sizeOf(context).width / 2.3,
                              controller: asstanst2ProjectController,
                              text: "اسم المعيد  2"),
                        ],
                      ),
                      const Gap(20),
                      cardDropDown(context),
                      const Gap(20),
                      textFromFieldcustom(
                          maxLines: 4,
                          length: true,
                          rtl: true,
                          hight: 18,
                          backgroundAnable: true,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: ideaProjectController,
                          text: "فكرة المشروع"),
                      const Gap(50),
                      Container(
                        height: 50,
                        width: MediaQuery.sizeOf(context).width / 1.22,
                        decoration: BoxDecoration(
                            color: Colors.cyan[800],
                            borderRadius: BorderRadius.circular(10)),
                        child: MaterialButton(
                          onPressed: () async {
                            if (addProjectKey.currentState!.validate()) {
                              Navigator.of(context).pop();
                              await cubit.addProject(
                                name: nameProjectController.text,
                                year: yearProjectController.text,
                                problem: selectedValue.text,
                                idea: ideaProjectController.text,
                                grad: "نظم المعلومات",
                                dr: drProjectController.text,
                                acctant: [
                                  asstanst1ProjectController.text,
                                  asstanst2ProjectController.text
                                ],
                              );
                            }
                          },
                          child: Text(
                            "حفظ",
                            style: GoogleFonts.alexandria(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
