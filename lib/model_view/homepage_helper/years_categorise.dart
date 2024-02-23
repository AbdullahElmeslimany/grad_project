import 'package:flutter/material.dart';

yearsCategorise() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 15),
    margin: const EdgeInsets.only(top: 15),
    height: 150,
    child: GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 1.5,
        crossAxisCount: 3,
      ),
      itemCount: 6,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Center(child: Text("${2018 + index}")),
        );
      },
    ),
  );
}
