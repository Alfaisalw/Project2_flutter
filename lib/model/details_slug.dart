class DetailsSlug {
  String? title;
  String? descripton;
  String? goals;
  String? features;
  String? requirements;
  String? startDate;
  String? endDate;

  DetailsSlug({
    this.descripton,
    this.features,
    this.goals,
    this.title,
    this.requirements,
  this.startDate , this.endDate
  
  });

  factory DetailsSlug.fromJson(Map<String, dynamic> json) {
    return DetailsSlug(
      title: json["title"],
      descripton: json["descripton"],

      goals: json["goals"],
      features: json["features"],

      requirements: json["requirements"],
      startDate: json["startDate"]?? "Not found", endDate: json["endDate"]?? "Not found",


    );
  }
}
