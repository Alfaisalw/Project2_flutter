class DetailsSlug {
  String? title;
  String? description;
  String? goals;
  String? features;
  String? requirements;
  String? startDate;
  String? endDate;
  String ? startTimeText;
  String ? endTimeText;
  String ? locationText;

  DetailsSlug({
    this.description,
    this.features,
    this.goals,
    this.title,
    this.requirements,
    this.startDate,
    this.endDate,
    this.startTimeText
    ,this.endTimeText
    ,this.locationText
  });

  factory DetailsSlug.fromJson(Map<String, dynamic> json) {
    String? convertListToString(dynamic jsonList) {
      if (jsonList == null) return null;
      if (jsonList is List) {
        return jsonList.map((item) => "• $item").join("\n\n");
      }
      return jsonList.toString();
    }

    return DetailsSlug(
      title: json["title"],
      description: json["description"],

      goals: convertListToString(json["goals"]),
      features: convertListToString(json["features"]),
      requirements: convertListToString(json["requirements"]),
      startDate: json["startDateText"] ?? "Not found",
      endDate: json["endDateText"] ?? "Not found",
      startTimeText: json["startTimeText"] ?? "Not found",
      endTimeText: json["endDateText"] ?? "NNot found",
      locationText: json["locationText"]?? "Not found"


    );
  }
}
