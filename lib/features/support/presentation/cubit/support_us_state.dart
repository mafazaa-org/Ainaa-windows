part of 'support_us_cubit.dart';

sealed class SupportUsState extends Equatable {
  const SupportUsState();

  @override
  List<Object> get props => [];
}

final class SupportUsInitial extends SupportUsState {}

final class SupportUsFailed extends SupportUsState {
  final String code = 'something went wrong';

  @override
  List<Object> get props => [code];
}
