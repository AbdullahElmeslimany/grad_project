import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../../../../model_view/constant/list/list_data.dart';
import '../add_project.dart';

cardDropDown(BuildContext context) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.sizeOf(context).width - 30,
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
            yearProjectController.text = value.toString();
          },
          onSaved: (value) {
            yearProjectController.text = value.toString();
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
      const Gap(20),
      SizedBox(
        width: MediaQuery.sizeOf(context).width - 30,
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
            selectedValue.text = value.toString();
          },
          onSaved: (value) {
            selectedValue.text = value.toString();
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
  );
}
