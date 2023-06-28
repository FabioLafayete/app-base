import 'package:flutter/material.dart';

class ListProgramsWidget extends StatelessWidget {
  const ListProgramsWidget({
    super.key,
    required this.title
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}

class ListProgramsModel {

  final String title;
  final String image;
  final String text;

  ListProgramsModel({
    required this.title,
    required this.image,
    required this.text,
});

}