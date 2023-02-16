import 'dart:convert';
import 'dart:math';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:crypto/crypto.dart' as crypto;
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

String randomString({int length = 16}) {
  String chars = '0123456789abcdefghijklmnopqrstywxqz';
  var res = '';
  var random = Random();
  while (res.length < length) {
    res += chars[random.nextInt(chars.length)];
  }
  return res;
}

Future<void> payBoxRequest(Map<String, dynamic> tar_desc) async {
  final Uri url = Uri.parse('https://api.paybox.money/init_payment.php');
  var request = http.MultipartRequest('POST', url);

  print(tar_desc['title']);
  String title = tar_desc['title'];

  var pg_merchant_id = 548205;
  var secret_key = 'UNgrC1gDv6jGgQ8x';
  var randomStr = randomString();
  var requestForSignature = [
    request.fields['pg_amount'] = tar_desc['price'].toString(),
    request.fields['pg_description'] = 'Покупка курса "$title"',
    request.fields['pg_merchant_id'] = pg_merchant_id.toString(),
    request.fields['pg_order_id'] = tar_desc['id'].toString(),
    request.fields['pg_salt'] = randomStr,
  ];

  Map pgElements = {
    'pg_order_id': tar_desc['id'].toString(),
    'pg_merchant_id': pg_merchant_id.toString(),
    'pg_amount': tar_desc['price'].toString(),
    'pg_description': 'Покупка курса "$title"',
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