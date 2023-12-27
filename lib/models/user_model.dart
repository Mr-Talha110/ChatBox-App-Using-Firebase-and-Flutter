class UserModel {
  final String? name;
  final String? imageUrl;
  UserModel({this.name, this.imageUrl});
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json["name"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "imageUrl": imageUrl,
      };
}
