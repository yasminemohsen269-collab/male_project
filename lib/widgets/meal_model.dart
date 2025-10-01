class Meal {
  final String imageUrl;
  final String title;
  final String description;
  final String time;
  final double rate;
  Meal({
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.time,
    required this.rate,
  });

  //عايزين نحولهم لmap
  Map<String, dynamic> toMap() {
    return {
      "imageUrl": imageUrl,
      "title": title,
      "description": description,
      "time": time,
      "rate": rate,
    };
  }

  //عشان احول لمودل واطلب مثلا من الداتا بيز قيمه معينه
  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      imageUrl: map["imageUrl"],

      title: map["title"],
      description: map["description"],
      time: map["time"],
      rate: (map["rate"] as num).toDouble(),
    );
  }
}
