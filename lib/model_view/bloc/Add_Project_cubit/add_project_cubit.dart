import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';

part 'add_project_state.dart';

class AddProjectCubit extends Cubit<AddProjectState> {
  AddProjectCubit() : super(AddProjectInitial());
  CollectionReference project =
      FirebaseFirestore.instance.collection('project');
  addProject(
      {required String name,
      required String year,
      required String problem,
      required String idea,
      required String grad,
      required String dr,
      required List acctant}) async {
    await project.add({
      "dr": dr,
      "acctant": acctant,
      "grad": grad,
      "idea": idea,
      "name": name,
      "problem": problem,
      "year": year,
    }).then((value) {
      Get.snackbar("تمت الاضافة مشروع جديد بنجاح", "");
    });
    emit(SucessAddState());
  }

  editProject(
      {required id,
      required String name,
      required String year,
      required String idea,
      required String dr,
      required List acctant}) async {
    await project.doc(id).update({
      "dr": dr,
      "acctant": acctant,
      "idea": idea,
      "name": name,
      "year": year,
    }).then((value) {
      Get.back();
      Get.snackbar("تم التعديل بنجاح", "");
    });
  }
}
