import 'package:ainaa/core/constants/app_urls.dart';
import 'package:ainaa/core/utils/open_link.dart';
import 'package:ainaa/features/support/domain/repositories/support_repository.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: SupportRepository)
class SupportRepositoryImpl extends SupportRepository {
  @override
  Future<bool> financialSupport() async {
    try {
      await openLink(AppUrls.financialSupportUrl);
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<bool> joinUs() async {
    try {
      await openLink(AppUrls.joinUsUrl);
      return true;
    } catch (e) {
      return false;
    }
  }
}
