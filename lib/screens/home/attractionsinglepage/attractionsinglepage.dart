import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:trip_calicut/constant/api.dart';
import 'package:trip_calicut/screens/home/attractionsinglepage/truckingsinglepagecontroller.dart';
import 'package:trip_calicut/screens/jobs/components/FixedBottomSwitch.dart';
import 'package:trip_calicut/screens/tours/components/fixed_top_navigatio.dart';
import 'package:http/http.dart' as http;

import '../../resort/singlepage/resortsinglepagecontroller.dart';

class AttractionSinglePage extends StatelessWidget {
  final AttractionSinglePageController attractionController =
      Get.put(AttractionSinglePageController());

 

  final PlaceGalleryController galleryController =
      Get.put(PlaceGalleryController());

  

  // final packageCardIndex = Get.arguments[2];
  // final packageCardController = Get.arguments[3];

  AttractionSinglePage({Key? key}) : super(key: key);
  static final tourItemId = Get.arguments[0];

  static final client = new http.Client();

  static Future fetchAttractionData({String? api}) async {
    var responses =
        await client.post(Uri.parse(Api.apiUrl + '$api$tourItemId'));
    if (responses.statusCode == 200) {
      var jsonResponse = responses.body;
      return jsonResponse;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xff00A6F6),
      backgroundColor: Color(0xff00A6F6),
      body: SafeArea(
        child: NotificationListener<OverscrollIndicatorNotification>(
            onNotification: (OverscrollIndicatorNotification overscroll) {
          overscroll.disallowIndicator();
          return false;
        }, child: Obx(() {
          if (attractionController.isLoading.value) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            // return ElevatedButton(
            //     onPressed: () {
            //       print(controller.packageData.value.advAmount);
            //     },
            //     child: Text("hello"));
            return Stack(
              children: <Widget>[
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  child: Column(
                    children: [
                      Container(
                        // height: 2000.h,
                        decoration: BoxDecoration(color: Colors.white),
                        child: Column(
                          children: [
                            Stack(
                              clipBehavior: Clip.none,
                              children: [
                                attractionController.attractionData.value.image == null
                                    ? Container(
                                        height: 500,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.4),
                                                    BlendMode.darken),
                                                image: AssetImage(
                                                    'assets/images/imageone.jpg'),
                                                fit: BoxFit.cover),
                                            color: Colors.black),
                                      )
                                    : Container(
                                        height: 500,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                colorFilter: ColorFilter.mode(
                                                    Colors.black
                                                        .withOpacity(0.4),
                                                    BlendMode.darken),
                                                image: NetworkImage(Api
                                                        .imageUrl +
                                                    attractionController
                                                      .attractionData.value.image.toString()),
                                                fit: BoxFit.cover),
                                            color: Colors.black),
                                      ),
                                Positioned(
                                    bottom: 75,
                                    width: MediaQuery.of(context).size.width,
                                    child: Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 18),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.80,
                                                child: Text(
                                                  //first letter caps and rest lower
                                                  //split with two words
                                                  attractionController
                                                      .attractionData.value.name
                                                      .toString(),
                                                  maxLines: 1,
                                                  overflow:
                                                      TextOverflow.ellipsis,

                                                  //     .substring(0, 1)
                                                  //     .toUpperCase() +
                                                  // controller.packageData.value.name!
                                                  //     .substring(1)
                                                  //     .toLowerCase(),
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                attractionController.attractionData.value
                                                            .district ==
                                                        null
                                                    ? 'Kerala'
                                                    : "${attractionController.attractionData.value.district},${attractionController.attractionData.value.state}",
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    // fontWeight: FontWeight.bold,
                                                    color: Colors.white70),
                                              ),
                                            ],
                                          ),
                                          Icon(
                                            Icons.favorite_outline,
                                            size: 30,
                                            color: Color.fromARGB(
                                                255, 160, 14, 14),
                                          ),
                                        ],
                                      ),
                                    )),
                                Positioned(
                                  bottom: 0,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 60,
                                    child: Center(
                                      child: Text(
                                        '',
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xff00A6F6),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(40),
                                            topRight: Radius.circular(40))),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              color: Color(0xff00A6F6),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(40),
                                      topRight: Radius.circular(40)),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: DefaultTabController(
                                        length: 3,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 4,
                                                  right: 8,
                                                  left: 8,
                                                  bottom: 8),
                                              child: Container(
                                                height: 40,
                                                // width: 95,
                                                // margin: const EdgeInsets.only(
                                                //     top: 20, left: 20, right: 20),
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  // border: Border.all(
                                                  //     color: Colors.grey.shade400,
                                                  //     width: 0),
                                                ),
                                                child: TabBar(
                                                  labelStyle: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  unselectedLabelStyle:
                                                      TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black,
                                                  ),
                                                  indicator: BoxDecoration(
                                                    color: Color(0xffE5E5E5),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  // isScrollable: true,
                                                  labelColor: Colors.black,
                                                  unselectedLabelColor:
                                                      Colors.black,
                                                  tabs: [
                                                    Text(
                                                      'Description',
                                                    ),

                                                    Text(
                                                      'Videos',
                                                    ),
                                                    Text(
                                                      'Gallery',
                                                    ),
                                                    // Icon(Icons.abc),
                                                    // Icon(Icons.heart_broken),
                                                    // Icon(Icons.verified_user),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Container(
                                              constraints: BoxConstraints(
                                                maxHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.50,
                                                minHeight:
                                                    MediaQuery.of(context)
                                                            .size
                                                            .height *
                                                        0.50,
                                              ),
                                              child: TabBarView(
                                                children: <Widget>[
                                                  GestureDetector(
                                                      onTap: () {},
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                  height: 10),
                                                              Text(
                                                                '${attractionController.attractionData.value.desc}',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        13),
                                                              ),
                                                              // SizedBox(
                                                              //     height: 20),
                                                              // Text(
                                                              //   'Inclusion',
                                                              //   style: TextStyle(
                                                              //       fontSize:
                                                              //           10),
                                                              // ),
                                                              // SizedBox(
                                                              //     height: 10),
                                                              // Text(
                                                              //   '${truckingCardInclusion}',
                                                              //   style: TextStyle(
                                                              //       fontSize:
                                                              //           13),
                                                              // ),
                                                              // SizedBox(
                                                              //   height: 10,
                                                              // ),
                                                              // Text(
                                                              //   'Exclusion',
                                                              //   style: TextStyle(
                                                              //       fontSize:
                                                              //           10),
                                                              // ),
                                                              // SizedBox(
                                                              //     height: 10),
                                                              // Text(
                                                              //   '${truckingCardExclusion}',
                                                              //   style: TextStyle(
                                                              //       fontSize:
                                                              //           13),
                                                              // ),
                                                              
                                                              SizedBox(
                                                                  height: 30),
                                                            ],
                                                          ),
                                                        ),
                                                      )),
                                                  // EducationList(),
                                                  // EducationList(),
                                                  Container(
                                                      color: Color.fromARGB(
                                                          255, 253, 251, 251),
                                                      padding: EdgeInsets.only(
                                                          right: 16,
                                                          left: 16,
                                                          bottom: 20),
                                                      // color: Colors.red,
                                                      child: Expanded(
                                                        child:
                                                            ListView.separated(
                                                          separatorBuilder:
                                                              (context,
                                                                      index) =>
                                                                  SizedBox(
                                                            height: 10,
                                                          ),
                                                          itemCount: 5,
                                                          itemBuilder:
                                                              (context, index) {
                                                            return Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        236,
                                                                        235,
                                                                        235),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(4),
                                                              child: ListTile(
                                                                leading:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  child: Image
                                                                      .asset(
                                                                          'assets/images/imageone.jpg'),
                                                                ),
                                                                title: Text(
                                                                    "hello"),
                                                                subtitle: Text(
                                                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                                                                    maxLines: 4,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      )),
                                                  // EducationList(),
                                                  Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 16),
                                                    // color: Colors.red,
                                                    child: GridView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      shrinkWrap: true,
                                                      gridDelegate:
                                                          SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 3,
                                                        crossAxisSpacing: 15,
                                                        mainAxisSpacing: 5,
                                                        mainAxisExtent: 14.h,
                                                      ),
                                                      itemCount:
                                                          galleryController
                                                              .galleryData
                                                              .value
                                                              .length,
                                                      itemBuilder:
                                                          (BuildContext context,
                                                              int index) {
                                                        return Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(4),
                                                          child: galleryController
                                                                      .galleryData
                                                                      .value[
                                                                          index]
                                                                      .image!
                                                                      .isEmpty ||
                                                                  galleryController
                                                                          .galleryData
                                                                          .value[
                                                                              index]
                                                                          .image ==
                                                                      null
                                                              ? Container(
                                                                  // width: MediaQuery.of(context).size.width * 0.25,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.10,

                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: AssetImage(
                                                                              'assets/images/imageone.jpg'),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                      color: Colors
                                                                          .amber,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  // child: Center(child: Text('$index')),
                                                                )
                                                              : Container(
                                                                  // width: MediaQuery.of(context).size.width * 0.25,
                                                                  height: MediaQuery.of(
                                                                              context)
                                                                          .size
                                                                          .height *
                                                                      0.10,

                                                                  decoration: BoxDecoration(
                                                                      image: DecorationImage(
                                                                          image: NetworkImage(Api.imageUrl +
                                                                              '${galleryController.galleryData.value[index].image}'),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                      color: Colors
                                                                          .amber,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              20)),
                                                                  // child: Center(child: Text('$index')),
                                                                ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                FixedBottomSwitch(),
                FixedTopNavigation(),
              ],
            );
          }
        })),
      ),
    );
  }
}