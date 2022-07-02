import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeFeedView extends StatelessWidget {
  const HomeFeedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text(
            'hello'.tr(args: ['Paul']),
          ),
        ),
      ),
    );
  }
}
