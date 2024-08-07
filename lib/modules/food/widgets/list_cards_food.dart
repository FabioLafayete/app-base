import 'package:app/shared/widgets/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class ListCardFood extends BaseState {
  ListCardFood({
    Key? key,
    required this.title,
    required this.listItems,
    this.seeMore,
    this.invertColors = false,
    this.showFavorite = false,
  }) : super(key: key);

  final String title;
  final Function()? seeMore;
  final bool invertColors;
  final bool showFavorite;
  final List<CardFoodModel> listItems;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: text(
                  title,
                  maxLines: 1,
                  textOverflow: TextOverflow.ellipsis,
                  color: invertColors ? colors.text2 : colors.text,
                  fontWeight: FontWeight.w700,
                  fontSize: 22,
                ),
              ),
              if (seeMore != null)
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    children: [
                      text(
                        'Ver mais',
                        color: invertColors ? colors.text2 : colors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                      // Icon(Icons.arrow_forward_ios_rounded, size: 14, color: invertColors ? colors.text2 : colors.primary)
                    ],
                  ),
                )
            ],
          ),
        ),
        space(0.01),
        SizedBox(
          height: 250,
          child: SuperListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            children: List.generate(listItems.length, (index) {
              return _item(index);
            }),
          ),
        )
      ],
    );
  }

  Widget _item(int index) {
    CardFoodModel item = listItems[index];
    return GestureDetector(
      onTap: item.onPress,
      child: Container(
        margin: EdgeInsets.only(
          left: index == 0 ? 16 : 0,
          right: index + 1 == listItems.length ? 16 : 4,
          bottom: 6,
        ),
        width: 180,
        child: Card(
          color: colors.text2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              10,
            ),
          ),
          elevation: 3,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(
                  6.0,
                ).copyWith(
                  bottom: 0,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      if (!item.thumbnail.contains('assets/images'))
                        CachedNetworkImage(
                          fadeInDuration: const Duration(milliseconds: 300),
                          imageUrl: listItems[index].thumbnail,
                          alignment: Alignment.center,
                          width: width,
                          height: 170,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Shimmer.fromColors(
                            baseColor: Colors.grey.withOpacity(0.8),
                            highlightColor: Colors.grey.withOpacity(0.6),
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                          errorWidget: (context, url, error) => const Center(
                            child: Icon(
                              Icons.no_photography_sharp,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      else
                        Image.asset(
                          listItems[index].thumbnail,
                          alignment: Alignment.center,
                          width: width,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                      if (showFavorite)
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: colors.text.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(1000),
                            ),
                            child: Icon(
                              Icons.favorite_border,
                              color: colors.background,
                              size: 20,
                            ),
                          ),
                        ),
                      if (item.kcal != null || item.duration != null)
                        Positioned(
                            bottom: 10,
                            left: 10,
                            child: Row(
                              children: [
                                if (item.duration != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    margin: const EdgeInsets.only(right: 5),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFDE8CF),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: text(
                                        '${item.duration!} min',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                if (item.kcal != null)
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 3,
                                    ),
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF7BF2B6),
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: text(
                                        '${item.kcal!} Cal',
                                        fontSize: 10,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                              ],
                            )),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  width: width,
                  padding: const EdgeInsets.all(12).copyWith(top: 8, bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      text(
                        item.title,
                        maxLines: 2,
                        fontSize: 14,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w600,
                        color: colors.text,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardFoodModel {
  final String title;
  final String thumbnail;
  final String? kcal;
  final String? duration;
  final bool isFavorite;
  final Function() onPress;

  CardFoodModel({
    required this.title,
    required this.thumbnail,
    required this.onPress,
    this.kcal,
    this.duration,
    this.isFavorite = false,
  });
}

//
// import 'package:app/shared/widgets/base_widget.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import 'package:super_sliver_list/super_sliver_list.dart';
//
// class ListCardFood extends BaseState {
//   ListCardFood({
//     Key? key,
//     required this.title,
//     required this.listItems,
//     this.seeMore,
//     this.invertColors = false,
//     this.showFavorite = false
//   }) : super(key: key);
//
//   final String title;
//   final Function()? seeMore;
//   final bool invertColors;
//   final bool showFavorite;
//   final List<CardFoodModel> listItems;
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Expanded(child: text(
//                   title,
//                   maxLines: 1,
//                   textOverflow: TextOverflow.ellipsis,
//                   color: invertColors ? colors.text2 : colors.text,
//                   fontWeight: FontWeight.w700,
//                   fontSize: 22
//               )),
//               if(seeMore != null)
//                 GestureDetector(
//                   onTap: (){},
//                   child: Row(
//                     children: [
//                       text('Ver mais', color: invertColors ? colors.text2 : colors.primary, fontWeight: FontWeight.w600, fontSize: 14),
//                       // Icon(Icons.arrow_forward_ios_rounded, size: 14, color: invertColors ? colors.text2 : colors.primary)
//                     ],
//                   ),
//                 )
//             ],
//           ),
//         ),
//         space(0.01),
//         SizedBox(
//           height:  250,
//           child: SuperListView(
//             padding: EdgeInsets.zero,
//             scrollDirection: Axis.horizontal,
//             shrinkWrap: true,
//             children: List.generate(listItems.length, (index){
//               return _item(index, context);
//             }),
//           ),
//         )
//       ],
//     );
//   }
//
//   Widget _item(int index, BuildContext context){
//     CardFoodModel item = listItems[index];
//     return GestureDetector(
//       onTap: item.onPress,
//       child: Container(
//         margin: EdgeInsets.only(
//             left: index == 0 ? 16 : 0,
//             right: index + 1 == listItems.length ? 16 : 4,
//             bottom: 6
//         ),
//         width: 180,
//         child: Card(
//           color: colors.text2,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(10)
//           ),
//           elevation: 3,
//           child: Column(
//             children: [
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0).copyWith(bottom: 0),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(8),
//                     child: Stack(
//                       children: [
//                         if(!listItems[index].thumbnail.contains('assets/images'))
//                           CachedNetworkImage(
//                             fadeInDuration: const Duration(milliseconds: 300),
//                             imageUrl: listItems[index].thumbnail,
//                             alignment: Alignment.center,
//                             width: width,
//                             height: height,
//                             fit: BoxFit.cover,
//                             placeholder: (context, url) => Shimmer.fromColors(
//                               baseColor: Colors.grey.withOpacity(0.8),
//                               highlightColor: Colors.grey.withOpacity(0.6),
//                               child: Container(
//                                 color: Colors.black,
//                               ),
//                             ),
//                             errorWidget: (context, url, error) => const Center(
//                               child: Icon(Icons.no_photography_sharp, color: Colors.grey),
//                             )
//                           ),
//                         if(listItems[index].thumbnail.contains('assets/images'))
//                           Image.asset(
//                             listItems[index].thumbnail,
//                             alignment: Alignment.center,
//                             width: width,
//                             height: height,
//                             fit: BoxFit.cover,
//                           ),
//                         if(showFavorite)
//                           Positioned(
//                               top: 10,
//                               right: 10,
//                               child: Container(
//                                   padding: const EdgeInsets.all(5),
//                                   decoration: BoxDecoration(
//                                     color: colors.text.withOpacity(0.6),
//                                     borderRadius: BorderRadius.circular(1000),
//                                   ),
//                                   child: Icon(Icons.favorite_border, color: colors.background, size: 24,)
//                               )
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Container(
//                 width: width,
//                 padding: const EdgeInsets.all(12).copyWith(top: 8, bottom: 8),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     text(
//                         item.title,
//                         maxLines: 2,
//                         fontSize: 16,
//                         textOverflow: TextOverflow.ellipsis,
//                         fontWeight: FontWeight.w600,
//                         color: colors.text
//                     ),
//                     text(
//                         '${item.kcal} kcal',
//                         maxLines: 1,
//                         textOverflow: TextOverflow.ellipsis,
//                         fontWeight: FontWeight.w400,
//                         color: colors.text
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
// class CardFoodModel {
//   final String title;
//   final String thumbnail;
//   final String? kcal;
//   final bool isFavorite;
//   final Function() onPress;
//
//   CardFoodModel({
//     required this.title,
//     required this.thumbnail,
//     required this.onPress,
//     this.kcal,
//     this.isFavorite = false
//   });
// }
