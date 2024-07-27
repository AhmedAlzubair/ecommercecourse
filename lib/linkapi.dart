class AppLink {

static const String server="https://";
//========================== Image ============================
  static const String imageststatic = "../angle_delivery_php";
  static const String imagestcatss = "$server/upload/categories";
  static const String imagestService = "$server/upload/serves";
  static const String imagestOrgenization = "$server/upload/orgenization";
  static const String imagestProduct = "$server/upload/products";
// =============================================================
//
  static const String itemproduct = "$server/productview.php";

  // static const String test = "$server/test.php";
  static const String itemserves = "$server/serves.php";
  static const String notification = "$server/notification.php";

// ================================= Auth ========================== //

  static const String signUp = "$server/account/signup.php";
  static const String login = "$server/account/login.php";
  static const String loginAuth = "$server/account/loginAuth.php";
  static const String verifycodessignup = "$server/account/verfiycode.php";
  static const String resend = "$server/account/resend.php";

// ================================= ForgetPassword ========================== //

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

// Home

  static const String home = "$server/home.php";
  static const String catogreies = "$server/Catogreies/view.php";
// items
  static const String items = "$server/item/items.php";
  // static const String itemsview = "$server/item/itemview.php";
  static const String itemsview2 = "$server/item/view.php";
  static const String catview = "$server/item/viewcat.php";
  static const String itemsview3 = "$server/item/productview.php";
  static const String searchitems = "$server/item/search.php";

  /// officer
  static const String officeritem = "$server/Officer/offerspro.php";
  static const String officersearch = "$server/Officer/search.php";

// Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String deletefromfavroite =
      "$server/favorite/deletefromfavroite.php";

  // Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartview2 = "$server/cart/view2.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/remove.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // Coupon

  static const String checkcoupon = "$server/coupon/checkcoupon.php";

  // Checkout

  static const String viewaddreessorder = "$server/orders/viewadd.php";
  static const String checkout = "$server/orders/checkout.php";
  static const String checkoutData = "$server/orders/checkout.php";
  static const String organization = "$server/orders/vieworganization.php";

  static const String pendingorders = "$server/orders/pending.php";
  static const String ordersarchive = "$server/orders/archive.php";
  static const String ordersdetails = "$server/orders/details.php";
  static const String ordersdelete = "$server/orders/delete.php";
  static const String rating = "$server/rating.php";
  ////////////////////Delivery////////////////
  static const String loginDelivery = '$server/delivery/auth/login.php';
/////////////////order
  static const String orderspendingdelivery =
      "$server/delivery/orders/pending.php";
  static const String ordersarchivedelivery =
      "$server/delivery/orders/archive.php";
  static const String ordersdetailsdelivery =
      "$server/delivery/orders/details.php";
  static const String ordersdonedelivery = "$server/delivery/orders/done.php";
  static const String ordersapprovedelivery =
      "$server/delivery/orders/approve.php";
  static const String ordersaccepteddelivery =
      "$server/delivery/orders/accepted.php";
//////////////////////Admin
  static const String addAdmin = '$server/admin/auth/add.php';
///////////Admin services
  static const String addservices = '$server/admin/services/add.php';
  static const String editservices = '$server/admin/services/edit.php';
  static const String deleteservices = '$server/admin/services/delete.php';
  static const String viewservices = '$server/admin/services/view.php';
  static const String viewservicesCat = '$server/admin/services/viewsercat.php';
///////////Admin orgenization
  static const String addorgenization= '$server/admin/orgenization/add.php';
  static const String editorgenization = '$server/admin/orgenization/edit.php';
  static const String deleteorgenization = '$server/admin/orgenization/delete.php';
  static const String vieworgenization = '$server/admin/orgenization/view.php';
///////////Admin categories
  static const String addcategories = '$server/admin/categories/add.php';
  static const String editcategories = '$server/admin/categories/edit.php';
  static const String deletecategories = '$server/admin/categories/delete.php';
  static const String viewcategories = '$server/admin/categories/view.php';
  static const String viewcategoriespro =
      '$server/admin/categories/viewCatPro.php';
///////////Admin Product
  static const String addproduct = '$server/admin/products/add.php';
  static const String editproduct = '$server/admin/products/edit.php';
  static const String deleteproduct = '$server/admin/products/delete.php';
  static const String viewproduct = '$server/admin/products/view.php';
/////////////////Admin order

  static const String ordersViewAdmin = "$server/admin/orders/view.php";
  static const String ordersViewSAdmin = "$server/admin/orders/views.php";
  static const String ordersViewPreAdmin =
      "$server/admin/orders/viewpreper.php";
  static const String ordersViewAproAdmin =
      "$server/admin/orders/viewaprove.php";
  static const String ordersapproveAdmin = "$server/admin/orders/approve.php";
  static const String ordersprepareAdmin = "$server/admin/orders/prepare.php";
  static const String ordersarchiveAdmin = "$server/admin/orders/archive.php";
  static const String ordersdetailsAdmin = "$server/admin/orders/details.php";
}
