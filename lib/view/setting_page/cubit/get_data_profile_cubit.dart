import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'get_data_profile_state.dart';

class GetDataProfileCubit extends Cubit<GetDataProfileState> {
  GetDataProfileCubit() : super(GetDataProfileInitial());
  List data = [];
  getData({required String uID}) async {
    QuerySnapshot users =
        await FirebaseFirestore.instance.collection('user').where({
      "Uid",
    }).get();

    data.addAll(users.docs);
  }
}
