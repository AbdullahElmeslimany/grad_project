part of 'get_categoris_data_cubit.dart';

@immutable
sealed class GetCategorisDataState {}

final class GetCategorisDataInitial extends GetCategorisDataState {}

final class SuccessDataState extends GetCategorisDataState {
  final List data;
  SuccessDataState({required this.data});
}

final class WaitingDataState extends GetCategorisDataState {}

final class FialedDataState extends GetCategorisDataState {}
