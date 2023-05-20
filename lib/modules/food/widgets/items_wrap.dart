import 'package:app/components/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      crossAxisSpacing: 16,
      mainAxisSpacing: 24,
      childAspectRatio: (5 / 6),
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
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6),
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
                      placeholder: (context, url) => SizedBox(
                        height: 32,
                        width: 32,
                        child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(colors.primary)),
                      ),
                      errorWidget: (context, url, error) => const Center(
                        child: Icon(Icons.no_photography_sharp, color: Colors.grey),
                      )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 10),
              child: text(item.title, fontWeight: FontWeight.w700, maxLines: 1, textOverflow: TextOverflow.ellipsis, fontSize: 12),
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
