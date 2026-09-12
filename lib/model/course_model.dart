class CourseModel {
  String? title;

  bool? isOpen;

  String? image;

  String? slug;
  String? startDate;

  String? type; //معسكر او برنامج

  String? scopeName; //التنصيف  ai ....

  CourseModel({
    this.image,
    this.isOpen,

    this.scopeName,
    this.slug,

    this.title,
    this.type,
    
    this.startDate
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) {
    return CourseModel(
      title: json["title"] ?? "Not found",

      isOpen: json["isOpen"] == true,

      image: json["outerImage"] ?? "Not found",

      slug: json["slug"] ?? "Not found",

      scopeName: json["initiativeScopeName"] ?? "Not found",

      type: json["initiativeCategoryName"] ?? "Not found",
      
      startDate: json["startDate"] ?? "Not found",

    );
  }
}
