class CatagoryModel {
  String? name;
  String? image;
  String? details;

  CatagoryModel({this.details, this.image, this.name});

  factory CatagoryModel.fromJson(Map<String, dynamic> json) {
    return CatagoryModel(
      name: json["name"],
      image: json["image"],
      details: json["details"],
    );
  }
}
