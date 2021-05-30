class Menu{
  String name;
  String description;
  String imageurl;
  String price;
  String bannerimage;

  Menu({this.name,this.description,this.imageurl,this.price,this.bannerimage});

  factory Menu.fromJson(Map<String, dynamic> json){
    return Menu(
      name: json['name'],
      description: json['description'],
      imageurl: json['imageurl'],
      price: json['price'],
      bannerimage: json['bannerimage']
    );
  }
}