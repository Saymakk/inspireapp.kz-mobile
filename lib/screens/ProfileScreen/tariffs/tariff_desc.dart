import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
            'Тариф',
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
                        vertical: 20,
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: tar_desc['description'].length <= 3
                                ? 270
                                : tar_desc['description'].length == 4
                                    ? 350
                                    : 450,
                            child: ListView.builder(
                                itemCount: tar_desc['description'].length,
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
    payBoxRequest();
  }

  String randomString({int length = 16}) {
    String chars = '0123456789abcdefghijklmnopqrstywxqz';
    var res = '';
    var random = Random();
    while (res.length < length) {
      res += chars[random.nextInt(chars.length)];
    }
    return res;
  }

  Future<void> payBoxRequest() async {
    final Uri url = Uri.parse('https://api.paybox.money/init_payment.php');
    var request = http.MultipartRequest('POST', url);

    var pg_merchant_id = 548205;
    var secret_key = 'UNgrC1gDv6jGgQ8x';
    var randomStr = randomString();
    var requestForSignature = [
      request.fields['pg_amount'] = tar_desc['price'].toString(),
      request.fields['pg_description'] = 'Покупка курса',
      request.fields['pg_merchant_id'] = pg_merchant_id.toString(),
      request.fields['pg_order_id'] = tar_desc['id'].toString(),
      request.fields['pg_salt'] = randomStr,
    ];

    Map pgElements = {
      'pg_order_id': tar_desc['id'].toString(),
      'pg_merchant_id': pg_merchant_id.toString(),
      'pg_amount': tar_desc['price'].toString(),
      'pg_description': 'Покупка курса',
      'pg_salt': randomStr
    };

    Map<String, dynamic> signedParams(String url, requestForSignatureMap,
        requestForSignature, String secretKey) {
      var sorted = Map<String, dynamic>();
      var paths = url.split('/');
      var sig = paths.last;
      var keysList = requestForSignatureMap.keys.toList();

      keysList.sort();

      for (var key in keysList) {
        // print('${requestForSignatureMap[key]}');
        sig += ';';
        sig += "${requestForSignatureMap[key]}";
        sorted[key] = requestForSignatureMap[key];
      }
      sig += ";$secretKey";

      sorted['pg_sig'] = crypto.md5.convert(utf8.encode(sig)).toString();
      return sorted;
    }

    var sig = signedParams('https://api.paybox.money/init_payment.php',
        pgElements, requestForSignature, secret_key);

    request.fields['pg_sig'] = sig['pg_sig'].toString();
    //
    // print('${sig}');
    print(request.fields);

    var response = await request.send();

    var responsed = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      dynamic data = responsed.body;

      String paymentLink = data.substring(131, 211);

      await Hive.box('db').delete('paymentLink');
      await Hive.box('db').put('paymentLink', paymentLink);

      print('payBoxRequests ${Hive.box('db').get('paymentLink')}');

      final Uri _url = Uri.parse(Hive.box('db').get('paymentLink').toString());

      if (_url != '') {
        (await launchUrl(_url));
      }
      // return data;
    } else {
      throw Exception('Failed.');
    }
  }
}
