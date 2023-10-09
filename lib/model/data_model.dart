class data_model {
  String? type;
  String? title;
  List<Items>? items;

  data_model({this.type, this.title, this.items});

  data_model.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    title = json['title'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['title'] = this.title;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? type;
  String? text;
  String? image;

  Items({this.type, this.text, this.image});

  Items.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    text = json['text'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['text'] = this.text;
    data['image'] = this.image;
    return data;
  }
}
