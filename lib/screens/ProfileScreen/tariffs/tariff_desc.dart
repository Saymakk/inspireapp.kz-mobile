import 'dart:convert';
import 'dart:math';

import 'package:InspireApp/requests/profile/payment_request.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';


class TariffDescription extends StatefulWidget {
  const TariffDescription({Key? key}) : super(key: key);

  @override
  State<TariffDescription> createState() => _TariffDescriptionState();
}

class _TariffDescriptionState extends State<TariffDescription> {
  Map<String, dynamic> tar_desc = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
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
              Get.back();
            },
          ),
          centerTitle: true,
          title: Text(
            'Тариф "${tar_desc['title']}"',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff000000),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        width: double.infinity,
                        child: Image.asset(
                          tar_desc['image'],
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Пакет ',
                            style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '"${tar_desc['title']}"',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      )
                    ],
                  ),
                  IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24.0,
                        vertical: 25,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: tar_desc['description'].length <= 2
                                ? 175
                                : tar_desc['description'].length == 3
                                    ? 220
                                    : tar_desc['description'].length == 4 ? 300 : 440,
                            child: ListView.builder(
                                itemCount: tar_desc['description'].length,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, index) {
                                  return IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              width: 30,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    (index + 1).toString(),
                                                    style: GoogleFonts.poppins(
                                                        color:
                                                            Color(0xff21cac8),
                                                        fontSize: 30),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: 30,
                                        ),
                                        // VerticalDivider(
                                        //   width: 5,
                                        //   color: Colors.blue,
                                        //   thickness: 5,
                                        // ),
                                        Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  .6,
                                              child: Text(
                                                tar_desc['description'][
                                                        'line_' +
                                                            (index + 1)
                                                                .toString()]
                                                    .toString(),
                                                maxLines: 5,
                                                style: GoogleFonts.poppins(
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
                          VerticalDivider(
                            width: 80,
                            thickness: 2,
                            color: Color(0xff21cac8),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      children: [
                        Divider(
                          thickness: 2,
                          color: Color(0xff21cac8),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Стоимость: ',
                                    style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    tar_desc['price'].toString() + ' тенге',
                                    style: GoogleFonts.poppins(
                                        fontSize: 36,
                                        fontWeight: FontWeight.w400,
                                        color: Color(0xff21cac8)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  OutlinedButton(
                    onPressed: () {
                      _paybox(tar_desc);
                    },
                    child: Text('Купить'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white.withOpacity(1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      backgroundColor: Color(0xff21cac8).withOpacity(1),
                      disabledForegroundColor: Color(0xff21cac8).withOpacity(1),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _paybox(Map<String, dynamic> tariff_data) {
    payBoxRequest(tar_desc);
  }


}
