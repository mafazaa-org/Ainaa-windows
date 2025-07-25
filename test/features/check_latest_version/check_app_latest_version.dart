import 'package:blocker_windows/config/exceptions/fetch_exceptions.dart';
import 'package:blocker_windows/features/version_check/data/models/app_needs_update_model.dart';
import 'package:blocker_windows/features/version_check/data/models/app_required_version_model.dart';
import 'package:blocker_windows/features/version_check/domain/entities/app_needs_update_entity.dart';
import 'package:blocker_windows/features/version_check/domain/entities/app_required_version_entity.dart';
import 'package:blocker_windows/features/version_check/domain/repositories/app_required_version_repository.dart';
import 'package:blocker_windows/core/resources/data_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:http/http.dart' as http;

import 'app_required_version_repository_test_impl.dart';

// Mock HTTP client
class MockHttpClient extends Mock implements http.Client {}

class FakeUri extends Fake implements Uri {}

void main() {
  late AppRequiredVersionRepository repository;
  late MockHttpClient mockHttpClient;
  setUpAll(() {
    registerFallbackValue(FakeUri());
  });
  setUp(() {
    mockHttpClient = MockHttpClient();
    repository = AppRequiredVersionRepositoryTestImpl(client: mockHttpClient);
  });

  group('AppRequiredVersionRepositoryTestImpl', () {
    test(
      'returns AppVersionMatched when version is "--" (no update needed)',
      () async {
        // Mock response: No update needed
        when(
          () => mockHttpClient.get(any<Uri>()),
        ).thenAnswer((_) async => http.Response('{"version": "--"}', 200));

        final result = await repository.checkLatestVersion();

        expect(
          result,
          isA<AppRequiredVersion>().having(
            (s) => s.isSameVersion,
            'isSameVersion',
            isTrue,
          ),
        );
      },
    );

    test(
      'returns AppVersionUnmatched (optional app update) when updateUrl exists and isNecessaryUpdate=false',
      () async {
        // Mock response: Optional app update
        when(() => mockHttpClient.get(any<Uri>())).thenAnswer(
          (_) async => http.Response(
            '{"version": "2.0.0", "updateUrl": "https://example.com", "isNecessaryUpdate": false}',
            200,
          ),
        );

        final result = await repository.checkLatestVersion();

        expect(
          result,
          isA<AppRequiredVersion>().having(
            (s) => s.appNeedsUpdate,
            'appNeedsUpdate',
            isA<AppNeedsVersionUpdate>(),
          ),
        );
      },
    );

    test(
      'returns AppVersionUnmatched (forced app update) when updateUrl exists and isNecessaryUpdate=true',
      () async {
        // Mock response: Forced app update
        when(() => mockHttpClient.get(any<Uri>())).thenAnswer(
          (_) async => http.Response(
            '{"version": "2.0.0", "updateUrl": "https://example.com", "isNecessaryUpdate": true, "reasonMessage": {"en": "Critical bug fix"}}',
            200,
          ),
        );

        final result = await repository.checkLatestVersion();

        expect(
          result,
          isA<AppRequiredVersion>().having(
            (s) => s.appNeedsUpdate?.isNecessaryUpdate,
            'isNecessaryUpdate',
            isTrue,
          ),
        );
      },
    );

    test(
      'returns AppAinnaBatchUnmatched (optional batch update) when batch URLs exist and isNecessaryUpdate=false',
      () async {
        // Mock response: Optional batch update
        when(() => mockHttpClient.get(any<Uri>())).thenAnswer(
          (_) async => http.Response(
            '{"version": "2.0.0", "protectBatchUrl": "https://example.com/batch", "isNecessaryUpdate": false}',
            200,
          ),
        );

        final result = await repository.checkLatestVersion();

        expect(
          result,
          isA<AppRequiredVersion>().having(
            (s) => s.appNeedsUpdate,
            'appNeedsUpdate',
            isA<AinnaNeedsUpdate>(),
          ),
        );
      },
    );

    test(
      'returns AppAinnaBatchUnmatched (forced batch update) when batch URLs exist and isNecessaryUpdate=true',
      () async {
        // Mock response: Forced batch update
        when(() => mockHttpClient.get(any<Uri>())).thenAnswer(
          (_) async => http.Response(
            '{"version": "2.0.0", "youtubeTxtUrl": "https://example.com/youtube.txt", "isNecessaryUpdate": true, "reasonMessage": {"en": "Security update"}}',
            200,
          ),
        );

        final result = await repository.checkLatestVersion();

        expect(
          result,
          isA<AppRequiredVersion>().having(
            (s) => s.appNeedsUpdate?.isNecessaryUpdate,
            'isNecessaryUpdate',
            isTrue,
          ),
        );
      },
    );

    test('returns Failure when HTTP request fails', () async {
      // Mock HTTP error
      when(
        () => mockHttpClient.get(any<Uri>()),
      ).thenThrow(http.ClientException('Connection failed'));

      final result = await repository.checkLatestVersion();

      expect(result, isA<Failure>());
    });

    test('returns AppVersionMatched when JSON is malformed', () async {
      // Mock malformed JSON
      when(
        () => mockHttpClient.get(any<Uri>()),
      ).thenAnswer((_) async => http.Response('invalid json', 200));

      final result = await repository.checkLatestVersion();

      expect(
        result,
        isA<Failure>().having((f) => f.error, 'error', isA<FetchException>()),
      );
    });
  });

  group('AppRequiredVersionModel', () {
    test('parses "no update needed" JSON correctly', () {
      const json = {'version': '--'};
      final model = AppRequiredVersionModel.fromJson(json);

      expect(model.isSameVersion, isTrue);
      expect(model.appNeedsUpdate, isNull);
    });

    test('parses "optional app update" JSON correctly', () {
      final json = {
        'version': '2.0.0',
        'updateUrl': 'https://example.com',
        'isNecessaryUpdate': false,
      };
      final model = AppRequiredVersionModel.fromJson(json);

      expect(model.isSameVersion, isFalse);
      expect(model.appNeedsUpdate, isA<AppNeedsVersionUpdateModel>());
    });

    test('parses "forced batch update" JSON correctly', () {
      final json = {
        'version': '2.0.0',
        'protectBatchUrl': 'https://example.com/batch',
        'isNecessaryUpdate': true,
        'reasonMessage': {'en': 'Security patch'},
      };
      final model = AppRequiredVersionModel.fromJson(json);

      expect(model.isSameVersion, isFalse);
      expect(model.appNeedsUpdate, isA<AinnaNeedsUpdateModel>());
    });
  });
}
