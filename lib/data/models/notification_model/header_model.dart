class HeaderModel {
  String title;
  String body;

  HeaderModel({
    required this.title,
    required this.body,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'body': body,
    };
  }

  factory HeaderModel.fromJson(Map<String, dynamic> map) {
    return HeaderModel(
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }

  HeaderModel copyWith({
    String? title,
    String? body,
  }) {
    return HeaderModel(
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
