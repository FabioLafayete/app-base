import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MaintenanceWidget extends BaseWidget {
  MaintenanceWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      showAppBar: false,
      backgroundColor: colors.primary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'assets/images/icon/svg/maintenance.svg',
          ),

          text(
            'Estamos em manutenção,\nvoltamos ja ja',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            textAlign: TextAlign.center
          ),
          SizedBox(height: height * 0.03,),
          SpinKitThreeBounce(
            color: colors.text2,
            size: 18,
          ),
          SizedBox(height: height * 0.03,),
          text(
            'Pedimos desculpe pelo incomodo.',
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 18,
          ),
        ],
      ),
    );
  }
}
