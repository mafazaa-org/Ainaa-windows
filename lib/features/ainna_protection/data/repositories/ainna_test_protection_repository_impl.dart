import 'package:blocker_windows/features/ainna_protection/domain/repositories/ainna_protection_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: AinnaProtectionRepository)
class AinnaTestProtectionRepositoryImpl implements AinnaProtectionRepository {
  @override
  Future<void> activate(String activationType) async {
    Future.delayed(Duration(seconds: 1));
  }

  @override
  Future<void> deActivate() async {
    Future.delayed(Duration(seconds: 1));
  }
}
