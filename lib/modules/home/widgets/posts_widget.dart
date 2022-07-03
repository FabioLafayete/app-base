import 'package:app/components/base_widget.dart';
import 'package:flutter/material.dart';

import '../model/user_post_model.dart';

class PostsWidget extends BaseWidget {

  PostsWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final UserPostsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: width * 0.05,
      ).copyWith(top: height * 0.02),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _photo(),
              space(0.03, width: true),
              Expanded(
                child: text(
                    model.name,
                    size: 16, fontWeight: FontWeight.w600,
                    color: colors.primary
                ),
              )
            ],
          ),
          space(0.01),
          text(model.title, fontWeight: FontWeight.w700, size: 18, color: colors.text),
          space(0.02),
          text(model.body, color: colors.textSecondary),
          space(0.02),
          Divider(color: colors.text),
        ],
      ),
    );
  }

  Widget _photo(){
    return Container(
      width: width * 0.1,
      height: width * 0.1,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(1000)),
          border: Border.all(color: colors.primary)
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(1000)),
        child: Image.network(
          model.avatar,
          fit: BoxFit.cover,
          alignment: Alignment.center,
          loadingBuilder: (_,__,___){
            return const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircularProgressIndicator(strokeWidth: 2),
            );
          },
          errorBuilder: (_, __, ___){
            return const Icon(Icons.person, color: Colors.grey);
          },
        )
      ),
    );
  }

}
