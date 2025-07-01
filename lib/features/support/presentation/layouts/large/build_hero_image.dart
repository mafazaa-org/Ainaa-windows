part of './support_large_page.dart';

class _BuildHeroImage extends StatelessWidget {
  final String headline;
  const _BuildHeroImage(this.headline);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        // fit: StackFit.expand,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImagesUrl.supportBackground),
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.minHorizontal),
            child: FittedBox(
              child: Text(
                headline,
                textAlign: TextAlign.center,
                style: context.textStyles.headingHuge,
              ),
            ),
          ),
          Positioned.directional(
            // if another language added may need to change it to
            // textDirection: Directionality.of(context),
            textDirection: TextDirection.rtl,
            top: AppSpacing.md,
            end: AppSpacing.xxl,
            start: AppSpacing.sm,
            height: 43.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [BackButton(), AppLogo(useAlternative: true)],
            ),
          ),
        ],
      ),
    );
  }
}
