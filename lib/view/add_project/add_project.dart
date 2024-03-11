import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../model_view/textfromfieldcustom.dart';
import '../../model/cubit/select_image_cubit.dart';

class AddProject extends StatelessWidget {
  const AddProject({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameProjectController = TextEditingController();
    TextEditingController yearProjectController = TextEditingController();
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
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          child: SingleChildScrollView(
            child: BlocBuilder<SelectImageCubit, SelectImageState>(
              builder: (context, state) {
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
                          icon: const Icon(Icons.image)),
                    const Gap(20),
                    textFromFieldcustom(
                        rtl: true,
                        hight: 18,
                        width: MediaQuery.sizeOf(context).width - 30,
                        controller: nameProjectController,
                        text: "اسم المشروع"),
                    const Gap(15),
                    textFromFieldcustom(
                        rtl: true,
                        hight: 18,
                        width: MediaQuery.sizeOf(context).width - 30,
                        controller: yearProjectController,
                        text: "السنة"),
                    const Gap(15),
                    textFromFieldcustom(
                        rtl: true,
                        hight: 18,
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
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            controller: asstanst1ProjectController,
                            text: "اسم المعيد  1"),
                        textFromFieldcustom(
                            rtl: true,
                            hight: 18,
                            width: MediaQuery.sizeOf(context).width / 2.3,
                            controller: asstanst1ProjectController,
                            text: "اسم المعيد  2"),
                      ],
                    ),
                    const Gap(15),
                    textFromFieldcustom(
                        maxLines: 4,
                        length: true,
                        rtl: true,
                        hight: 18,
                        width: MediaQuery.sizeOf(context).width - 30,
                        controller: ideaProjectController,
                        text: "فكرة المشروع"),
                    const Gap(90),
                    Container(
                      height: 50,
                      width: MediaQuery.sizeOf(context).width / 1.22,
                      decoration: BoxDecoration(
                          color: Colors.cyan[800],
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: () {},
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
    );
  }
}
