// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ainaa_protection_cubit.dart';

@immutable
sealed class AinaaProtectionState extends Equatable {
  final bool isLoading;
  final LocalizedString? errorMessage;
  const AinaaProtectionState({this.isLoading = false, this.errorMessage});
  @override
  List<Object?> get props => [isLoading, errorMessage];
}

class AinaaProtectionInactive extends AinaaProtectionState {
  const AinaaProtectionInactive({super.isLoading = false, super.errorMessage})
    : assert(!(isLoading && errorMessage != null));

  @override
  List<Object?> get props => [super.isLoading, super.errorMessage];
}

// final class AinnaProtectionLoading extends AinaaProtectionState {}

class AinaaProtectionActive extends AinaaProtectionState {
  final DateTime activatedAt;
  final String activationType;
  final String activationBatchPath;
  const AinaaProtectionActive({
    required this.activatedAt,
    required this.activationType,
    required this.activationBatchPath,
    super.isLoading = false,
    super.errorMessage,
  });

  @override
  List<Object?> get props => [
    super.isLoading,
    super.errorMessage,
    activatedAt,
    activationType,
    activationBatchPath,
  ];

  AinaaProtectionActive copyWith({
    bool? isLoading,
    LocalizedString? errorMessage,
    DateTime? activatedAt,
    String? activationType,
    String? activationBatchPath,
  }) {
    return AinaaProtectionActive(
      isLoading: isLoading ?? false,
      errorMessage: errorMessage,
      activatedAt: activatedAt ?? this.activatedAt,
      activationType: activationType ?? this.activationType,
      activationBatchPath: activationBatchPath ?? this.activationBatchPath,
    );
  }
}
