import 'dart:math';

import 'package:app/components/base_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MultipleUsers extends BaseWidget {
  MultipleUsers({Key? key, required this.users}) : super(key: key);

  final List<MultipleUsersModel> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 32,
      alignment: Alignment.centerLeft,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: List.generate(users.take(4).length, (i) => _item(i, context))
          ..add(_item(users.take(4).length, context, lastItem: true)),
      ),
    );
  }

  Widget _item(int index, BuildContext context, {bool lastItem = false}){
    return Positioned(
      left: index == 0 ? 0 : (index * 18),
      child: Container(
        height: 32,
        width: 32,
        decoration: BoxDecoration(
          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
          borderRadius: BorderRadius.circular(1000),
          border: Border.all(color: colors.text2, width: 1.5)
        ),
        child: CachedNetworkImage(
          fadeInDuration: const Duration(milliseconds: 300),
          imageUrl: (!lastItem && users[index].photo != null) ? users[index].photo! : '',
          alignment: Alignment.center,
          fit: BoxFit.cover,
          imageBuilder: (_, img) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: Image(
                height: 30,
                width: 30,
                image: img,
              ),
            );
          },
          placeholder: (context, url) => SizedBox(
            height: 32,
            width: 32,
            child: CircularProgressIndicator(strokeWidth: 2, valueColor: AlwaysStoppedAnimation<Color>(colors.primary)),
          ),
          errorWidget: (context, url, error) => Center(
            child: text(
                lastItem ? compact(context) : users[index].name[0].toUpperCase(),
                fontWeight: FontWeight.w700, color: colors.text2,
                fontSize: lastItem ? 10 : null
            ),
          )
        ),
      ),
    );
  }

  String compact(BuildContext context){
    final format = NumberFormat.compact(locale: Localizations.localeOf(context).languageCode);
    String number = format.format(400 + Random().nextInt(5000));
    if(number.contains('.')){
      number = '${number.substring(0, number.indexOf('.'))}K';
    }
    return '+$number';
  }

}

class MultipleUsersModel{
  final String name;
  final String? photo;
  MultipleUsersModel({required this.name, this.photo});
}
