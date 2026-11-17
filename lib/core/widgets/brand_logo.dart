import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_radius.dart';

/// The purple rounded "C" tile.
class BrandLogo extends StatelessWidget {
  const BrandLogo({super.key, this.size = 44});
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: AppRadius.all(size * 0.28),
        boxShadow: const [
          BoxShadow(
              color: AppColors.primaryShadow, blurRadius: 24, spreadRadius: 1)
        ],
      ),
      child: Text('C',
          style: TextStyle(
              color: AppColors.textOnDark,
              fontSize: size * 0.5,
              fontWeight: FontWeight.w800)),
    );
  }
}
