import 'package:app/shared/widgets/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class ListImagesWidget extends BaseWidget {

  ListImagesWidget({
    super.key,
    required this.title,
    required this.onPress,
    required this.listImages
  });

  final String title;
  final Function() onPress;
  final List<ListImagesModel> listImages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              text(title, fontSize: 30, fontWeight: FontWeight.w700),
              Row(
                children: [
                  text(
                      'Ver mais',
                      color: colors.primary,
                      fontWeight: FontWeight.w600,
                      fontSize: 14
                  ),
                  // Icon(
                  //     Icons.arrow_forward_ios_rounded,
                  //     size: 14, color: colors.primary
                  // )
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: 500,
          child: ListView.builder(
              itemCount: listImages.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index){
                final item = listImages[index];
                return Container(
                  margin: EdgeInsets.only(right: 16, left: index == 0 ? 16 : 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 300),
                          imageUrl: item.image,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              text(
                                  item.title,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600,
                                  color: colors.background
                              ),
                              Row(
                                children: [
                                  Icon(Icons.access_time, color: colors.background),
                                  const SizedBox(height: 60),
                                  text(' ${item.days} dias', color: colors.background),
                                ],
                              ),

                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ],
    );
  }

  Widget _effectImage(){
    return Container(
      height: height * 0.4,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: FractionalOffset.topCenter,
              end: FractionalOffset.bottomCenter,
              colors: [
                Colors.transparent,
                colors.primary,
              ],
              stops: const [0.1, 1]
          )
      ),
    );
  }

}

class ListImagesModel{

  final String title;
  final String image;
  final Function() onPress;
  final int days;
  final String? professional;

  ListImagesModel({
    required this.title,
    required this.image,
    required this.days,
    required this.onPress,
    this.professional,
  });

}
