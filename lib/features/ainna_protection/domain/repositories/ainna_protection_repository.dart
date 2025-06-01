abstract class AinnaProtectionRepository {
  Future<void> activate(String activationType);
  Future<void> deActivate();
}
