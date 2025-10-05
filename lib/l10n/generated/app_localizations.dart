import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @support_us.
  ///
  /// In en, this message translates to:
  /// **'ادعمنا'**
  String get support_us;

  /// No description provided for @additional_android_tools.
  ///
  /// In en, this message translates to:
  /// **'أدوات إضافية لأندرويد'**
  String get additional_android_tools;

  /// No description provided for @choose_protection_level.
  ///
  /// In en, this message translates to:
  /// **'اختار مستوى الحماية'**
  String get choose_protection_level;

  /// No description provided for @protect_your_device_now.
  ///
  /// In en, this message translates to:
  /// **'قم بحماية جهازك الآن'**
  String get protect_your_device_now;

  /// No description provided for @enter_phone_number_desc.
  ///
  /// In en, this message translates to:
  /// **'ادخل رقم الهاتف ثم اضغط على الزر بالأسفل لتفعيل الحماية الفورية لجهازك'**
  String get enter_phone_number_desc;

  /// No description provided for @activate_protection.
  ///
  /// In en, this message translates to:
  /// **'تفعيل الحماية'**
  String get activate_protection;

  /// No description provided for @reactivate_protection.
  ///
  /// In en, this message translates to:
  /// **'اعاده تفعيل الحماية'**
  String get reactivate_protection;

  /// No description provided for @found_problem_ques.
  ///
  /// In en, this message translates to:
  /// **'اكتشفت ثغرة او موقع غير محجوب؟'**
  String get found_problem_ques;

  /// No description provided for @tel_us.
  ///
  /// In en, this message translates to:
  /// **'اخبرنا بها'**
  String get tel_us;

  /// No description provided for @require_valid_phone_number.
  ///
  /// In en, this message translates to:
  /// **'أدخل رقم هاتف صحيح'**
  String get require_valid_phone_number;

  /// No description provided for @activation_done.
  ///
  /// In en, this message translates to:
  /// **'مبارك! تفعيل الحماية'**
  String get activation_done;

  /// No description provided for @want_specific_app_activation.
  ///
  /// In en, this message translates to:
  /// **'هل  تريد تفعيل الحماية على تطبيق معين؟'**
  String get want_specific_app_activation;

  /// No description provided for @please_enter_needed_specific_app_activation_url.
  ///
  /// In en, this message translates to:
  /// **'من فضلك أدخل اسم دومين تريد ايضا تفعيل الحماية عليه'**
  String get please_enter_needed_specific_app_activation_url;

  /// No description provided for @url_example.
  ///
  /// In en, this message translates to:
  /// **'www.example.com'**
  String get url_example;

  /// No description provided for @invalid_url.
  ///
  /// In en, this message translates to:
  /// **'صيغه غير صحيحه'**
  String get invalid_url;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'حفظ'**
  String get save;

  /// No description provided for @confirm_specific_app_activation.
  ///
  /// In en, this message translates to:
  /// **'هل أنت متأكد أنك تريد تفعيل الحماية على:'**
  String get confirm_specific_app_activation;

  /// No description provided for @confirm.
  ///
  /// In en, this message translates to:
  /// **'نعم'**
  String get confirm;

  /// No description provided for @report_problem.
  ///
  /// In en, this message translates to:
  /// **'الإبلاغ عن مشكلة'**
  String get report_problem;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'الاسم'**
  String get name;

  /// No description provided for @please_enter_name.
  ///
  /// In en, this message translates to:
  /// **'برجاء ادخال الاسم'**
  String get please_enter_name;

  /// No description provided for @phone_number.
  ///
  /// In en, this message translates to:
  /// **'رقم الهاتف'**
  String get phone_number;

  /// No description provided for @please_enter_phone_number.
  ///
  /// In en, this message translates to:
  /// **'برجاء ادخال رقم الهاتف'**
  String get please_enter_phone_number;

  /// No description provided for @email_address.
  ///
  /// In en, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email_address;

  /// No description provided for @please_enter_email_address.
  ///
  /// In en, this message translates to:
  /// **'برجاء ادخال البريد الإلكتروني'**
  String get please_enter_email_address;

  /// No description provided for @the_problem.
  ///
  /// In en, this message translates to:
  /// **'المشكلة'**
  String get the_problem;

  /// No description provided for @write_here.
  ///
  /// In en, this message translates to:
  /// **'اكتب هنا...'**
  String get write_here;

  /// No description provided for @send.
  ///
  /// In en, this message translates to:
  /// **'إرسال'**
  String get send;

  /// No description provided for @will_contact_you_soon.
  ///
  /// In en, this message translates to:
  /// **'سنتواصل معك عبر البريد الإلكتروني أو الهاتف في أقرب وقت.'**
  String get will_contact_you_soon;

  /// No description provided for @alert_before_activating.
  ///
  /// In en, this message translates to:
  /// **'تنويه هام قبل تفعيل الحماية'**
  String get alert_before_activating;

  /// No description provided for @read_desc_carefully.
  ///
  /// In en, this message translates to:
  /// **'يرجى قراءة هذا التنويه بعناية وفهمه بالكامل قبل المتابعة في تفعيل حماية عينا سلسبيلا على جهازك.'**
  String get read_desc_carefully;

  /// No description provided for @want_to_activate_protection_desc.
  ///
  /// In en, this message translates to:
  /// **'سيتم تقييد المستخدم عن طريق منع حذف الحماية لضمان فاعلية الخدمة، لذلك، فإن موافقتك على تفعيل الحماية تعتبر موافقة صريحة منك على تفعيل خاصية تقييد الحذف والالتزام بجميع قيود الحماية المترتبة عليها، إذا كنت موافقًا ومستعدًا لتطبيق هذه الإجراءات والقيود بشكل دائم على جهازك، يمكنك المتابعة لتفعيل حماية عينا سلسبيلا.'**
  String get want_to_activate_protection_desc;

  /// No description provided for @want_to_activate_protection.
  ///
  /// In en, this message translates to:
  /// **'هل ترغب في المتابعة وتفعيل الحماية الآن؟'**
  String get want_to_activate_protection;

  /// No description provided for @confirm_activate_protection.
  ///
  /// In en, this message translates to:
  /// **'فعّل الحماية'**
  String get confirm_activate_protection;

  /// No description provided for @want_to_reactivate_protection.
  ///
  /// In en, this message translates to:
  /// **'هل ترغب في إعاده تفعيل الحماية على جهازك؟'**
  String get want_to_reactivate_protection;

  /// No description provided for @confirm_reactivate_protection.
  ///
  /// In en, this message translates to:
  /// **'اعد تفعّبل الحماية'**
  String get confirm_reactivate_protection;

  /// No description provided for @later.
  ///
  /// In en, this message translates to:
  /// **'لاحقًا'**
  String get later;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'تراجع'**
  String get dismiss;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'حسنا'**
  String get ok;

  /// No description provided for @join_us.
  ///
  /// In en, this message translates to:
  /// **'انضمام'**
  String get join_us;

  /// No description provided for @must_update_app.
  ///
  /// In en, this message translates to:
  /// **'تحديث إلزامي'**
  String get must_update_app;

  /// No description provided for @must_update_app_to_continue_usage.
  ///
  /// In en, this message translates to:
  /// **'يجب تحديث التطبيق لمواصلة الاستخدام'**
  String get must_update_app_to_continue_usage;

  /// No description provided for @optional_update_app.
  ///
  /// In en, this message translates to:
  /// **'تحديث جديد متاح'**
  String get optional_update_app;

  /// No description provided for @optional_update_app_msg.
  ///
  /// In en, this message translates to:
  /// **'يمكنك التحديث للحصول علي اخر التحسينات'**
  String get optional_update_app_msg;

  /// No description provided for @update.
  ///
  /// In en, this message translates to:
  /// **'تحديث'**
  String get update;

  /// No description provided for @required_field.
  ///
  /// In en, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get required_field;

  /// No description provided for @name_not_in_range.
  ///
  /// In en, this message translates to:
  /// **'الأسم يجب أن يكون بين ٢ و٢٤ حرف'**
  String get name_not_in_range;

  /// No description provided for @paragraph_not_in_range.
  ///
  /// In en, this message translates to:
  /// **'النص يجب أن يكون بين ٥ و١٠٠ حرف'**
  String get paragraph_not_in_range;

  /// No description provided for @email_invalid.
  ///
  /// In en, this message translates to:
  /// **'البريد الإلكتروني غير صالح'**
  String get email_invalid;

  /// No description provided for @something_went_wrong.
  ///
  /// In en, this message translates to:
  /// **'حدثت شيء ما، حاول مره اخري'**
  String get something_went_wrong;

  /// No description provided for @script_failed.
  ///
  /// In en, this message translates to:
  /// **'حدث خطأ أثناء تشغيل التفعيل.'**
  String get script_failed;

  /// No description provided for @invalid_input.
  ///
  /// In en, this message translates to:
  /// **'عض البيانات مفقودة. تحقق من الحقول وأعد المحاولة.'**
  String get invalid_input;

  /// No description provided for @no_internet_connection.
  ///
  /// In en, this message translates to:
  /// **'حدثت مشكلة في الاتصال. تأكد من اتصالك بالإنترنت.'**
  String get no_internet_connection;

  /// No description provided for @report_problem_sent.
  ///
  /// In en, this message translates to:
  /// **'شكرًا لك! تم إرسال المشكلة وسنقوم بمراجعتها قريبًا.'**
  String get report_problem_sent;

  /// No description provided for @check_high_protection.
  ///
  /// In en, this message translates to:
  /// **'تفعيل الحمايه العالية'**
  String get check_high_protection;

  /// No description provided for @check_youtube_protection.
  ///
  /// In en, this message translates to:
  /// **'تفعيل الوضع الآمن لليوتيوب'**
  String get check_youtube_protection;

  /// No description provided for @check_cant_undo.
  ///
  /// In en, this message translates to:
  /// **'لا يمكن الغاءه فيها بعد'**
  String get check_cant_undo;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
