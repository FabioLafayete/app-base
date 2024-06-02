import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class MaintenanceWidget extends BaseWidget {
  MaintenanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      backgroundColor: colors.primary,
      body: Column(
        children: [

        ],
      ),
    );
  }
}
