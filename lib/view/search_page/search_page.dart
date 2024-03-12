import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/card_search.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "البحث",
            style: GoogleFonts.alexandria(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.blue[900]),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                cardSearch(context),
                const Divider(),
                Expanded(
                  child: ListView.builder(
                    itemCount: 1,
                    itemBuilder: (BuildContext context, int index) {
                      return const Text("");
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
