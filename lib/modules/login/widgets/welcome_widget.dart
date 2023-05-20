import 'dart:async';

import 'package:app/components/base_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/app_theme_widget.dart';
import '../../../components/custom_button.dart';
import '../../../util/colors.dart';

class WelcomeWidget extends StatefulWidget {

  const WelcomeWidget({
    Key? key,
    required this.signInOnPress
  }) : super(key: key);

  final Function() signInOnPress;

  @override
  State<WelcomeWidget> createState() => _WelcomeWidgetState();
}

class _WelcomeWidgetState extends State<WelcomeWidget> {

  final List<String> _images01 = [
    'https://images.pexels.com/photos/1128678/pexels-photo-1128678.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    // 'https://images.pexels.com/photos/4051252/pexels-photo-4051252.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/66346/pexels-photo-66346.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/1153369/pexels-photo-1153369.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  ];
  final List<String> _images02 = [
    'https://images.pexels.com/photos/992819/pexels-photo-992819.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    // 'https://images.pexels.com/photos/1310777/pexels-photo-1310777.jpeg?auto=compress&cs=tinysrgb&w=800',
    // 'https://images.pexels.com/photos/8852027/pexels-photo-8852027.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/3297882/pexels-photo-3297882.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/416809/pexels-photo-416809.jpeg?auto=compress&cs=tinysrgb&w=1600'
  ];
  final List<String> _images03 = [
    'https://images.pexels.com/photos/66346/pexels-photo-66346.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/4057738/pexels-photo-4057738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/3059981/pexels-photo-3059981.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  ];
  final List<String> _images04 = [
    'https://images.pexels.com/photos/4057738/pexels-photo-4057738.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    // 'https://images.pexels.com/photos/5946045/pexels-photo-5946045.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
    'https://images.pexels.com/photos/4051252/pexels-photo-4051252.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
    'https://images.pexels.com/photos/4944978/pexels-photo-4944978.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2'
  ];

  final double width = Get.width;
  final double height = Get.height;
  final text = AppTheme().text;
  final AppColors colors = AppColors();

  bool topGrid = false;

  @override
  initState(){
    super.initState();
    Timer(const Duration(milliseconds: 100), (){
      setState((){
        topGrid = true;
      });
    });

  }

  @override
  Widget build(BuildContext context) {

    return BasePage(
      padding: 0,
      showAppBar: false,
      body: Stack(
        children: [
          _background(),
          AnimatedPositioned(
            duration: const Duration(seconds: 3),
            curve: Curves.ease,
            left: - width * 0.1,
            top: !topGrid ? - height * 0.25 : - height * 0.2,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _gridview(_images01),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.08),
                  child: _gridview(_images02),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.03),
                  child: _gridview(_images03, showLogo: true),
                ),
                Padding(
                  padding: EdgeInsets.only(top: height * 0.18),
                  child: _gridview(_images04),
                ),
              ],
            ),
          ),
          Positioned(
            top: height * 0.48,
            child: Container(
              width: width,
              height: height * 0.52,
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: width * 0.8,
                      child: text(
                        'Bem-vinda ao FitLab',
                        fontSize: width * 0.1,
                        fontWeight: FontWeight.w600,
                        color: colors.background
                    )
                  ),
                  SizedBox(height: height * 0.05),
                  text(
                      'Explore nossa motivação e encontre sua força',
                      color: colors.background,
                      fontSize: width * 0.05
                  ),
                  SizedBox(height: height * 0.07),
                  CustomButton(
                    title: 'ENTRAR',
                    sizeTitle: 16,
                    colorTitle: colors.secondary,
                    colorButton: colors.background,
                    onPress: widget.signInOnPress,
                  ),
                  SizedBox(height: height * 0.01),
                  CustomButton(
                    title: 'Não tem cadastro? Adquira aqui',
                    sizeTitle: 16,
                    colorTitle: Colors.white,
                    cleanButton: true,
                    onPress: (){},
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _gridview(List<String> images, {bool showLogo = false}){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 3),
      child: Column(
        children: List.generate(images.length, (index){
          bool _showLogo = index == 1 && showLogo;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 3),
            width: width * 0.3,
            height: height * 0.19,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                    width: 0,
                    color: _showLogo ? Colors.transparent : colors.background.withOpacity(0.8)
                )
            ),
            child: _showLogo ? Center(
              child: Icon(Icons.flash_on, size: 50, color: colors.background),
            ) :
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: CachedNetworkImage(
                fadeInDuration: const Duration(milliseconds: 300),
                imageUrl: images[index],
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _background(){
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              tileMode: TileMode.repeated,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                colors.primary,
                colors.secondary,
              ]
          )
      ),
    );
  }
}
