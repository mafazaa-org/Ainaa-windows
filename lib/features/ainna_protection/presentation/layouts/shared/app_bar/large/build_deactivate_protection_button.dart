import 'package:ainaa/app_environments.dart' show AppEnvironment;
import 'package:ainaa/config/dependency_injection/dependency_injection.dart'
    show Env;
import 'package:ainaa/config/extensions/context_extension.dart';
import 'package:ainaa/features/ainna_protection/presentation/ainaa_protection_cubit/ainaa_protection_cubit.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

@visibleForTesting
class BuildDeactivateProtectionButton extends StatelessWidget {
  const BuildDeactivateProtectionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    return GestureDetector(
      // for debugging purposes
      onTap: () => context.read<AinaaProtectionCubit>().resetState(),
      child: Container(
        alignment: AlignmentDirectional.centerEnd,
        width: screenWidth * .25,
        child:
            kDebugMode && AppEnvironment.appEnv == Env.dev
                ? Text('Test Reset', style: context.textStyles.navLabel)
                : SizedBox(),
      ),
    );
  }
}
