import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/routes/app_pages.dart';

import 'constant.dart';

class GridviewContent extends StatelessWidget {
  const GridviewContent({
    required this.data,
    required this.tittle,
  });

  final List data;
  final String tittle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: StaggeredGridView.countBuilder(
        physics: BouncingScrollPhysics(),
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: data.length,
        staggeredTileBuilder: (index) {
          return StaggeredTile.fit(1);
        },
        itemBuilder: (context, index) {
          var mapData = data[index].data() as Map<String, dynamic>;
          return GestureDetector(
            onTap: () {
              Get.toNamed(
                Routes.DETAIL_ITEM,
                arguments: {
                  'data': mapData,
                  'tittle': tittle,
                },
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.4),
                borderRadius: kDefaultBorderRadius,
              ),
              child: Column(
                children: [
                  Container(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7),
                      ),
                      child: FadeInImage.memoryNetwork(
                        placeholder: kTransparentImage,
                        image: mapData['gambar'] ?? 'https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg',
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  DefText(
                    mapData['nama'] ?? 'kosong',
                    fontWeight: FontWeight.bold,
                    textAlign: TextAlign.center,
                  ).semilarge,
                  SizedBox(height: 10),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
