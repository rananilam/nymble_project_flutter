class main_banner_model {
  String? type;
  String? image;
  String? headerText;
  String? footerText;
  bool? footerIcon;

  main_banner_model(
      {this.type,
        this.image,
        this.headerText,
        this.footerText,
        this.footerIcon});

  main_banner_model.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    image = json['image'];
    headerText = json['header_text'];
    footerText = json['footer_text'];
    footerIcon = json['footer_icon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['image'] = this.image;
    data['header_text'] = this.headerText;
    data['footer_text'] = this.footerText;
    data['footer_icon'] = this.footerIcon;
    return data;
  }
}
