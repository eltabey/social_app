class PostModel {
  String name;
  String uid;
  String image;
  String dateTime;
  String text;
  String postImage;

  PostModel({
    this.name,
    this.uid,
    this.image,
    this.postImage,
    this.dateTime,
    this.text,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uid = json['uid'];
    image = json['image'];
    postImage = json['postImage'];
    dateTime = json['dateTime'];
    text = json['text'];
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'uid': uid,
      'image': image,
      'postImage': postImage,
      'dateTime': dateTime,
      'text': text,
    };
  }
}
