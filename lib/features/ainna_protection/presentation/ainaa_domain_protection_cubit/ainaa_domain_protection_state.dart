// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'ainaa_domain_protection_cubit.dart';

class AinaaDomainProtectionState extends Equatable {
  final bool isProcessing;
  final LocalizedString? errorMessage;
  final List<String> protectedDomains;
  const AinaaDomainProtectionState({
    this.protectedDomains = const <String>[],
    this.isProcessing = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [protectedDomains, isProcessing, errorMessage];

  AinaaDomainProtectionState copyWith({
    bool? isProcessing,
    LocalizedString? errorMessage,
    String? protectedDomain,
    List<String>? protectedDomains,
  }) {
    if (protectedDomain != null) {
      _addProtectedDomain(protectedDomain);
    }
    return AinaaDomainProtectionState(
      isProcessing: isProcessing ?? false,
      errorMessage: errorMessage,
      protectedDomains: protectedDomains ?? this.protectedDomains,
    );
  }

  void _addProtectedDomain(String url) {
    protectedDomains.add(url);
  }
}
