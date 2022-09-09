import 'package:flutter/widgets.dart';
import 'package:portfoliome/core/constants/constants.dart';

class TagIcon extends StatelessWidget {
  const TagIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.grey,
        borderRadius: AppConstraints.borderRadius50,
      ),
      height: 4.0,
      width: MediaQuery.of(context).size.width * 0.2,
    );
  }
}
