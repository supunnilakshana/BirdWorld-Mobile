import 'package:flutter/material.dart';

import '../../theme/color.dart';

class PrimaryLoading extends StatelessWidget {
  const PrimaryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      color: AppColors.appPrimary,
    );
  }
}
