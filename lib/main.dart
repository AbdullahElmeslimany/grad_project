import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/view/home/homepage.dart';
import 'package:grad_project/model_view/bloc/login_regester_cubit/login_and_regester_cubit.dart';
import 'model_view/bloc/cubit_image/select_image_cubit.dart';
import 'view/add_project/add_project.dart';
import 'model_view/bloc/categoris_cubit/get_categoris_data_cubit.dart';
import 'view/login_signup/login.dart';
import 'view/search_page/search_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SelectImageCubit>(
          create: (BuildContext context) => SelectImageCubit(),
        ),
        BlocProvider<LoginAndRegesterCubit>(
          create: (BuildContext context) => LoginAndRegesterCubit(),
        ),
        BlocProvider<GetCategorisDataCubit>(
          create: (BuildContext context) => GetCategorisDataCubit(),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'مكتبة مشاريع التخرج',
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey.shade100,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            textTheme: TextTheme(
              bodyLarge: GoogleFonts.alexandria(),
              bodyMedium: GoogleFonts.alexandria(),
            )),
        home: const Directionality(
            textDirection: TextDirection.rtl, child: LoginPage()),
      ),
    );
  }
}
