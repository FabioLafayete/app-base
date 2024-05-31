import 'dart:io';

import 'package:app/modules/workout/controller/workout_controller.dart';
import 'package:app/route/pages_name.dart';
import 'package:app/shared/widgets/back_button.dart';
import 'package:app/shared/widgets/base_page.dart';
import 'package:app/shared/widgets/base_widget.dart';
import 'package:app/shared/widgets/my_button.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:super_sliver_list/super_sliver_list.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
          SuperListView(
            padding: EdgeInsets.zero,
            physics: const ClampingScrollPhysics(),
            children: [
              Stack(
                children: [
                  _image(context),
                  _effectImage(context),
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
                    ...List.generate(controller.state.programModel!.workouts.length, (index){
                      final item = controller.state.programModel!.workouts[index].video!;
                      return GestureDetector(
                        onTap: (){
                          router.pushNamed(PagesNames.workoutVideo);
                        },
                        child: Container(
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
                                // child: FutureBuilder<Uint8List>(
                                //   future: _getImage(item.thumbnail!),
                                //   builder: (_, snap){
                                //     if(!snap.hasData){
                                //       return Container(
                                //         width: 120,
                                //         height: 100,
                                //         decoration: BoxDecoration(
                                //           color: colors.background,
                                //           borderRadius: const BorderRadius.only(
                                //             topLeft: Radius.circular(14),
                                //             bottomLeft: Radius.circular(14),
                                //           )
                                //         ),
                                //         child: const Icon(
                                //           Icons.camera_alt_outlined,
                                //         ),
                                //       );
                                //     }
                                //
                                //     return Image.memory(
                                //       snap.data!,
                                //       fit: BoxFit.cover,
                                //       height: 100,
                                //       width: 120,
                                //     );
                                //   },
                                // ),
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
            bottom: MediaQuery.of(context).padding.bottom + 10,
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
                  router.pushNamed(PagesNames.workoutVideo);
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<Uint8List> _getImage(String image) async {
    final byteData = await rootBundle.load(image);
    Directory tempDir = await getTemporaryDirectory();

    File tempVideo = File("${tempDir.path}$image")
      ..createSync(recursive: true)
      ..writeAsBytesSync(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

    final fileName = await VideoThumbnail.thumbnailData(
      video: tempVideo.path,
      imageFormat: ImageFormat.JPEG,
      quality: 100,
    );

    return fileName!;
  }

  Widget _effectImage(BuildContext context){
    return Container(
      height: height(context) * 0.45,
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

  Widget _image(BuildContext context) {
    if(!controller.state.programModel!.thumbnail.contains('http')) {
      return Image.asset(
      controller.state.programModel!.thumbnail,
      width: width(context),
      height: height(context) * 0.45,
      fit: BoxFit.cover,
    );
    }
    return CachedNetworkImage(
      fadeInDuration: const Duration(milliseconds: 300),
      imageUrl: controller.state.programModel!.thumbnail,
      width: width(context),
      height: height(context) * 0.45,
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
            controller.state.programModel!.title,
            fontWeight: FontWeight.w700,
            color: colors.text2,
            maxLines: 2,
            textOverflow: TextOverflow.ellipsis,
            fontSize: 30,
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 40,
            child: SuperListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                if(controller.state.programModel!.duration != null)
                  Row(
                    children: [
                      Icon(Icons.access_time_sharp, color: colors.text2, size: 22),
                      const SizedBox(width: 5),
                      text(
                        controller.state.programModel!.duration!,
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
                        controller.state.programModel!.kcal.toString(),
                        fontWeight: FontWeight.w400,
                        color: colors.text2,
                        fontSize: 16,
                      ),
                      text(' Kcal', fontSize: 12, color: colors.text2)
                    ],
                  ),
                if(controller.state.programModel!.difficulty != null)
                  Row(
                    children: [
                      const SizedBox(width: 20),
                      Icon(Icons.bar_chart_rounded, color: colors.text2, size: 20),
                      const SizedBox(width: 5),
                      text(
                        controller.state.programModel!.difficulty!,
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