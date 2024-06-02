import 'package:app/route/my_router.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    this.elevation,
    this.bottomSheet,
    this.onRefresh,
  }) : super(key: key);

  final Widget body;
  final Widget? bottomSheet;
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
  final VoidCallback? onRefresh;

  @override
  Widget build(BuildContext context) {

    if(onRefresh != null) {
      return RefreshIndicator.adaptive(
        onRefresh: () async {
          HapticFeedback.lightImpact();
          onRefresh!();
        },
        displacement: 50,
        color: colors.primary,
        child: child(context),
      );
    }

    return child(context);
  }

  Widget child(BuildContext context){
    return GestureDetector(
      onTap: () =>  FocusScope.of(context).unfocus(),
      behavior: HitTestBehavior.translucent,
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
        bottomSheet: bottomSheet,
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context){
    return AppBar(
      title: title == null ? Container() :
      text(title!, color: colors.text2, fontWeight: FontWeight.w600),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new_rounded),
        color: colors.text2,
        onPressed: () => MyRouter().pop(),
      ),
      backgroundColor: colors.primary,
      automaticallyImplyLeading: automaticallyImplyLeading,
      elevation: elevation,
      actions: actions,
    );
  }

}
