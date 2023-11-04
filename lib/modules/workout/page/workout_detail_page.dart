import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/shared/model/workout/program_model/program_model.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class WorkoutDetailPage extends BaseWidget<WorkoutController> {
  WorkoutDetailPage({
    Key? key,
    required this.model
  }) : super(key: key);

  final ProgramModel model;

  @override
  Widget build(BuildContext context) {

    return BasePage(
      backgroundColor: colors.background,
      showAppBar: false,
      paddingPage: 0,
      extendBodyBehindAppBar: false,
      body: ListView(
        padding: EdgeInsets.zero,
        physics: const ClampingScrollPhysics(),
        children: [
          Stack(
            children: [
              _image(),
              _effectImage(),
              _info(),
              MyBackButton(),
              Positioned(
                bottom: 0, right: 0, left: 0,
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 0,
                    right: 20,
                    left: 20
                  ),
                  child: MyButton(
                    title: 'INICIAR TREINO',
                    sizeTitle: 18,
                    heightButton: 55,
                    border: 10,
                    colorButton: colors.primary,
                    colorTitle: colors.background,
                    onPress: (){},
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _effectImage(){
    return Container(
      height: height * 0.5,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                colors.background,
              ],
              stops: const [0, 0.85]
          )
      ),
    );
  }

  Widget _image() {
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      imageUrl: model.thumbnail,
      width: width,
      height: height * 0.5,
      fit: BoxFit.cover,
    );
  }

  Widget _info(){
    return Positioned(
      bottom: 70,
      left: 20,
      right: 20,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(
            model.title,
            fontWeight: FontWeight.w700,
            color: colors.text,
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
                if(model.duration != null)
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp, color: colors.text, size: 25),
                      const SizedBox(width: 5),
                      text(
                        model.duration!,
                        fontWeight: FontWeight.w400,
                        color: colors.text,
                        fontSize: 18,
                      ),
                      text(' min', fontSize: 12, color: colors.text)
                    ],
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Icon(Icons.local_fire_department_outlined, color: colors.text),
                      const SizedBox(width: 5),
                      text(
                        model.kcal.toString(),
                        fontWeight: FontWeight.w400,
                        color: colors.text,
                        fontSize: 18,
                      ),
                      text(' Kcal', fontSize: 12, color: colors.text)
                    ],
                  ),
                if(model.difficulty != null)
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Icon(Icons.bar_chart_rounded, color: colors.text, size: 25),
                      const SizedBox(width: 5),
                      text(
                        model.difficulty!,
                        fontWeight: FontWeight.w400,
                        color: colors.text,
                        fontSize: 18,
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
