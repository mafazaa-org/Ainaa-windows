// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReportProblem {
  final String name;
  final String phoneNumber;
  final String emailAddress;
  final String theProblem;

  const ReportProblem(
    this.name,
    this.phoneNumber,
    this.emailAddress,
    this.theProblem,
  );

  @override
  String toString() {
    return 'ReportProblem(name: $name, phoneNumber: $phoneNumber, emailAddress: $emailAddress, theProblem: $theProblem)';
  }
}
