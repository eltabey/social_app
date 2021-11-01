class UserModel {
  String name;
  String email;
  String pone;
  String uid;
  String image;
  String cover;
  String bio;
  bool isEmailVerified;

  UserModel({
    this.email,
    this.name,
    this.pone,
    this.uid,
    this.image,
    this.cover,
    this.bio,
    this.isEmailVerified,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    pone = json['pone'];
    uid = json['uid'];
    image = json['image'];
    cover = json['cover'];
    bio = json['bio'];
    isEmailVerified = json['isEmailVerified'];

  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'pone': pone,
      'uid': uid,
      'image': image,
      'cover': cover,
      'bio': bio,
      'isEmailVerified': isEmailVerified,
    };
  }
}
