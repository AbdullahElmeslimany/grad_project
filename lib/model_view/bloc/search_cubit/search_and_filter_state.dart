part of 'search_and_filter_cubit.dart';

@immutable
sealed class SearchAndFilterState {}

final class SearchAndFilterInitial extends SearchAndFilterState {}

class FilterState extends SearchAndFilterState {
  final List data;
  FilterState({required this.data});
}
