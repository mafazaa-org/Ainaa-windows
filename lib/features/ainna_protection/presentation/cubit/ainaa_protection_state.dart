part of 'ainaa_protection_cubit.dart';

@immutable
sealed class AinaaProtectionState extends Equatable {
  final bool isLoading;
  final LocalizedString? errorMessage;
  const AinaaProtectionState({this.isLoading = false, this.errorMessage});
  @override
  List<Object?> get props => [isLoading, errorMessage];
}

final class AinaaProtectionInactive extends AinaaProtectionState {
  const AinaaProtectionInactive({super.isLoading = false, super.errorMessage})
    : assert(!(isLoading && errorMessage != null));

  @override
  List<Object?> get props => [super.isLoading, super.errorMessage];
}

// final class AinnaProtectionLoading extends AinaaProtectionState {}

final class AinaaProtectionActive extends AinaaProtectionState {
  final DateTime activatedAt;
  final String activationType;
  const AinaaProtectionActive(
    this.activatedAt,
    this.activationType, {
    super.isLoading = false,
    super.errorMessage,
  });

  @override
  List<Object?> get props => [
    super.isLoading,
    super.errorMessage,
    activatedAt,
    activationType,
  ];
}
