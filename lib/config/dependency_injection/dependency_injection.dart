import 'dart:async';
import 'package:ainaa/config/dependency_injection/dependency_injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit(initializerName: 'init')
Future<void> configurationDependency(String env) async {
  getIt.init(environment: env);
}

abstract class Env {
  static const dev = 'dev';
  static const prod = 'prod';
}
