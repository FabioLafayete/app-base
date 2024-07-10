import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

class ListButton extends BaseState {
  ListButton({
    Key? key,
    required this.list
  }) : super(key: key);

  final List<ListButtonItem> list;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (_, index){
          ListButtonItem item = list[index];
          return Container(
            margin: EdgeInsets.only(top: item.isLogout ? 50 : 14),
            child: Card(
              margin: const EdgeInsets.only(bottom: 1),
              elevation: 0.8,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Material(
                  type: MaterialType.transparency,
                  child: InkWell(
                    onTap: item.onPress,
                    splashColor: item.onPress != null ? Colors.black54.withOpacity(0.05) : Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if(item.subTitle != null)
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 5),
                                    child: text(
                                        item.subTitle!,
                                        fontSize: 12,
                                        color: colors.textSecondary
                                    ),
                                  ),
                                Row(
                                  children: [
                                    if(item.icon != null)
                                      Row(
                                        children: [
                                          item.icon!,
                                          const SizedBox(width: 14),
                                        ],
                                      ),
                                    Expanded(
                                      child: text(
                                        item.title,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          if(item.showIcon)
                            Row(
                              children: [
                                if(item.textIcon != null)
                                  Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: text(
                                      item.textIcon!,
                                      color: item.iconColor ?? colors.primary,
                                      fontSize: 12
                                    ),
                                  ),
                                Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                    color: item.iconColor ?? colors.primary
                                )
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class ListButtonItem {
  final String title;
  final String? subTitle;
  final String? textIcon;
  final Function()? onPress;
  final Widget? icon;
  final Color? background;
  final Color? iconColor;
  final Color? titleColor;
  final bool isLogout;
  final bool showIcon;

  ListButtonItem({
    required this.title,
    this.subTitle,
    this.textIcon,
    this.onPress,
    this.isLogout = false,
    this.showIcon = true,
    this.icon,
    this.background,
    this.iconColor,
    this.titleColor
  });

}
