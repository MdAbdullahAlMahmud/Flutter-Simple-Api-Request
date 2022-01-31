import 'dart:convert';



class User {
  User({
    this.userId,
    this.id,
    this.title,
    this.completed,
  });
  List<User> userFromJson(String str) => List<User>.from(json.decode(str).map((x) => User.fromJson(x)));

  String userToJson(List<User> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  int userId;
  int id;
  String title;
  bool completed;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    completed: json["completed"],
  );

  Map<String, dynamic> toJson() => {
    "userId": userId,
    "id": id,
    "title": title,
    "completed": completed,
  };
}
