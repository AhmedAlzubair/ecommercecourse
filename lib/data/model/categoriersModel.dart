class CategoriersModel {
  int? categoriersId;
  String? categoriersName;
  String? categoriersNameAr;
  String? categoriersImage;
  String? categoriersDatatime;
  int? categoriersServes;


  CategoriersModel(
      {this.categoriersId,
      this.categoriersName,
      this.categoriersNameAr,
      this.categoriersImage,
      this.categoriersDatatime,
      this.categoriersServes,
      
   
      });

  CategoriersModel.fromJson(Map json) {
    categoriersId = json['categoriers_id'];
    categoriersName = json['categoriers_name'];
    categoriersNameAr = json['categoriers_name_ar'];
    categoriersImage = json['categoriers_image'];
    categoriersDatatime = json['categoriers_datatime'];
    categoriersServes = json['categoriers_serves'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categoriers_id'] = this.categoriersId;
    data['categoriers_name'] = this.categoriersName;
    data['categoriers_name_ar'] = this.categoriersNameAr;
    data['categoriers_image'] = this.categoriersImage;
    data['categoriers_datatime'] = this.categoriersDatatime;
    data['categoriers_serves'] = this.categoriersServes;


    return data;
  }
}
