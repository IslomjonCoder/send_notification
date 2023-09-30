class DataModel {
  String title;
  String body;
  String iconCode;
  int timestamp;

  DataModel({
    required this.timestamp,
    required this.title,
    required this.body,
    required this.iconCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
      'iconCode': iconCode,
      'timestamp': timestamp,
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> map) {
    return DataModel(
      title: map['title'] as String? ?? '',
      body: map['body'] as String? ?? "",
      iconCode: map['iconCode'] as String,
      timestamp: map['timestamp'] ?? DateTime.now().millisecondsSinceEpoch,
    );
  }

  DataModel copyWith({
    String? title,
    String? body,
    String? iconCode,
    int? timestamp,
  }) {
    return DataModel(
      title: title ?? this.title,
      body: body ?? this.body,
      iconCode: iconCode ?? this.iconCode,
      timestamp: timestamp ?? this.timestamp,
    );
  }
}
