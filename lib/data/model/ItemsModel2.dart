class ItemsModel2 {
  int? productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? productImage;
  String? productCount;
  String? productActive;
  String? productPrice;
  String? productDiscount;
  String? productData;
  int? productCat;
  String? productType;
  int? categoriersId;
  String? categoriersName;
  String? categoriersNameAr;
  String? categoriersImage;
  String? categoriersDatatime;
  int? categoriersServes;
  String? categoriersType;
  String? categoriersLowestLimit;
  String? favorite;
  String? productpricedisount;
  String? countproduct;
  String? totalcountproduct;
  ItemsModel2(
      {this.productId,
      this.productName,
      this.productNameAr,
      this.productDesc,
      this.productDescAr,
      this.productImage,
      this.productCount,
      this.productActive,
      this.productPrice,
      this.productDiscount,
      this.productData,
      this.productCat,
      this.productType,
      this.categoriersId,
      this.categoriersName,
      this.categoriersNameAr,
      this.categoriersImage,
      this.categoriersDatatime,
      this.categoriersServes,
      this.categoriersType,
      this.categoriersLowestLimit,
      this.favorite,
      this.productpricedisount,
        this.countproduct,
        this.totalcountproduct
      });

  ItemsModel2.fromJson(Map json) {
    productId = json['product_id'];
    productName = json['product_name'];
    productNameAr = json['product_name_ar'];
    productDesc = json['product_desc'];
    productDescAr = json['product_desc_ar'];
    productImage = json['product_image'];
    productCount = json['product_count'].toString();
    productActive = json['product_active'].toString();
    productPrice = json['product_price'].toString();
    productDiscount = json['product_discount'].toString();
    productData = json['product_data'];
    productCat = json['product_cat'];
    productType = json['product_type'];
    categoriersId = json['categoriers_id'];
    categoriersName = json['categoriers_name'];
    categoriersNameAr = json['categoriers_name_ar'];
    categoriersImage = json['categoriers_image'];
    categoriersDatatime = json['categoriers_datatime'];
    categoriersServes = json['categoriers_serves'];
    categoriersType = json['categoriers_type'];
    categoriersLowestLimit = json['categoriers_Lowest limit'].toString();
    favorite = json['favorite'].toString();
    productpricedisount = json['productpricedisount'].toString();
    countproduct = json['countproduct'].toString();
    totalcountproduct = json['totalcountproduct'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product-name'] = this.productName;
    data['product_name_ar'] = this.productNameAr;
    data['product_desc'] = this.productDesc;
    data['product_desc_ar'] = this.productDescAr;
    data['product_image'] = this.productImage;
    data['product_count'] = this.productCount;
    data['product_active'] = this.productActive;
    data['product_price'] = this.productPrice;
    data['product_discount'] = this.productDiscount;
    data['product_data'] = this.productData;
    data['product_cat'] = this.productCat;
    data['product_type'] = this.productType;
    data['categoriers_id'] = this.categoriersId;
    data['categoriers_name'] = this.categoriersName;
    data['categoriers_name_ar'] = this.categoriersNameAr;
    data['categoriers_image'] = this.categoriersImage;
    data['categoriers_datatime'] = this.categoriersDatatime;
    data['categoriers_serves'] = this.categoriersServes;
    data['categoriers_type'] = this.categoriersType;
    data['categoriers_Lowest limit'] = this.categoriersLowestLimit;
    return data;
  }
}
