import 'package:app/components/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SelectItem extends BaseWidget {
  SelectItem({
    Key? key,
    required this.items,
    required this.onChange,
    this.backgroundColor,
    this.initialValue
  }) : super(key: key);

  final List<SelectItemMenu> items;
  final Function(SelectItemMenu?) onChange;
  final Color? backgroundColor;
  final String? initialValue;

  Rxn<SelectItemMenu> itemSelected = Rxn();

  @override
  Widget build(BuildContext context) {
    if(initialValue != null){
      print(initialValue);
      itemSelected.value = items.firstWhereOrNull(
              (element) => element.title == initialValue
      );
    }
    return Column(
      children: List.generate(items.length,
              (index) => Observer(builder: (_) => _item(items[index]))),
    );
  }

  Widget _item(SelectItemMenu item) {
    bool isSelected = itemSelected.value != null && itemSelected.value == item;
    bool hasIcon = item.icon != null;
    return GestureDetector(
        onTap: (){
          itemSelected.value = item;
          onChange(item);
        },
        child: Container(
          margin: const EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: isSelected ?
              (backgroundColor ?? colors.primary) :
              colors.text.withOpacity(0.1),
            )
          ),
          child: Row(
            children: [
              if(hasIcon)
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
                      color: isSelected ?
                      (backgroundColor ?? colors.primary) :
                      Colors.transparent,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                    alignment: Alignment.centerLeft,
                      child: text(
                          item.title,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: isSelected ? colors.background : colors.text
                      )
                  ),
              )
            ],
          ),
        )
    );
  }

}

class SelectItemMenu {
  SelectItemMenu({
    required this.title,
    this.icon,
  });

  final String title;
  final Widget? icon;
}
