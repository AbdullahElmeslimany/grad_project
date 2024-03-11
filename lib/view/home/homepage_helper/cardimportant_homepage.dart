import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

cardimportantHomePage() {
  return Container(
    margin: const EdgeInsets.all(8),
    padding: const EdgeInsets.all(12),
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(15)),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "معلومات مهمة",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Gap(8),
        Text(
          "*مشاريع التخرج يحتاج الي عمل جماعي",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Gap(8),
        Text(
          "*تتم مشاريع التخرج تتم تحت اشراف اساتذة جامعية متخصصة",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
      ],
    ),
  );
}
