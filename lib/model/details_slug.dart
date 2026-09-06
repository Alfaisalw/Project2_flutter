class DetailsSlug {
  String? title;
  String? description;
  String? goals;
  String? features;
  String? requirements;
  String? startDate;
  String? endDate;

  DetailsSlug({
    this.description,
    this.features,
    this.goals,
    this.title,
    this.requirements,
    this.startDate,
    this.endDate,
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
      startDate: json["startDate"] ?? "Not found",
      endDate: json["endDate"] ?? "Not found",
    );
  }
}
