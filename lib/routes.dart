import 'package:ecommercecoursenmmm/core/constant/routes.dart';
import 'package:ecommercecoursenmmm/core/middleware/mymiddleware.dart';

import 'package:ecommercecoursenmmm/view/admin/categories/addCat.dart';
import 'package:ecommercecoursenmmm/view/admin/categories/editCat.dart';
import 'package:ecommercecoursenmmm/view/admin/categories/viewCat.dart';
import 'package:ecommercecoursenmmm/view/admin/categories/viewCatPro.dart';
import 'package:ecommercecoursenmmm/view/admin/homeAdmin.dart';
import 'package:ecommercecoursenmmm/view/admin/homeadminScreen.dart';
import 'package:ecommercecoursenmmm/view/admin/orders/adminOrderpending.dart';
import 'package:ecommercecoursenmmm/view/admin/orders/adminViewOrdersScreen.dart';
import 'package:ecommercecoursenmmm/view/admin/orders/admindetailsorders.dart';
import 'package:ecommercecoursenmmm/view/admin/products/addPro.dart';
import 'package:ecommercecoursenmmm/view/admin/products/editPro.dart';
import 'package:ecommercecoursenmmm/view/admin/products/viewPro.dart';

import 'package:ecommercecoursenmmm/view/admin/services/add.dart';
import 'package:ecommercecoursenmmm/view/admin/services/edit.dart';
import 'package:ecommercecoursenmmm/view/admin/services/view.dart';
import 'package:ecommercecoursenmmm/view/admin/services/viewServCat.dart';
import 'package:ecommercecoursenmmm/view/delivery/orderdelivery/aproveorder.dart';
import 'package:ecommercecoursenmmm/view/delivery/orderdelivery/detailsDelivery.dart';
import 'package:ecommercecoursenmmm/view/delivery/orderdelivery/pending.dart';
import 'package:ecommercecoursenmmm/view/delivery/orderdelivery/trackingdelivery.dart';
import 'package:ecommercecoursenmmm/view/delivery/screen/homeScreen.dart';
import 'package:ecommercecoursenmmm/view/screen/catogreiesServHome.dart';
import 'package:ecommercecoursenmmm/view/screen/address/add.dart';
import 'package:ecommercecoursenmmm/view/screen/address/adddetails.dart';
import 'package:ecommercecoursenmmm/view/screen/address/view.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/forgetpassword/forgetpassword.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/login.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/signup.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/success_signup.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:ecommercecoursenmmm/view/screen/auth/verifycodesignup.dart';
import 'package:ecommercecoursenmmm/view/screen/cart.dart';
import 'package:ecommercecoursenmmm/view/screen/checkout.dart';
import 'package:ecommercecoursenmmm/view/screen/home.dart'; 
import 'package:ecommercecoursenmmm/view/screen/homescreen.dart';
import 'package:ecommercecoursenmmm/view/screen/items.dart';
import 'package:ecommercecoursenmmm/view/screen/language.dart';
import 'package:ecommercecoursenmmm/view/screen/myfavorite.dart';
import 'package:ecommercecoursenmmm/view/screen/notification.dart';
import 'package:ecommercecoursenmmm/view/screen/officer/officer.dart';
import 'package:ecommercecoursenmmm/view/screen/onboarding.dart';
import 'package:ecommercecoursenmmm/view/screen/orders/archive.dart';
import 'package:ecommercecoursenmmm/view/screen/orders/details.dart';
import 'package:ecommercecoursenmmm/view/screen/orders/pending.dart';
import 'package:ecommercecoursenmmm/view/screen/orders/trackingUserOrder.dart';
import 'package:ecommercecoursenmmm/view/screen/paypal/checkoutPage.dart';
import 'package:ecommercecoursenmmm/view/screen/productdetails.dart';
import 'package:get/get.dart';

import 'view/admin/organization/add.dart';
import 'view/admin/organization/addOrganization.dart';
import 'view/admin/organization/editOrganization.dart';
import 'view/admin/organization/viewOrganization.dart';
import 'view/screen/auth/loginauth.dart';


List<GetPage<dynamic>>? routes = [

   GetPage( name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
   GetPage( name: AppRoute.language, page: () => const Language(), middlewares: [MyMiddleWare()]),
 // GetPage(name: AppRoute.checkoutPage, page: () => const CheckoutPage()),
  // GetPage(name: "/", page: () =>   TestView()),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
 // GetPage(name:AppRoute.RestorantPage , page: () => const RestorantPage()),
//  Auth
  //GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.loginAuth, page: () => const LoginAuth()),
  GetPage(name: AppRoute.signUp, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerfiyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(
      name: AppRoute.successResetpassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(name: AppRoute.onBoarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verfiyCodeSignUp, page: () => const VerfiyCodeSignUp()),
  //
  GetPage(name: AppRoute.homeCategoriers, page: () => const HomeCategoriers()),
  GetPage(name: AppRoute.homescreen, page: () => const HomeScreen()),
  GetPage(name: AppRoute.homepage, page: () => const HomePage()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myfavroite, page: () => const MyFavorite()),
    GetPage(name: AppRoute.officer, page: () => const Officer()),
  //
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const Checkout()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(name: AppRoute.ordersarchive, page: () => const OrdersArchiveView()),
  GetPage(name: AppRoute.ordersdetails, page: () => const OrdersDetails()),
  GetPage(name: AppRoute.trackingUserOrder, page: () => const TrackingUserOrder()),
 ///////////////Adress
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()), 
////////////////notification
 GetPage(name:AppRoute.notificationView , page: () => const NotificationView()),
////////////////////Delivery/////
 GetPage(name:AppRoute.homeScreenDelivery , page: () => const HomeScreenDelivery()),

 GetPage(name: AppRoute.pandingScreen, page: () => const PandingScreen()),
 GetPage(name: AppRoute.aproveScreen, page: () => const AproveScreen()),
  GetPage(name: AppRoute.detailsDelivery, page: () => const DetailsDelivery()),
  GetPage(name: AppRoute.trackingDelivery, page: () => const TrackingDelivery()),
////////////Admin
  GetPage(name: AppRoute.homeAdmin, page: () => const HomeAdmin()),
  GetPage(name: AppRoute.homeAdminScreen, page: () => const HomeAdminScreen()),
/////////////////Services Admin
  GetPage(name: AppRoute.homeServesAdminView, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeServesAdminEdit, page: () => const HomeServesAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeServesAdminAdd, page: () => const HomeServesAdminAdd()),
/////////////////Orgenization Admin
  GetPage(name: AppRoute.homeOrgenizationAdminView, page: () => const HomeOrganizationAdminView()),
  GetPage(name: AppRoute.homeOrgenizationAdminEdit, page: () => const HomeOrganizationAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeOrgenizationAdminAdd, page: () => const HomeOrganizationAdminAdd()),
  GetPage(name: AppRoute.addressAddOrganization, page: () => const AddressAddOrganization()),
  
  GetPage(name: AppRoute.servesCategoriesAdminView, page: () => const ServesCategoriesAdminView()),
/////////////////Categories Admin
  GetPage(name: AppRoute.homeCategoriesAdminView, page: () => const HomeCategoriesAdminView()),
  GetPage(name: AppRoute.homeCategoriesAdminEdit, page: () => const HomeCategoriesAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeCategoriesAdminAdd, page: () => const HomeCategoriesAdminAdd()),
  GetPage(name: AppRoute.categoriesProductView, page: () => const CategoriesProductView()),
/////////////////Products Admin
  GetPage(name: AppRoute.homeProductsAdminView, page: () => const HomeProductsAdminView()),
  GetPage(name: AppRoute.homeProductsAdminEdit, page: () => const HomeProductsAdminEdit()),
  //GetPage(name: AppRoute.homeServesAdminDelete, page: () => const HomeServesAdminView()),
  GetPage(name: AppRoute.homeProductsAdminAdd, page: () => const HomeProductsAdminAdd()),
  GetPage(name: AppRoute.homeCategoriesAdminAdd, page: () => const HomeCategoriesAdminAdd()),

/////////////////Orders Admin
  GetPage(name: AppRoute.adminViewOrders, page: () => const AdminViewOrdersScreen()),
  GetPage(name: AppRoute.adminpandingOrders, page: () => const AdminOrderPandingScreen()),
  GetPage(name: AppRoute.admindetailsOrders, page: () => const AdminDetailsOrders()),
 // GetPage(name: AppRoute.adminTrackingOrders, page: () => const AdminTracking()),
];
