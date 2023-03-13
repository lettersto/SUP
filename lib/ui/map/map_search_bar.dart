import 'package:flutter/material.dart';
import 'package:sup/main.dart';
import 'package:sup/utils/styles.dart';

class MapSearchBar extends StatelessWidget {
  const MapSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 50, left: 12, right: 12),
        padding: const EdgeInsets.only(left: 18, right: 18),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: GestureDetector(
          child: Stack(
            alignment: Alignment.centerLeft,
            children: [
              Container(
                color: Colors.white,
                height: 50,
              ),
              Text("장소, 가게명 검색",
                  style: TextStyles.medium16
                      .merge(TextStyle(color: Colors.grey.shade400))),
            ],
          ),
          onTap: () {
            Navigator.of(context).pushNamed(routeSearch);
          },
        ));
  }
}
