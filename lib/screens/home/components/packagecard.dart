import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/controllers/houseboatapicardcontroller.dart';
import 'package:trip_calicut/controllers/packageapicardcontroller.dart';
import 'package:http/http.dart' as http;

import 'titletext.dart';

List<int> list = [];

class PackageCardList extends StatelessWidget {
  final PackageApiCardController controller = Get.put(PackageApiCardController());

  PackageCardList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: controller.packageData.value.length,
            separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                print(controller.packageData.value[index].agencyId);

                Get.toNamed(
                  '/homesinglepagepackage',
                  arguments: [
                    controller.packageData.value[index].id,
                  ],
                );
              },
              child: Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
                child: Column(
                  children: [
                    Container(
                      height: 20.h,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: controller.packageData.value[index].image!.isEmpty || controller.packageData.value[index].image == null
                            ? Image.asset(
                                'assets/images/no_image/noimage_landscape.jpeg',
                                fit: BoxFit.cover,
                              )
                            : CachedNetworkImage(
                                imageUrl: Api.imageUrl + '${controller.packageData.value[index].image!}',
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TitleText(
                          text: controller.packageData.value[index].name!.substring(0, 1).toUpperCase() +
                              controller.packageData.value[index].name!.substring(1).toLowerCase(),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            // Text('₹'),
                            Text(
                              '₹${controller.packageData.value[index].avgAmount!.toString()}/-',
                              style: TextStyle(fontFamily: 'Lato', fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFF00A6F6)),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              '₹${controller.packageData.value[index].offerAmount!.toString()}',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  // line text
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '${controller.packageData.value[index].advAmount!.toString()}%Off',
                              style: TextStyle(fontFamily: 'Lato', fontSize: 17, fontWeight: FontWeight.bold, color: Color(0xFFF6B100)),
                            ),
                          ],
                        ),
                        Text(
                          controller.packageData.value[index].name!.substring(0, 1).toUpperCase() +
                              controller.packageData.value[index].name!.substring(1).toLowerCase().split(' ')[0],
                          style: TextStyle(
                            fontFamily: 'Lato',
                            color: Color.fromARGB(255, 102, 101, 101),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
