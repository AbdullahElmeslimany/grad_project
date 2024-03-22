import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/model_view/textfromfieldcustom.dart';

import '../../model_view/bloc/profile_cubit/get_data_profile_cubit.dart';

class SettingPage extends StatelessWidget {
  final String uID;
  const SettingPage({super.key, required this.uID});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<GetDataProfileCubit>(context);
    cubit.getData(uID: uID);

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          "بياناتك",
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
      ),
      body: BlocConsumer<GetDataProfileCubit, GetDataProfileState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is WaitingProfileState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is SucessDataProfileState) {
            TextEditingController nameEditController =
                TextEditingController(text: state.data[0]["name"]);
            TextEditingController emailEditController =
                TextEditingController(text: state.data[0]["email"]);
            TextEditingController passwordEditController =
                TextEditingController();
            TextEditingController idEditController =
                TextEditingController(text: state.data[0]["idunversty"]);
            return Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Gap(20),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(
                            "assets/icons/boy.png",
                            height: 100,
                            width: 100,
                          )),
                      const Gap(20),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: nameEditController,
                          text: "الاسم"),
                      const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: emailEditController,
                          text: "الاميل"),
                      const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: idEditController,
                          text: "ID الجامعي"),
                      const Gap(15),
                      textFromFieldcustom(
                          rtl: true,
                          hight: 18,
                          width: MediaQuery.sizeOf(context).width - 30,
                          controller: passwordEditController,
                          text: "الباسورد"),
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
                            "تعديل",
                            style: GoogleFonts.alexandria(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
