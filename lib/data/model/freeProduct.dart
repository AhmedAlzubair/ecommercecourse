class FreeProductModel {
   String?  productId;
  String? productName;
  String? productNameAr;
  String? productDesc;
  String? productDescAr;
  String? productImage;
   String?  productCount;
   String?  productActive;
   String?  productPrice;
   String?  productDiscount;
  String? productData;
   String?  productCat;
   String?  cartId;
   String?  cartUserid;
   String?  cartProductid;
   String?  cartOrder;
   String?  orderId;
   String?  ordersUsersid;
   String?  ordersAddress;
   String?  ordersType;
   String?  ordersPricedelivery;
   String?  ordersPrice;
   String?  ordersCoupon;
   String?  ordersTotalprice;
   String?  ordersPaymentmethod;
  String? ordersDate;
   String?  ordersStatus;

  FreeProductModel(
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
      this.cartId,
      this.cartUserid,
      this.cartProductid,
      this.cartOrder,
      this.orderId,
      this.ordersUsersid,
      this.ordersAddress,
      this.ordersType,
      this.ordersPricedelivery,
      this.ordersPrice,
      this.ordersCoupon,
      this.ordersTotalprice,
      this.ordersPaymentmethod,
      this.ordersDate,
      this.ordersStatus});

  FreeProductModel.fromJson(Map json) {
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
    productData = json['product_data'].toString();
    productCat = json['product_cat'].toString();
    cartId = json['cart_id'].toString();
    cartUserid = json['cart_userid'].toString();
    cartProductid = json['cart_productid'].toString();
    cartOrder = json['cart_order'].toString();
    orderId = json['order_id'].toString();
    ordersUsersid = json['orders_usersid'].toString();
    ordersAddress = json['orders_address'].toString();
    ordersType = json['orders_type'].toString();
    ordersPricedelivery = json['orders_pricedelivery'].toString();
    ordersPrice = json['orders_price'].toString();
    ordersCoupon = json['orders_coupon'].toString();
    ordersTotalprice = json['orders_totalprice'].toString();
    ordersPaymentmethod = json['orders_paymentmethod'].toString();
    ordersDate = json['orders_date'].toString();
    ordersStatus = json['orders_status'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['product_name'] = this.productName;
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
    data['cart_id'] = this.cartId;
    data['cart_userid'] = this.cartUserid;
    data['cart_productid'] = this.cartProductid;
    data['cart_order'] = this.cartOrder;
    data['order_id'] = this.orderId;
    data['orders_usersid'] = this.ordersUsersid;
    data['orders_address'] = this.ordersAddress;
    data['orders_type'] = this.ordersType;
    data['orders_pricedelivery'] = this.ordersPricedelivery;
    data['orders_price'] = this.ordersPrice;
    data['orders_coupon'] = this.ordersCoupon;
    data['orders_totalprice'] = this.ordersTotalprice;
    data['orders_paymentmethod'] = this.ordersPaymentmethod;
    data['orders_date'] = this.ordersDate;
    data['orders_status'] = this.ordersStatus;
    return data;
  }
}
