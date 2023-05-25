import 'package:app/components/base_widget.dart';
import 'package:flutter/material.dart';

class ListButton extends BaseWidget {
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
            margin: EdgeInsets.only(top: item.isLogout ? 40 : 12),
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
                    splashColor: Colors.black54.withOpacity(0.05),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    Icon(item.icon, size: 28),
                                    const SizedBox(width: 14),
                                    Expanded(
                                      child: text(
                                        item.title,
                                        maxLines: 1,
                                        textOverflow: TextOverflow.ellipsis,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: item.iconColor ?? colors.primary
                              )
                            ],
                          ),
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
  final Function() onPress;
  final IconData? icon;
  final Color? background;
  final Color? iconColor;
  final Color? titleColor;
  final bool isLogout;

  ListButtonItem({
    required this.title,
    required this.onPress,
    this.isLogout = false,
    this.icon,
    this.background,
    this.iconColor,
    this.titleColor
  });

}
