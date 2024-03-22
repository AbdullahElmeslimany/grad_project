import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_categoris_data_state.dart';

class GetCategorisDataCubit extends Cubit<GetCategorisDataState> {
  GetCategorisDataCubit() : super(GetCategorisDataInitial());
  List data = [];
  bool loading = true;
  getData({required String problem}) async {
    print(problem);
    emit(WaitingDataState());

    QuerySnapshot users = await FirebaseFirestore.instance
        .collection('project')
        .where("problem", isEqualTo: problem)
        .get();
    loading = false;
    data.addAll(users.docs);
    // print(data[0]['name']);
    emit(SuccessDataState(data: data));
  }
}
