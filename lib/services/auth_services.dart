// import 'dart:html';
// import 'dart:js';
// import 'lib.dart';

import 'package:flutter/cupertino.dart';
import 'package:epharmacy/constant/error_handling.dart';
import 'package:epharmacy/constant/global_variables.dart';
import 'package:epharmacy/constant/utils.dart';
import 'package:epharmacy/models/user.dart';
import 'package:http/http.dart' as http;
// allow make api reques

class AuthService {
  // sign up user..
//  function
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

          http.Response res= await http.post(
             Uri.parse('$uri/api/signup'),
             body:user.toJson(),
             headers:<String,String>{
                'Content-Type':'application/json;charset=UTF-8',
             },
          );
          httpErrorHandle(
  response:res,
  context:context,
  onSuccess:(){
    showSnackBar(context, 
    'Account created!Login with the same credentials!',
    );
  },
          );
                    
       } catch (e) {
        showSnackBar(context, e.toString());
       }
  }
}
