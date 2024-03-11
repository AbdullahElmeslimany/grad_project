import 'package:flutter/material.dart';

textFromFieldcustom({
  bool rtl = false,
  maxLines = 1,
  TextInputType keyboardType = TextInputType.name,
  length = false,
  double width = 120,
  required TextEditingController controller,
  required String text,
  double hight = 23,
  double padding = 10,
  Color color = const Color.fromARGB(99, 192, 192, 192),
}) {
  return SizedBox(
    width: width,
    child: TextFormField(
      textDirection: rtl == true ? TextDirection.ltr : TextDirection.rtl,
      maxLines: maxLines,
      maxLength: length == true ? 250 : null,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '* يرجي اكمال البيانات';
        }
        return null;
      },
      controller: controller,
      style: const TextStyle(fontSize: 13),
      keyboardType: keyboardType,
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.symmetric(horizontal: padding, vertical: hight),
          filled: false,
          fillColor: Colors.grey,
          border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(5))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: color,
          )),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: color,
            ),
          ),
          labelText: text,
          labelStyle: const TextStyle(fontSize: 13),
          // hintText: text,
          hintStyle: const TextStyle(fontSize: 13)),
      textAlign: rtl == true ? TextAlign.end : TextAlign.start,
    ),
  );
}
