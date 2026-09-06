import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:project_2_faisal/model/catagory_model.dart';
import 'package:project_2_faisal/model/course_model.dart';
import 'package:project_2_faisal/model/details_slug.dart';

class Api {
  String link = "https://tuwaiqapi.vercel.app/api/initiatives";
  ////Catagory
  Future<List<CatagoryModel>> getCatagories() async {
    var uri = Uri.parse(link);

    var response = await http.get(uri);

    var responseBody = response.body;
    var jsonBody = jsonDecode(responseBody);

    List<CatagoryModel> listCatagory = [];

    for (var item in jsonBody["categories"]) {
      CatagoryModel model1 = CatagoryModel.fromJson(item);

      listCatagory.add(model1);
    }
    return listCatagory;
  }

  ////Course
  Future<List<CourseModel>> getData() async {
    var uri = Uri.parse(link);

    var response = await http.get(uri);

    var responseBody = response.body;
    var jsonBody = jsonDecode(responseBody);

    List<CourseModel> listCourse = [];

    for (var item in jsonBody["data"]) {
      CourseModel model2 = CourseModel.fromJson(item);

      listCourse.add(model2);
    }

    return listCourse;
  }

  Future<DetailsSlug> getDetails(String slug) async {
    String link = "https://tuwaiqapi.vercel.app/api/initiatives/$slug";
    var uri = Uri.parse(link);

    var response = await http.get(uri);

    var responseBody = response.body;
    var jsonBody = jsonDecode(responseBody);

    DetailsSlug model3 = DetailsSlug.fromJson(jsonBody);

    return model3;
  }
}
