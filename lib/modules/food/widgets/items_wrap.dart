import 'package:app/shared/widgets/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ItemsWrapWidget extends BaseWidget {

  ItemsWrapWidget({
    Key? key,
    required this.items,
  }) : super(key: key);

  final List<ItemWrapModel> items;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 30,
      childAspectRatio: 0.85,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(items.length, _item),
    );
  }

  Widget _item(int index){
    ItemWrapModel item = items[index];
    return GestureDetector(
      onTap: item.onPress,
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0).copyWith(bottom: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: CachedNetworkImage(
                      fadeInDuration: const Duration(milliseconds: 300),
                      imageUrl: item.image,
                      alignment: Alignment.center,
                      fit: BoxFit.cover,
                      width: width,
                      height: height,
                      imageBuilder: (_, img) {
                        return Image(
                          image: img,
                          fit: BoxFit.cover,
                        );
                      },
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.8),
                        highlightColor: Colors.grey.withOpacity(0.6),
                        child: Container(
                          color: Colors.black,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.no_photography_sharp, color: Colors.grey),
                      )
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              height: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  text(
                      item.title,
                      fontWeight: FontWeight.w600,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      fontSize: 12
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}

class ItemWrapModel{
  final String image;
  final String title;
  final Function() onPress;

  ItemWrapModel({
    required this.image,
    required this.title,
    required this.onPress
  });

}
