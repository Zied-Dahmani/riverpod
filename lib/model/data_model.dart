class DataModel {
  int id, userId;
  String title, body;

  DataModel(this.id, this.userId, this.title, this.body);

  DataModel.fromMap(Map<String, dynamic> map)
      : title = map['title'],
        id = map['id'],
        userId = map['userId'],
        body = map['body'];

  Map toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }
}
