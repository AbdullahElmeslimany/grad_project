import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_data_profile_state.dart';

class GetDataProfileCubit extends Cubit<GetDataProfileState> {
  GetDataProfileCubit() : super(GetDataProfileInitial());
  List data = [];
  bool loading = true;
  getData({required String uID}) async {
    print(uID);
    emit(WaitingProfileState());
    QuerySnapshot users = await FirebaseFirestore.instance
        .collection('user')
        .where("Uid", isEqualTo: uID)
        .get();
    loading = false;
    data.addAll(users.docs);
    print(data[0]["name"]);
    emit(SucessDataProfileState(data: data));
  }
}
