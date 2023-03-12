import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../utils/styles.dart';

class MapSearchPage extends StatelessWidget {
  const MapSearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        elevation: 1,
        leading: Transform.scale(
          scale: 0.7,
          child: IconButton(
              icon: SvgPicture.asset("assets/icons/back.svg"),
              color: AppColors.black,
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        flexibleSpace: Container(
            margin: const EdgeInsets.fromLTRB(56, 30, 18, 0),
            alignment: Alignment.center,
            child: TextField(
              autofocus: true,
              onChanged: (text) {
                /* send text to server */
              },
              decoration: InputDecoration(
                  hintText: "장소, 가게명 검색",
                  border: InputBorder.none,
                  hintStyle: TextStyles.medium16
                      .merge(TextStyle(color: Colors.grey.shade400))),
            )),
      ),
      body: Text('Map Search Page'),
    );
  }
}

/*
* TextField(
                    onChanged: (text) {
                      /* send text to server */
                    },
                    decoration: InputDecoration(
                        hintText: "장소, 가게명 검색",
                        border: InputBorder.none,
                        hintStyle: TextStyles.medium16
                            .merge(TextStyle(color: Colors.grey.shade400))),
                  ),*/
