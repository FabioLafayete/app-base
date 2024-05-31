import 'package:app/modules/navigator/controller/nav_controller.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CustomBottomSheet extends BaseWidget<NavController> {

  CustomBottomSheet({
    Key? key,
    required this.child,
    this.hasHeight = true
  }) : super(key: key);

  final Widget child;
  final bool hasHeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 5,
                width: width(context) * 0.2,
                margin: const EdgeInsets.only(bottom: 10),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors().background.withOpacity(0.8)
                ),
              ),
              Stack(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    // height: !hasHeight ? null : (height * controller.heightBottomSheet),
                    width: width(context),
                    padding: const EdgeInsets.all(16).copyWith(
                        top: 30
                    ),
                    decoration: BoxDecoration(
                        color: AppColors().background,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(width(context) * 0.08),
                          topRight: Radius.circular(width(context) * 0.08),
                        )
                    ),
                    child: child,
                  ),
                  Positioned(
                    top: height(context) * 0.02,
                    right: width(context) * 0.04,
                    child: IconButton(
                      icon: const Icon(Icons.close),
                      color: AppColors().text,
                      iconSize: 25,
                      onPressed: Modular.to.pop,
                    ),
                  )
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}

