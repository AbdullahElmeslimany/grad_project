import 'package:flutter/material.dart';

searchCardHomePage(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        height: 38,
        width: MediaQuery.sizeOf(context).width - 110,
        margin: const EdgeInsets.all(9),
        child: TextFormField(
          readOnly: true,
          onTap: () {},
          cursorHeight: 13,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            suffixIcon: const Icon(Icons.search_rounded),
            filled: true,
            fillColor: Colors.grey.shade100,
            border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))),
            labelText: "ابحث باسم المشروع",
          ),
          textAlign: TextAlign.end,
          validator: (value) {
            return null;
          },
        ),
      ),
      const Icon(
        Icons.menu_book_rounded,
        size: 45,
        color: Color.fromARGB(255, 91, 0, 17),
      ),
    ],
  );
}
