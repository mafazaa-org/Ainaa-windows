import 'package:ainaa/features/app_meta_data/domain/entities/app_meta_data_entity.dart';
import 'package:flutter/material.dart';

class InactiveAinnaProtectionHeadSkelton extends InheritedWidget {
  final AppMetaData appMetaData;
  const InactiveAinnaProtectionHeadSkelton(
    this.appMetaData, {
    super.key,
    required super.child,
  });

  //check if the widget is depending on InactiveAinnaProtectionHeadSkelton
  static InactiveAinnaProtectionHeadSkelton? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<
          InactiveAinnaProtectionHeadSkelton
        >();
  }

  //return instance if any
  static InactiveAinnaProtectionHeadSkelton? of(BuildContext context) {
    final result = InactiveAinnaProtectionHeadSkelton.maybeOf(context);
    assert(
      result != null,
      'No InactiveAinnaProtectionHeadSkelton found in context',
    );
    return result;
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;
}
