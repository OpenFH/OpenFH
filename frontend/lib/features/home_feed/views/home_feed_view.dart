import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:frontend/theme/text_style.dart';

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'hello'.tr(args: ['Paul']),
            style: CustomTextTheme.of(context).headline1.bold,
          ),
        ),
      ),
    );
  }
}
