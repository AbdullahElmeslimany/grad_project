import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_categoris_data_state.dart';

class GetCategorisDataCubit extends Cubit<GetCategorisDataState> {
  GetCategorisDataCubit() : super(GetCategorisDataInitial());
  List data = [];
  bool loading = true;
  getData({required problem}) async {
    emit(WaitingDataState());
    if (problem is String) {
      QuerySnapshot users = await FirebaseFirestore.instance
          .collection('project')
          .where("problem", isEqualTo: problem)
          .get();
      loading = false;
      data.addAll(users.docs);
      emit(SuccessDataState(data: data));
    } else if (problem is int) {
      QuerySnapshot users = await FirebaseFirestore.instance
          .collection('project')
          .where("year", isEqualTo: problem.toString())
          .get();
      loading = false;
      data.addAll(users.docs);
      emit(SuccessDataState(data: data));
    }
  }
}
