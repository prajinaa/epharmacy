import 'dart:convert';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:epharmacy/constant/error_handling.dart';
import 'package:epharmacy/constant/global_variables.dart';
import 'package:epharmacy/constant/utils.dart';
import 'package:epharmacy/models/product.dart';
// import 'package:epharmacy/providers/user_provider.dart';
import 'package:epharmacy/providers/user_provider.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/cloudinary_public.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AdminServices{
  void sellProduct({
    required BuildContext context,
    required String name,
    required String description,
    required double price,
    required int quantity,
    required String Composition,
    // requires String Category,
     required List<File> images,

  })async{
      final userProvider = Provider.of<UserProvider>(context, listen: false);

    try{
       final cloudinary = CloudinaryPublic('dmy51rnnh', 'h0v40qsk');
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        // to store in res variable
        CloudinaryResponse res = await cloudinary.uploadFile(
          CloudinaryFile.fromFile(images[i].path, folder: name),
        );
        // upload url
        imageUrls.add(res.secureUrl);
      }


        Product product = Product(
        name: name,
        description: description,
        quantity: quantity,
        // quantity: quantity,
        images: imageUrls,
        composition: composition,
        // category: category,
        price: price,
      );


      http.Response res = await http.post(
        Uri.parse('$uri/admin/add-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        // passing into body ...data what we ne
        body: product.toJson(),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Product Added Successfully!');
          Navigator.pop(context);
        },
      ); }catch(e){
      showSnackBar(context, e.toString());
    }

  }


       // get all the products
      //  list of product--json format ma aaunxa
      // Buildcontext to show sanckbar
  Future<List<Product>> fetchAllProducts(BuildContext context) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    List<Product> productList = [];
    try {
      http.Response res =
          await http.get(Uri.parse('$uri/admin/get-products'), headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': userProvider.user.token,
      });

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          // if not jsonDecode----give like 100 character coz res.body is string
          // jsdon decode will convert into a list format 
          for (int i = 0; i < jsonDecode(res.body).length; i++) {
            productList.add(
              Product.fromJson(
                jsonEncode(
                  jsonDecode(res.body)[i],
                ),
              ),
            );
          }
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
    return productList;
  }

// delete product-----not statesull widget of need onSuccess passed through parameter
   void deleteProduct({
    required BuildContext context,
    required Product product,
    required VoidCallback onSuccess,
  }) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);

    try {
      http.Response res = await http.post(
        Uri.parse('$uri/admin/delete-product'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': userProvider.user.token,
        },
        body: jsonEncode({
          'id': product.id,
        }),
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          onSuccess();
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

   
}