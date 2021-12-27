import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kekkon_revision/app/components/default_appbar.dart';
import 'package:kekkon_revision/app/components/default_text.dart';
import 'package:kekkon_revision/app/components/function_utils.dart';
import 'package:kekkon_revision/app/components/gridview_content.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../controllers/pakaian_wanita_controller.dart';

class PakaianWanitaView extends GetView<PakaianWanitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefAppBar(
        tittle: controller.tittle.value,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: GetX<PakaianWanitaController>(
          init: PakaianWanitaController(),
          builder: (ctrl) {
            return Container(
              child: ctrl.listData.isEmpty
                  ? Center(
                      // child: CircularProgressIndicator(),
                      child: loading(),
                    )
                  : GridviewContent(
                      data: ctrl.listData,
                      tittle: ctrl.tittle.value,
                    ),
            );
          },
        ),
      ),
    );
  }
}

// body: Container(
      // padding: EdgeInsets.symmetric(horizontal: 15),
      //   child: FutureBuilder<QuerySnapshot<Object?>>(
      //     future: controller.fetchData(),
      //     builder: (context, snapshot) {
      //       if (snapshot.connectionState == ConnectionState.done) {
      //         // logKey(snapshot.data!.docs[1].data() as Map<String, dynamic>);
      //         var data = snapshot.data!.docs;
      //         logKey('data gaun', data);

      //         return GridviewContent(data: data);

      //       }
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     },
      //   ),
      // ),



              // return Container(
              //   child: ListView.builder(
              //     itemCount: 10,
              //     itemBuilder: (context, index) {
              //       var mapData = data[index].data() as Map<String, dynamic>;
              //       return Container(
              //         height: Get.height * 0.5,
              //         child: Column(
              //           children: [
              //             Flexible(
              //               flex: 4,
              //               child: Container(
              //                 child: ClipRRect(
              //                   child: FadeInImage.memoryNetwork(
              //                     placeholder: kTransparentImage,
              //                     image: mapData['gambar'] ?? 'https://martialartsplusinc.com/wp-content/uploads/2017/04/default-image-620x600.jpg',
              //                     fit: BoxFit.fill,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //             SizedBox(height: 10),
              //             DefText(mapData['nama']).normal,
              //           ],
              //         ),
              //       );
              //     },
              //   ),
              // );