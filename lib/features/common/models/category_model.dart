import 'package:get/get.dart';

class CategoryModel extends GetxController {
  final String id;
  final String title;
  final String iconUrl;

  CategoryModel({required this.id, required this.title, required this.iconUrl});

  factory CategoryModel.fromJson(Map<String, dynamic> jsonData) {
    return CategoryModel(
        id: jsonData['_id'],
        title: jsonData['title'],
        iconUrl: jsonData['icon']);
  }
}
 
 
 
                // "_id": "6812518cea40bfc6edc67356",
                // "title": "Apply",
                // "slug": "apply",
                // "description": "Apply Device",
                // "icon": "https://cdn-icons-png.flaticon.com/256/0/747.png",
                // "parent": null,
                // "createdAt": "2025-04-30T16:36:28.476Z",
                // "updatedAt": "2025-04-30T16:36:28.476Z",
                // "__v": 0