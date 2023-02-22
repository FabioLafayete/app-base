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
      mainAxisSpacing: 16,
      childAspectRatio: (3 / 4),
      physics: const NeverScrollableScrollPhysics(),
      children: List.generate(items.length, _item),
    );
  }

  Widget _item(int index){
    ItemWrapModel item = items[index];
    return Card(
      elevation: 10,
      color: Colors.red,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: CachedNetworkImage(
            fadeInDuration: const Duration(milliseconds: 300),
            imageUrl: item.image,
            alignment: Alignment.center,
            fit: BoxFit.cover,
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
