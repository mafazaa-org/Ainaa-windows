part of './support_large_page.dart';

class _BuildCardActions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isTablet = context.isTablet;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isTablet ? 42 : 80,
        vertical: isTablet ? 48 : 98.r,
      ),
      child: IntrinsicHeight(
        child: Row(
          spacing: AppSpacing.xl,
          children: [FinancialSupportActionCard(), JoinUsActionCard()],
        ),
      ),
    );
  }
}
