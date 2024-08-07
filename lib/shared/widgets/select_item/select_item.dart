import 'package:app/shared/widgets/base_widget.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SelectItem extends BaseState {
  SelectItem({
    Key? key,
    required this.items,
    required this.onChange,
    this.backgroundColor,
    this.initialValue,
  }) : super(key: key);

  final List<SelectItemMenu> items;
  final Function(SelectItemMenu) onChange;
  final Color? backgroundColor;
  final String? initialValue;

  SelectItemMenu? itemSelected;

  @override
  Widget build(BuildContext context) {
    if (initialValue != null) {
      if (items
          .where((element) => element.enumItem == initialValue)
          .isNotEmpty) {
        itemSelected = items.firstWhere(
          (element) => element.enumItem == initialValue,
        );
      }
    }
    return Column(
      children: List.generate(
        items.length,
        (index) => _item(
          items[index],
        ),
      ),
    );
  }

  Widget _item(SelectItemMenu item) {
    bool isSelected = itemSelected != null && itemSelected == item;
    bool hasIcon = item.icon != null;
    return GestureDetector(
      onTap: () {
        itemSelected = item;
        onChange(item);
      },
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: isSelected
                  ? (backgroundColor ?? colors.primary)
                  : colors.text.withOpacity(0.1),
            )),
        child: Row(
          children: [
            if (hasIcon)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: item.icon!,
              ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: const Radius.circular(8),
                    bottomRight: const Radius.circular(8),
                    topLeft: Radius.circular(hasIcon ? 0 : 8),
                    bottomLeft: Radius.circular(hasIcon ? 0 : 8),
                  ),
                  color: isSelected
                      ? (backgroundColor ?? colors.primary)
                      : Colors.transparent,
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 18,
                  horizontal: 10,
                ),
                alignment: Alignment.centerLeft,
                child: text(
                  item.title,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: isSelected ? colors.background : colors.text,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectItemMenu {
  SelectItemMenu({
    required this.title,
    required this.enumItem,
    this.icon,
  });

  final String title;
  final String enumItem;
  final Widget? icon;
}
