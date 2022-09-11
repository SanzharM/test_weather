import 'package:flutter/material.dart';
import 'package:portfoliome/core/constants/constants.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.title,
    required this.child,
    this.leading,
  }) : super(key: key);

  final String title;
  final Widget? leading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: AppConstraints.borderRadius,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (leading != null) ...[
                leading!,
                const SizedBox(width: AppConstraints.padding / 2),
              ],
              Expanded(
                child: Text(
                  title,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.labelMedium?.apply(color: AppColors.white.withOpacity(0.9)),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4.0),
          Expanded(child: child),
        ],
      ),
    );
  }
}
