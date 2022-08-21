import 'dart:convert';


import 'package:epharmacy/constant/utils.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
// import 'package:EPHARMACY/lib/constant/utils.dart';

void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required VoidCallback onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      // response . body lae we need to decode...coz that is not string
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['error']);
      break;
    default:
      showSnackBar(context, response.body);
  }
}