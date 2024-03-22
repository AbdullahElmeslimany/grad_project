import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'search_and_filter_state.dart';

class SearchAndFilterCubit extends Cubit<SearchAndFilterState> {
  SearchAndFilterCubit() : super(SearchAndFilterInitial());
  List dataAll = [];
  getAllDataProject() async {
    QuerySnapshot getalldata =
        await FirebaseFirestore.instance.collection("project").get();
    dataAll.addAll(getalldata.docs);
  }

  filterdata(String value) {
    List filterdata = [];

    for (var element in dataAll) {
      if (element['name'].toString().contains(value)) {
        filterdata.add(element);
        print(element['name']);
        emit(FilterState(data: filterdata));
      }
    }
    ;
  }
}
