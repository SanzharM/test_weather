import 'package:flutter/material.dart';
import 'package:portfoliome/core/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {
  const CustomShimmer({Key? key, this.isLoading = false, required this.child}) : super(key: key);

  final bool isLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 200),
      child: isLoading
          ? Shimmer.fromColors(
              child: child,
              baseColor: AppColors.lightGrey,
              highlightColor: AppColors.secondary,
            )
          : child,
    );
  }
}
