import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BasePage extends BaseWidget {
  BasePage({
    Key? key,
    required this.body,
    this.title,
    this.appBar,
    this.showAppBar = true,
    this.extendBody = true,
    this.extendBodyBehindAppBar = false,
    this.automaticallyImplyLeading = true,
    this.bottomNavigationBar,
    this.floatingActionButton,
    this.backgroundColor,
    this.paddingPage,
    this.actions,
    this.elevation
  }) : super(key: key);

  final Widget body;
  final String? title;
  final bool showAppBar;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  final PreferredSizeWidget? appBar;
  final bool automaticallyImplyLeading;
  final Widget? bottomNavigationBar;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final double? paddingPage;
  final List<Widget>? actions;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.focusScope?.unfocus(),
      child: Scaffold(
        appBar: showAppBar ? (appBar ?? _appBar(context)) : null,
        bottomNavigationBar: bottomNavigationBar,
        extendBody: extendBody,
        extendBodyBehindAppBar: extendBodyBehindAppBar,
        backgroundColor: backgroundColor ?? colors.background,
        floatingActionButton: floatingActionButton,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: paddingPage ?? 16.0),
          child: body,
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context){
    return AppBar(
      title: title == null ? Container() :
      text(title!, color: colors.text2, fontWeight: FontWeight.w600),
      backgroundColor: colors.primary,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      actions: actions,
    );
  }

}
