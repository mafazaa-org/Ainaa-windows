import 'package:blocker_windows/core/app_meta_data/data/models/models.dart';

class MockMetaData {
  static const mockMetaData = AppMetaDataModel(mockAinnaProtectionLevel);

  static const mockAinnaProtectionLevel = [
    AinnaProtectionLevelModel(
      activationType: 'الحماية المنخفضة',
      name: 'الحماية المنخفضة',
      description:
          'تحجب لك فقط الأساسيات التي قد تُزعجك أو تُعدّ غير مناسبة، مع إبقاء معظم المحتوى متاحاً لتصفحٍ أكثر حرية مثل:',
      tags: [
        'المواقع العربية الغير لائقة',
        'الأنمي غير المناسب',
        'المانجا',
        'الإعلانات',
        'القمار',
        'الإباحية',
      ],
      isAvailable: true,
    ),
    AinnaProtectionLevelModel(
      activationType: 'الحماية العالية',
      name: 'الحماية العالية',
      description:
          'توفر لك حماية شاملة من معظم أنواع المحتوى غير المرغوب فيه، مما يضمن تجربة تصفح أكثر أمانًا وراحة مثل:',
      tags: ['التيك توك', 'الأفلام', 'الموسيقى', 'كل ما في الحماية المنخفضة'],
      isAvailable: true,
    ),
  ];
}
