class OrganizationModel {
  int? orgenizationId;
  String? orgenizationName;
  String? orgenizationNameAr;
  String? orgenizationImage;
    String? orgenizationCity;
    String? orgenizationCityAr;
  String? orgenizationStreet;
  String? orgenizationLat;
  String? orgenizationLong;

  OrganizationModel(
      {this.orgenizationId, this.orgenizationName, this.orgenizationNameAr, this.orgenizationImage});

  OrganizationModel.fromJson(Map json) {
    orgenizationId = json['orgenization_id'];
    orgenizationName = json['orgenization_name'];
    orgenizationNameAr = json['orgenization_name_ar'];
    orgenizationImage = json['orgenization_image'];
    orgenizationCity = json['orgenization_city'];
    orgenizationCityAr = json['orgenization_city_ar'];
    orgenizationStreet = json['orgenization_street'];
    orgenizationLat = json['orgenization_lat'].toString();
    orgenizationLong = json['orgenization_long'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orgenization_id'] = this.orgenizationId;
    data['orgenization_name'] = this.orgenizationName;
    data['orgenization_name_ar'] = this.orgenizationNameAr;
    data['orgenization_image'] = this.orgenizationImage;
    return data;
  }
}