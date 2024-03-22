import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../model_view/constant/list/list_data.dart';
import '../../../model_view/textfromfieldcustom.dart';
import '../../../model_view/bloc/search_cubit/search_and_filter_cubit.dart';

cardSearch(BuildContext context) {
  final cubit = BlocProvider.of<SearchAndFilterCubit>(context);

  TextEditingController nameValueSearch = TextEditingController();

  String? selectedValue;
  String? selected2Value;
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
    decoration: BoxDecoration(
        color: const Color.fromARGB(121, 215, 215, 215),
        borderRadius: BorderRadius.circular(10)),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2.3,
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                hint: const Text(
                  "اختر السنة",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                items: yearsItems
                    .map((item) => DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'اختر من الحقل';
                  }
                  return null;
                },
                onChanged: (value) {
                  selectedValue = value.toString();
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                  ),
                  iconSize: 28,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 2.3,
              child: DropdownButtonFormField2<String>(
                isExpanded: true,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                hint: const Text(
                  "اختر القسم",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                items: categoryList
                    .map((item) => DropdownMenuItem<String>(
                          alignment: Alignment.center,
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return 'اختر من الحقل';
                  }
                  return null;
                },
                onChanged: (value) {
                  selected2Value = value.toString();
                },
                onSaved: (value) {
                  selected2Value = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                  ),
                  iconSize: 28,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  height: 60,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ],
        ),
        const Gap(15),
        textFromFieldcustom(
            backgroundAnable: true,
            color: Colors.black,
            hight: 14,
            width: MediaQuery.sizeOf(context).width - 20,
            controller: nameValueSearch,
            text: "البحث"),
        const Gap(13),
        Container(
          height: 45,
          width: MediaQuery.sizeOf(context).width - 130,
          decoration: BoxDecoration(
              color: Colors.blue[800], borderRadius: BorderRadius.circular(13)),
          child: MaterialButton(
            onPressed: () {
              cubit.filterdata(nameValueSearch.text);
            },
            child: Text(
              "بحث",
              style: GoogleFonts.alexandria(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
          ),
        )
      ],
    ),
  );
}
