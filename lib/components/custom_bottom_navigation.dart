import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  List<BottomNavigationBarModel> lists = [
    BottomNavigationBarModel(
      name: 'Home',
      icon: Icons.whatshot,
      routerName: '/home',
    ),
    BottomNavigationBarModel(
      name: 'Alimentação',
      icon: Icons.restaurant_outlined,
    ),
    BottomNavigationBarModel(
      name: 'Treinos',
      icon: Icons.fitness_center_outlined,
    ),
    BottomNavigationBarModel(
      name: 'Comunidade',
      icon: Icons.people_alt_outlined,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _bar(lists);
  }

  double get spaceButton => 24;

  Widget _bar(List<BottomNavigationBarModel> list) {
    final values = [...list];

    return LayoutBuilder(builder: (context, constraints) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(bottom: spaceButton, top: 15, left: 5, right: 5),
            decoration: BoxDecoration(
              color: AppColors().background,
              border: Border.all(
                color: Colors.grey.withOpacity(0.5), width: 0.2
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ...values.map((it) => _item(it)),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _item(BottomNavigationBarModel item) {
    bool sameHere = ModalRoute.of(context)?.settings.name == item.routerName;
    var color = sameHere ? AppColors().primary
        : Colors.grey;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if(sameHere) return;
          if(item.routerName != null) Get.offNamed(item.routerName!);
        },
        child: Opacity(
          opacity: item.isDisable ? 0.4 : 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              if (item.name?.isNotEmpty ?? false)
                Icon(
                  item.icon,
                  color: color,
                ),
              const SizedBox(height: 3),
              Text(
                item.name ?? '',
                style: TextStyle(
                    fontSize: 10,
                    fontWeight: sameHere ? FontWeight.w800 : FontWeight.w400,
                    color: color
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarModel {
  final String? name;
  final IconData? icon;
  final String? routerName;
  final bool isDisable;

  BottomNavigationBarModel({
    this.name,
    this.icon,
    this.routerName,
    this.isDisable = false,
  });
}

