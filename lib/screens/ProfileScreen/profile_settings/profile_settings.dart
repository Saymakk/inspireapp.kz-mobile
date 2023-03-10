import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:InspireApp/model/cities_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/lists/country_list_request.dart';
import 'package:InspireApp/requests/profile/profile_delete.dart';
import 'package:InspireApp/requests/profile/profile_settings_requests.dart';
import 'package:InspireApp/screens/registration/registering_screen.dart';
import 'package:InspireApp/screens/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';
import 'package:skeletons/skeletons.dart';

import '../../../requests/lists/cities_list_request.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  GetStorage lists = GetStorage();

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        maxWidth: 720,
        maxHeight: 480,
        imageQuality: 100,
      );
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed $e');
    }
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  dynamic selected_city = (Hive.box('mybox').get('city_id') != null
      ? Hive.box('mybox').get('city_id')
      : '1');
  dynamic selected_country;

  bool country_list = false;
  bool city_list = false;
  bool active = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        child: Scaffold(
          backgroundColor: Color(0xffffffff),
          appBar: PreferredSize(
              preferredSize: Size(
                MediaQuery.of(context).size.width,
                MediaQuery.of(context).size.height * .1,
              ),
              child: profileAppBar()),
          body: SingleChildScrollView(
            child: Container(
              padding:
                  EdgeInsets.only(top: 26, bottom: 24, left: 20, right: 23),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 33),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () => pickImage(ImageSource.camera),
                          child: image == null
                              ? Container(
                                  child: Container(
                                    margin: EdgeInsets.all(24),
                                    child: SvgPicture.asset(
                                      Const.icns + 'add_photo.svg',
                                      width: 48,
                                      height: 48,
                                    ),
                                  ),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      color: Color(0xffD9DCDD)),
                                )
                              : Container(
                                  child: Image.file(
                                    image!,
                                    width: 80,
                                    height: 80,
                                  ),
                                ),
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 30,
                              height: 43,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xffF7FAFB),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xffDEECEC))),
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  controller:
                                      Hive.box('mybox').get('name') != null
                                          ? (nameController
                                            ..text = Hive.box('mybox')
                                                .get('name')
                                                .toString())
                                          : nameController,
                                  decoration: InputDecoration(
                                      hintText: '??????',
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffAFC5CC),
                                          height: 1.645)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2 + 30,
                              height: 43,
                              margin: EdgeInsets.only(left: 10),
                              decoration: BoxDecoration(
                                  color: Color(0xffF7FAFB),
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(color: Color(0xffDEECEC))),
                              child: Container(
                                margin: EdgeInsets.only(left: 20),
                                child: TextFormField(
                                  controller:
                                      Hive.box('mybox').get('last_name') != null
                                          ? (lastNameController
                                            ..text = Hive.box('mybox')
                                                .get('last_name')
                                                .toString())
                                          : lastNameController,
                                  decoration: InputDecoration(
                                      hintText: '??????????????',
                                      border: InputBorder.none,
                                      hintStyle: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xffAFC5CC),
                                          height: 1.645)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xfff7fafb)),
                    child: Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                city_list = !city_list;
                              });
                            },
                            child: Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    Hive.box('db').get('list')[
                                                selected_city - 1]['title'] ==
                                            null
                                        ? '??????????'
                                        : Hive.box('db')
                                                .get('list')[selected_city - 1]
                                            ['title'],
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                      height: 1.645,
                                    ),
                                  ),
                                  SvgPicture.asset(city_list == false
                                      ? 'assets/icons/button_down.svg'
                                      : 'assets/icons/button_up.svg'),
                                ],
                              ),
                            ),
                          ),
                          Visibility(
                            visible: city_list,
                            // child: FutureBuilder<List>(
                            //   future: citiesListRequest(),
                            //   builder: (BuildContext context,
                            //       AsyncSnapshot snapshot) {
                            //     switch (snapshot.connectionState) {
                            //       case ConnectionState.none:
                            //         return Container(
                            //           padding: EdgeInsets.only(top: 10),
                            //           child: SkeletonLine(
                            //             style: SkeletonLineStyle(
                            //                 height: 48,
                            //                 width: double.infinity,
                            //                 borderRadius:
                            //                     BorderRadius.circular(8)),
                            //           ),
                            //         );
                            //       case ConnectionState.waiting:
                            //         return Column(
                            //           children: [
                            //             Container(
                            //               padding: EdgeInsets.only(top: 10),
                            //               child: SkeletonLine(
                            //                 style: SkeletonLineStyle(
                            //                     height: 48,
                            //                     width: double.infinity,
                            //                     borderRadius:
                            //                         BorderRadius.circular(8)),
                            //               ),
                            //             ),
                            //             Container(
                            //               padding: EdgeInsets.only(top: 10),
                            //               child: SkeletonLine(
                            //                 style: SkeletonLineStyle(
                            //                     height: 48,
                            //                     width: double.infinity,
                            //                     borderRadius:
                            //                         BorderRadius.circular(8)),
                            //               ),
                            //             ),
                            //             Container(
                            //               padding: EdgeInsets.only(top: 10),
                            //               child: SkeletonLine(
                            //                 style: SkeletonLineStyle(
                            //                     height: 48,
                            //                     width: double.infinity,
                            //                     borderRadius:
                            //                         BorderRadius.circular(8)),
                            //               ),
                            //             ),
                            //           ],
                            //         );
                            //
                            //       default:
                            //         // return rideList(snapshot.data, context);
                            //
                            //         return CityListWidget(
                            //             snapshot.data, context);
                            //     }
                            //   },
                            // ),
                            child: Column(
                              children: [
                                Container(
                                    margin: EdgeInsets.only(top: 10),
                                    child: ListView.builder(
                                        physics: NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount:
                                            Hive.box('db').get('list').length,
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selected_city = Hive.box('db')
                                                    .get('list')[index]['id'];
                                              });
                                              print(selected_city);
                                            },
                                            child: Container(
                                                margin:
                                                    EdgeInsets.only(top: 10),
                                                decoration: BoxDecoration(
                                                    color: selected_city ==
                                                            Hive.box('db').get(
                                                                    'list')[
                                                                index]['id']
                                                        ? Color(0xff21cac8)
                                                        : Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8)),
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 10),
                                                  child: Text(
                                                    Hive.box('db')
                                                            .get('list')[index]
                                                        ['title'],
                                                    style: selected_city ==
                                                            Hive.box('db').get(
                                                                    'list')[
                                                                index]['id']
                                                        ? GoogleFonts.poppins(
                                                            fontSize: 14,
                                                            color: Colors.white)
                                                        : GoogleFonts.poppins(
                                                            fontSize: 14,
                                                            color:
                                                                Colors.black),
                                                  ),
                                                )),
                                          );
                                        })),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 168,
                    margin: EdgeInsets.only(
                      bottom: 30,
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                        color: Color(0xfff7fafb),
                        border: Border.all(color: Color(0xffDEECEC)),
                        borderRadius: BorderRadius.circular(8)),
                    child: TextFormField(
                      controller: Hive.box('mybox').get('description') != null
                          ? (descController
                            ..text =
                                Hive.box('mybox').get('description').toString())
                          : descController,
                      maxLines: 6,
                      decoration: InputDecoration(
                        hintText: '?? ??????',
                        hintStyle: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xffAFC5CC),
                            height: 1.645),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        active = true;
                      });
                      Future.delayed(Duration(seconds: 5)).then((_) {
                        setState(() {
                          active = false;
                        });
                      });

                      print(descController.text);
                      Hive.box('mybox').put(
                        'last_name',
                        lastNameController.text,
                      );
                      nameController.text == '' ||
                              lastNameController.text == '' ||
                              selected_city == null
                          ?
                          // descController.text == '' ||
                          // image!.path == null
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '?????????????????????? ?????????????? ??????, ?????????????? ?? ??????????!',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          : userUpdateRequest(
                              nameController!.text,
                              lastNameController!.text,
                              selected_city!,
                              descController!.text,
                              image,
                            );
                    },
                    /** !!! ???????????????? ?????????????? ???? ???????????????????????????? ???????????????? !!! **/
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Color(0xff21cac8)),
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width * .5,
                        // margin:
                        //     EdgeInsets.symmetric( horizontal: 48),
                        child: Center(
                          child: Stack(
                            children: [
                              Visibility(
                                visible: !active,
                                child: Text(
                                  '??????????????????',
                                  style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white),
                                ),
                              ),
                              Visibility(
                                visible: active,
                                child: CircularProgressIndicator(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //
                  //     // SizedBox(
                  //     //   width: 4,
                  //     // ),
                  //     // Container(
                  //     //   decoration: BoxDecoration(
                  //     //       border: Border.all(color: Color(0xff21cac8)),
                  //     //       borderRadius: BorderRadius.circular(8),
                  //     //       color: Colors.white),
                  //     //   child: Container(
                  //     //     margin: EdgeInsets.symmetric(
                  //     //       vertical: 9,
                  //     //       horizontal: 56,
                  //     //     ),
                  //     //     child: Text(
                  //     //       '??????????',
                  //     //       style: GoogleFonts.poppins(
                  //     //           fontSize: 14,
                  //     //           fontWeight: FontWeight.w600,
                  //     //           color: Color(0xff21cac8)),
                  //     //     ),
                  //     //   ),
                  //     // ),
                  //   ],
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Widget CountryListWidget(List items, context) {
  //   return Column(
  //     children: items.map<Widget>(
  //       (country) {
  //         return Column(
  //           children: [
  //             Container(
  //                 margin: EdgeInsets.only(top: 10),
  //                 child: ListView.builder(
  //                     physics: NeverScrollableScrollPhysics(),
  //                     shrinkWrap: true,
  //                     itemCount: 1,
  //                     itemBuilder: (context, index) {
  //                       return GestureDetector(
  //                         onTap: () {
  //                           print(country.id);
  //                           setState(() {
  //                             selected_country = country.id;
  //                           });
  //                           print(selected_country);
  //                         },
  //                         child: Container(
  //                             margin: EdgeInsets.only(top: 10),
  //                             decoration: BoxDecoration(
  //                                 color: selected_country == country.id
  //                                     ? Color(0xff21cac8)
  //                                     : Colors.white,
  //                                 borderRadius: BorderRadius.circular(8)),
  //                             child: Container(
  //                               margin: EdgeInsets.symmetric(
  //                                   vertical: 5, horizontal: 10),
  //                               child: Text(
  //                                 country.title,
  //                                 style: selected_city == country.id
  //                                     ? GoogleFonts.poppins(
  //                                         fontSize: 14, color: Colors.white)
  //                                     : GoogleFonts.poppins(
  //                                         fontSize: 14, color: Colors.black),
  //                               ),
  //                             )),
  //                       );
  //                     })),
  //           ],
  //         );
  //       },
  //     ).toList(),
  //   );
  // }

  Widget profileAppBar() {
    return AppBar(
      titleSpacing: 0,
      backgroundColor: Colors.white,
      shadowColor: null,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Color(0xff000000)),
        onPressed: () {
          Get.back();
        },
      ),
      title: GestureDetector(
        // onTap: () => citiesListRequest(),
        child: Text(
          '??????????????????',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000)),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.defaultDialog(
              title: '???????????????? ????????????????',
              content: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('???? ?????????????????????????? ???????????? ?????????????? ???????????????'),
                  ],
                ),
              ),
              confirm: TextButton(
                onPressed: () => profile_delete(),
                child: Text(
                  '????',
                  style: TextStyle(color: Colors.red),
                ),
              ),
              cancel: TextButton(
                onPressed: () {},
                child: Text('??????'),
              ),
            );
          },
          icon: Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
          tooltip: '?????????????? ??????????????',
        )
      ],
    );
  }

  Widget CityListWidget(List items, context) {
    return Column(
      children: items.map<Widget>(
        (city) {
          return Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            print(city.id);
                            setState(() {
                              selected_city = city.id;
                            });
                            print(selected_city);
                          },
                          child: Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  color: selected_city == city.id
                                      ? Color(0xff21cac8)
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 10),
                                child: Text(
                                  city.title,
                                  style: selected_city == city.id
                                      ? GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white)
                                      : GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.black),
                                ),
                              )),
                        );
                      })),
            ],
          );
        },
      ).toList(),
    );
  }
}
