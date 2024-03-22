import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'helper/card_search.dart';
import '../../model_view/bloc/search_cubit/search_and_filter_cubit.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = BlocProvider.of<SearchAndFilterCubit>(context);
    cubit.getAllDataProject();
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
                  child:
                      BlocConsumer<SearchAndFilterCubit, SearchAndFilterState>(
                    listener: (context, state) {
                      // TODO: implement listener
                    },
                    builder: (context, state) {
                      if (state is FilterState) {
                        return ListView.builder(
                          itemCount: state.data.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Text(state.data[index]["name"]);
                          },
                        );
                      }
                      return Container();
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
