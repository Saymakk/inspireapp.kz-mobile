import 'package:InspireApp/requests/lists/cities_list_request.dart';
import 'package:InspireApp/requests/profile/profile_init.dart';
import 'package:InspireApp/screens/ProfileScreen/tariffs/tariff_desc.dart';
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/invited_users/invited_users_request.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_settings/profile_settings.dart';
import 'package:InspireApp/screens/welcome_screen.dart';
import 'package:skeletons/skeletons.dart';
import 'package:translit/translit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GetStorage user = GetStorage();

  int code = Get.arguments[0];
  String name = Get.arguments[1];
  String? desc = Get.arguments[2];
  String phone = Get.arguments[3];
  String? photo = Get.arguments[4];
  bool active = false;
  GetStorage auth = GetStorage();

  String name_letter = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    name_letter = Translit()
        .toTranslit(source: Hive.box('mybox').get('name').substring(0, 1));
    Hive.box('mybox').put('photo2', name_letter);
    print(name_letter);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          titleSpacing: 0,
          backgroundColor: Colors.white,
          shadowColor: null,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff000000),
            ),
            onPressed: () {
              Get.off(() => BottomNav(), transition: Transition.leftToRight);
            },
          ),
          title: Text(
            'Профиль',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 5, right: 24.0),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    active = true;
                  });
                  Future.delayed(Duration(seconds: 5)).then((_) {
                    setState(() {
                      active = false;
                    });
                  });
                  await citiesListRequest();
                  await userActivitiesInit();
                  await profileRequestInit();
                  Get.to(
                    () => ProfileSettingsScreen(),
                    transition: Transition.rightToLeft,
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Stack(
                    children: [
                      SvgPicture.asset('assets/icons/settings_button.svg'),
                      Visibility(
                        visible: active,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 45),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          // print(Get.arguments[4]);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 25),
                          height: 96,
                          width: 96,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Color(0xFFD9DCDD),
                          ),
                          child: (Hive.box('mybox').get('photo') == null) ^
                                  (Hive.box('mybox').get('photo') ==
                                      'https://ui-avatars.com/api/?name=${Translit().toTranslit(source: Hive.box('mybox').get('name').substring(0, 1))}&color=7F9CF5&background=EBF4FF')
                              ? Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Image.asset(
                                    Const.icns + 'add_photo.png',
                                  ),
                                )
                              : ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.network(
                                    '${Hive.box('mybox').get('photo').toString()}',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 11),
                                width: MediaQuery.of(context).size.width / 2.7,
                                child: Text(
                                  Hive.box('mybox').get('name'),
                                  softWrap: true,
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22,
                                      height: 1.15,
                                    ),
                                  ),
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () async {
                                  final copied = await ClipboardData(
                                    text: code.toString(),
                                  );
                                  Clipboard.setData(copied);
                                  if (copied.text != '') {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                            content: Text(
                                      'Вы скопировали код! Поделитесь им с вашими друзьями',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )));
                                  }
                                  // print(copied.text);
                                },
                                child: Container(
                                  padding: EdgeInsets.only(left: 18, right: 18),
                                  width: 143,
                                  height: 34,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Color(0xffe5ebed),
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        code.toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 19,
                                            color: Color(0xff21cac8),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 15),
                                        child: SizedBox(
                                          width: 16,
                                          height: 16,
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.copy,
                                              size: 16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                TariffsList(),
                Container(
                  margin: EdgeInsets.only(bottom: 38),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          children: [
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        user.read('meditation').toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff21cac8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Прослушанные медитации',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Flexible(
                              child: Container(
                                padding: EdgeInsets.only(left: 16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        user.read('affirmations').toString(),
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontSize: 38,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff21cac8),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        'Закрепленные аффирмации',
                                        textAlign: TextAlign.start,
                                        maxLines: 2,
                                        style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(left: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      user.read('courses').toString(),
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff21cac8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Пройденные мини-курсы',
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            child: Container(
                              padding: EdgeInsets.only(
                                left: 16,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      user.read('invited_users').toString(),
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 38,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff21cac8),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      'Приглашенные пользователи',
                                      textAlign: TextAlign.start,
                                      maxLines: 2,
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 23),
                  child: Text(
                    'Приглашенные пользователи',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      height: 1.15,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    FutureBuilder(
                      future: invitedUsersRequest(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        switch (snapshot.connectionState) {
                          case ConnectionState.none:
                            return Container(
                              margin: EdgeInsets.only(
                                top: 24,
                                right: 15,
                              ),
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                  height: 150,
                                  width: 259,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                            );
                          case ConnectionState.waiting:
                            return Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 15,
                                    bottom: 10,
                                  ),
                                  child: SkeletonLine(
                                    style: SkeletonLineStyle(
                                      height: 24,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 15,
                                    bottom: 10,
                                  ),
                                  child: SkeletonLine(
                                    style: SkeletonLineStyle(
                                      height: 24,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    right: 15,
                                    bottom: 10,
                                  ),
                                  child: SkeletonLine(
                                    style: SkeletonLineStyle(
                                      height: 24,
                                      width: double.infinity,
                                    ),
                                  ),
                                ),
                              ],
                            );

                          default:
                            // return rideList(snapshot.data, context);
                            print(snapshot.data.length);
                            // return CoursesWidget(snapshot.data, context);
                            if (snapshot.data.length < 1) {
                              return Container(
                                width: 320,
                                padding: EdgeInsets.only(
                                  left: 19,
                                  right: 19,
                                  top: 13.5,
                                  bottom: 10.5,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFEE3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    Const.icns + '!.png',
                                    height: 37,
                                    color: Color(0xffFFDD65),
                                  ),
                                  title: Text(
                                    'Приглашённых пользователей пока нет',
                                    maxLines: 4,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Const.deepgrey,
                                    ),
                                  ),
                                ),
                              );
                            } else {
                              return InvitedUsersWidget(
                                snapshot.data,
                                context,
                              );
                            }
                        }
                      },
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 38,
                    ),
                    child: GestureDetector(
                      onTap: () async {
                        await auth.remove('token');
                        await Hive.box('mybox').delete(0);
                        Get.offAll(() => WelcomeScreen());
                      },
                      child: Container(
                        width: 165,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Color(0xff21cac8),
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            'Выйти',
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w100,
                                color: Color(0xff21cac8),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
        ),
      ),
    );
  }

  int i = 1;

  Widget InvitedUsersWidget(List items, context) {
    return Column(
      children: items.map<Widget>(
        (invited) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 18),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text(
                        invited.id.toString(),
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.65,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: SizedBox(
                        width: 22.5,
                        height: 22.5,
                        child: Image.asset('assets/images/icon.png'),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        invited.full_name,
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          height: 1.65,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    invited.isActive != ''
                        ? Container(
                            height: 24,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff21cac8),
                            ),
                            child: Center(
                              child: Text(
                                'Активный',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  height: 1.45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        : Container(
                            height: 24,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xff282828),
                            ),
                            child: Center(
                              child: Text(
                                'Неактивный',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 11,
                                  height: 1.45,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                  ],
                ),
              ),
            ],
          );
        },
      ).toList(),
    );
  }

  Widget TariffsList() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        children: [
          Row(
            children: [
              Title(
                color: Colors.black,
                child: Text(
                  'Тарифы',
                  softWrap: true,
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 22,
                      height: 1.15,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: tariffs.length,
              itemBuilder: (BuildContext context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Container(
                        child: Stack(
                          alignment: Alignment.bottomLeft,
                          children: [
                            Image.asset(
                              tariffs[index]['icon'].toString(),
                              fit: BoxFit.fill,
                            ),
                            Positioned(
                              left: 5,
                              bottom: 5,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Пакет',
                                    maxLines: 3,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        height: 1.15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '"${tariffs[index]['title'].toString()}"',
                                    maxLines: 3,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        height: 1.15,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Color(0xff21cac8).withOpacity(1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          backgroundColor: Color(0xff282828),
                          disabledForegroundColor:
                              Color(0xff21cac8).withOpacity(1),
                        ),
                        onPressed: () {
                          Get.to(
                            () => TariffDescription(),
                            transition: Transition.rightToLeft,
                            arguments: tariffs[index],
                          );
                        },
                        child: Text(
                          'Подробнее',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<dynamic> tariffs = [
    {
      "id": 1,
      "title": "Base",
      "icon": "assets/images/tarif1.png",
      "image": "assets/images/banner1.png",
      "description": {
        "line_1": "Доступ на 12 месяцев к приложению Inspire App",
        "line_2":
            "Плановые ZOOM встречи:\n1) По продажам\n2) По маркетингу\n3) Театр продаж",
      },
      "price": 100000,
      "to_buy": "link_to_buy"
    },
    {
      "id": 2,
      "title": "Осознанная",
      "icon": "assets/images/tarif2.png",
      "image": "assets/images/banner1.png",
      "description": {
        "line_1": "Доступ на 12 месяцев к приложению Inspire App",
        "line_2": "Доступ к курсу «Изобильная Женщина»",
        "line_3":
            "Плановые ZOOM встречи:\n1) По продажам\n2) По маркетингу\n3) Театр продаж\n4) По Изобильной женщине",
      },
      "price": 250000,
      "to_buy": "link_to_buy"
    },
    {
      "id": 3,
      "title": "Ресурсная",
      "icon": "assets/images/tarif3.png",
      "image": "assets/images/banner1.png",
      "description": {
        "line_1": "Доступ на 12 месяцев к приложению Inspire App",
        "line_2": "Доступ к курсу «Изобильная Женщина»",
        "line_3": "Доступ к курсу «Личный Бренд»",
        "line_4":
            "Плановые ZOOM встречи:\n1) По продажам\n2) По маркетингу\n3) Театр продаж\n4) По Изобильной женщине\n5) По Личному бренду",
      },
      "price": 500000,
      "to_buy": "link_to_buy"
    },
    {
      "id": 4,
      "title": "Успешная",
      "icon": "assets/images/tarif4.png",
      "image": "assets/images/banner1.png",
      "description": {
        "line_1": "Доступ на 12 месяцев к приложению Inspire App",
        "line_2": "Доступ к курсу «Изобильная Женщина»",
        "line_3": "Доступ к курсу «Личный Бренд»",
        "line_4": "Доступ к курсу «Продюсер Личных Брендов»",
        "line_5": "Доступ к курсу «Миллион в сетевом»",
        "line_6":
        "Плановые ZOOM встречи:\n1) По продажам\n2) По маркетингу\n3) Театр продаж\n4) По Изобильной женщине\n5) По Личному бренду",
      },
      "price": 1000000,
      "to_buy": "link_to_buy"
    }
  ];
}
