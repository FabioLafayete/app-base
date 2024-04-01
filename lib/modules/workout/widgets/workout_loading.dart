import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class WorkoutLoading extends StatelessWidget {
  const WorkoutLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        enabled: true,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: ListView(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              Container(
                width: double.maxFinite,
                height: 380,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                  ),
                ),
              ),
              ...List.generate(3, (index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        width: 230,
                        height: 20,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 120,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: List.generate(4, (index){
                          return Container(
                            margin: EdgeInsets.only(right: 20, left: index == 0 ? 16 : 0),
                            width: 230,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                );
              }),
            ],
          ),
        ),
    );
  }
}
