import 'dart:async';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:line_icons/line_icons.dart';

import '../../../service/storage/storage_service.dart';
import '../../../shared/constants/storage_constants.dart';
import '../../../shared/widgets/app_theme_widget.dart';
import '../../../util/colors.dart';

class WelcomeWidget extends StatefulWidget {
  const WelcomeWidget({Key? key, required this.signInOnPress})
      : super(key: key);

  final Function(bool signUp) signInOnPress;

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {
  final List<String> _image01 = [
    'assets/images/welcome/0.jpeg',
    'assets/images/welcome/7.png',
    'assets/images/welcome/17.jpeg',
  ];
  final List<String> _image02 = [
    'assets/images/welcome/8.jpg',
    'assets/images/welcome/13.png',
    'assets/images/welcome/5.jpeg',
  ];
  final List<String> _image03 = [
    'assets/images/welcome/6.png',
    'assets/images/welcome/6.png',
    'assets/images/welcome/18.png',
  ];
  final List<String> _image04 = [
    'assets/images/welcome/20.png',
    'assets/images/welcome/9.jpeg',
    'assets/images/welcome/1.jpeg',
  ];

  late final double width = MediaQuery.of(context).size.width;
  late final double height = MediaQuery.of(context).size.height;
  final text = AppTheme().text;
  final AppColors colors = AppColors();

  bool topGrid = false;

  bool showImages = false;

  final secure = Modular.get<SecureStorageService>();

  @override
  initState() {
    super.initState();
    Timer(Duration.zero, () {
      setState(() {
        topGrid = true;
        showImages = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      paddingPage: 0,
      showAppBar: false,
      body: Stack(
        children: [
          _background(),
          AnimatedPositioned(
            duration: const Duration(seconds: 5),
            curve: Curves.easeOutBack,
            left: !topGrid ? -width * 0.13 : -width * 0.10,
            top: !topGrid ? -height * 0.3 : -height * 0.23,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _gridview(_image01),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: _gridview(_image02),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.03),
                  child: _gridview(_image03, showLogo: true),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.18),
                  child: _gridview(_image04),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.43,
            child: Container(
              width: width,
              height: height * 0.56,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: width * 0.75,
                      child: text('Bem-vinda ao iBetter',
                          fontSize: height * 0.047,
                          fontWeight: FontWeight.w600,
                          color: colors.background)),
                  SizedBox(height: height * 0.04),
                  text(
                    'Explore nossa motivação e encontre sua força',
                    color: colors.background,
                    fontWeight: FontWeight.w400,
                    fontSize: height * 0.028,
                  ),
                  const Spacer(),
                  MyButton(
                    title: 'ENTRAR',
                    sizeTitle: height * 0.022,
                    colorTitle: colors.primary,
                    // colorTitle: Color(0xFF00bcd4),
                    colorButton: colors.text2,
                    onPress: () => widget.signInOnPress(false),
                  ),
                  const SizedBox(height: 15),
                  MyButton(
                    title: 'Não tem cadastro? Adquira aqui',
                    sizeTitle: height * 0.018,
                    colorTitle: Colors.white,
                    cleanButton: true,
                    onPress: () => widget.signInOnPress(true),
                  ),
                  FutureBuilder<String?>(
                    future: secure.get(StorageConstants.deepLink),
                    initialData: null,
                    builder: (_, snap) {
                      if (snap.hasData) {
                        return GestureDetector(
                            onTap: () {
                              secure.delete(StorageConstants.deepLink);
                            },
                            child: text(snap.data!, color: Colors.white));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  SizedBox(height: height * 0.05),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _gridview(List<String> images, {bool showLogo = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: List.generate(images.length, (index) {
          bool showLogo0 = index == 1 && showLogo;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            width: width * 0.28,
            height: height * 0.19,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 1,
                    color: showLogo0
                        ? Colors.transparent
                        : colors.background.withOpacity(0.0))),
            child: showLogo0
                ? Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: height * 0.02),
                      child: Icon(
                        LineIcons.heartAlt,
                        size: height * 0.07,
                        color: colors.background,
                      ),
                    ),
                  )
                : AnimatedOpacity(
                    duration: const Duration(milliseconds: 900),
                    opacity: showImages ? 1.0 : 0.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(13),
                      child: Image.asset(
                        images[index],
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
          );
        }),
      ),
    );
  }

  Widget _background() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            tileMode: TileMode.repeated,
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              colors.secondary,
              colors.primary,
              colors.primary,

              // Color(0xFF67edff),
              // Color(0xFF80deea),
              // Color(0xFF00bcd4),

              // Color(0xFF00bcd4),
              // Color(0xFF00bcd4),
              // Color(0xFF3bbdbf),


              // Color(0xFF00e2d1),
              // Color(0xFF00e2d1),
              // Color(0xFF30d5c9),
            ]),
      ),
    );
  }
}
