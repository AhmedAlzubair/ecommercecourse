class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUserid;
  String? favoriteProductid;
  String? productId;
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
  String? productCat;
  String? productType;
  String? userId;

  MyFavoriteModel(
      {this.favoriteId,
      this.favoriteUserid,
      this.favoriteProductid,
      this.productId,
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
      this.userId});

  MyFavoriteModel.fromJson(Map json) {
    favoriteId = json['favorite_id'].toString();
    favoriteUserid = json['favorite_userid'].toString();
    favoriteProductid = json['favorite_productid'].toString();
    productId = json['product_id'].toString();
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
    productCat = json['product_cat'].toString();
    productType = json['product_type'];
    userId = json['user_id'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userid'] = this.favoriteUserid;
    data['favorite_productid'] = this.favoriteProductid;
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
    data['user_id'] = this.userId;
    return data;
  }
}