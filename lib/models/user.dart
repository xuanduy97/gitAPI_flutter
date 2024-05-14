class GitUser{
  String accountName;
  int id;
  String? name;
  String? imageUrl;


  GitUser({required this.accountName,required this.id, this.name, this.imageUrl});

  factory GitUser.fromJson(Map<String,dynamic> json){
    return GitUser(accountName: json["login"], id: json["id"], name: json["name"], imageUrl: json["avatar_url"]);
  }
}