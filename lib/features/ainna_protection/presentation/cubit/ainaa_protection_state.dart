part of 'ainaa_protection_cubit.dart';

@immutable
sealed class AinaaProtectionState extends Equatable {
  @override
  List<Object?> get props => [];
}

final class AinaaProtectionInactive extends AinaaProtectionState {
  final bool isLoading;
  final LocalizedString? errorMessage;
  AinaaProtectionInactive({this.isLoading = false, this.errorMessage})
    : assert(!(isLoading && errorMessage != null));

  @override
  List<Object?> get props => [isLoading, errorMessage];
}

// final class AinnaProtectionLoading extends AinaaProtectionState {}

final class AinaaProtectionActive extends AinaaProtectionState {
  final DateTime activatedAt;
  final String activationType;
  AinaaProtectionActive(this.activatedAt, this.activationType);

  @override
  List<Object?> get props => [activatedAt, activationType];
}
