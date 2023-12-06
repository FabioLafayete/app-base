import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WorkoutDetailPage extends BaseWidget<WorkoutController> {
  WorkoutDetailPage({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Stack(
                children: [
                  _image(),
                  _effectImage(),
                  _info(),
                  MyBackButton(),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    text('Treinos', fontSize: 20, fontWeight: FontWeight.w700),
                    const SizedBox(height: 20),
                    ...List.generate(controller.programModel!.workouts.length, (index){
                      final item = controller.programModel!.workouts[index];
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(238, 238, 238, 1.0),
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            width: 0.5, color: const Color.fromRGBO(220, 222, 224, 1.0),
                          )
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                bottomLeft: Radius.circular(12),
                              ),
                              child: CachedNetworkImage(
                                fadeInDuration: const Duration(milliseconds: 300),
                                imageUrl: item.thumbnail!,
                                fit: BoxFit.cover,
                                height: 100,
                                width: 120,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  text(
                                    item.title,
                                    fontWeight: FontWeight.w600,
                                    color: colors.text,
                                    maxLines: 2,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: 20,
                                  ),
                                  const SizedBox(height: 10),
                                  text(
                                    item.duration ?? '',
                                    fontWeight: FontWeight.w300,
                                    color: colors.text,
                                    maxLines: 1,
                                    textOverflow: TextOverflow.ellipsis,
                                    fontSize: 14,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    }),
                    const SizedBox(height: 100),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: MyButton(
                title: 'Começar',
                sizeTitle: 20,
                heightButton: 55,
                border: 10,
                colorButton: colors.primary,
                colorTitle: colors.background,
                onPress: (){
                  // router.pushNamed(PagesNames.workoutVideo);
                  router.pushNamed(PagesNames.workoutCongrats);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _effectImage(){
    return Container(
      height: height * 0.45,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                colors.text.withOpacity(0.6),
              ],
              stops: const [0, 0.9]
          )
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      imageUrl: controller.programModel!.thumbnail,
      width: width,
      height: height * 0.45,
      fit: BoxFit.cover,
    );
  }

  Widget _info(){
    return Positioned(
      bottom: 10,
      left: 20,
      right: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(
            controller.programModel!.title,
            fontWeight: FontWeight.w700,
            color: colors.text2,
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
            fontSize: 30,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                if(controller.programModel!.duration != null)
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp, color: colors.text2, size: 22),
                      const SizedBox(width: 5),
                      text(
                        controller.programModel!.duration!,
                        fontWeight: FontWeight.w400,
                        color: colors.text2,
                        fontSize: 16,
                      ),
                      text(' min', fontSize: 12, color: colors.text2)
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(width: 20),
                      Icon(Icons.local_fire_department_outlined, color: colors.text2),
                      const SizedBox(width: 5),
                      text(
                        controller.programModel!.kcal.toString(),
                        fontWeight: FontWeight.w400,
                        color: colors.text2,
                        fontSize: 16,
                      ),
                      text(' Kcal', fontSize: 12, color: colors.text2)
                    ],
                  ),
                if(controller.programModel!.difficulty != null)
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Icon(Icons.bar_chart_rounded, color: colors.text2, size: 20),
                      const SizedBox(width: 5),
                      text(
                        controller.programModel!.difficulty!,
                        fontWeight: FontWeight.w400,
                        color: colors.text2,
                        fontSize: 16,
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}