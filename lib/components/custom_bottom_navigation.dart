import 'package:app/route/pages_name.dart';
import 'package:app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  _CustomBottomNavigationState createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {

  late Size size;
  late double bottom;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    bottom = MediaQuery.of(context).padding.bottom;

    return _bar([
      BottomNavigationBarModel(
        name: 'Home',
        icon: FontAwesomeIcons.bolt,
        routerName: PagesNames.home,
      ),
      BottomNavigationBarModel(
        name: 'Alimentação',
        icon: FontAwesomeIcons.utensils,
      ),
      BottomNavigationBarModel(
        name: 'Treinos',
        icon: FontAwesomeIcons.dumbbell,
      ),
      BottomNavigationBarModel(
          name: 'Comunidade',
          icon: FontAwesomeIcons.users
      ),
    ]);
  }

  double get spaceButton => 24;

  Widget _bar(List<BottomNavigationBarModel> list) {

    final values = [...list];

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Card(
          color: Colors.white,
          margin: EdgeInsets.symmetric(horizontal: size.width * 0.15).copyWith(bottom: spaceButton),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(1000),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...values.map((it) => _item(it)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _item(BottomNavigationBarModel item) {
    bool sameHere = ModalRoute.of(context)?.settings.name == item.routerName;
    var color = sameHere ? AppColors().primary
        : Colors.black38;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if(sameHere) return;
          if(item.routerName != null) Get.offNamed(item.routerName!);
        },
        child: Icon(
          item.icon,
          color: color,
        )
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

