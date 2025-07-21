import 'package:blocker_windows/core/app_init_data/data/models/models.dart';
import 'package:blocker_windows/features/ainna_protection/enums/ainna_activation_type.dart';

class MockMetaData {
  static const mockMetaData = AppMetaDataModel(mockAinnaProtectionLevel);

  static const mockAinnaProtectionLevel = [
    AinnaProtectionLevelModel(
      activationType: AinnaActivationType.low,
      optionBatchPath: 'batch\\assets\\batch\\protect.bat',
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
      activationType: AinnaActivationType.high,
      optionBatchPath: 'batch\\assets\\batch\\protect.bat',
      name: 'الحماية العالية',
      description:
          'توفر لك حماية شاملة من معظم أنواع المحتوى غير المرغوب فيه، مما يضمن تجربة تصفح أكثر أمانًا وراحة مثل:',
      tags: ['التيك توك', 'الأفلام', 'الموسيقى', 'كل ما في الحماية المنخفضة'],
      isAvailable: true,
    ),
  ];
}
