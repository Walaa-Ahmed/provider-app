class APIEndPoints {
  //* Base url
  // static const String baseUrl = "https://client-api.fatoorah.sa/apiAdmin/";
  static const String  baseUrl = "https://syapp.shop/api/";


  ////////////////authentication ////////////////////////
  static const String kRegister = "${baseUrl}auth/register";
  static const String kLogin = "${baseUrl}auth/login";
  static const String kVerify = "${baseUrl}auth/verify";
  static const String kForgetPassword = "${baseUrl}auth/forgetPassword";
  static const String kVerifyForgetPassword = "${baseUrl}auth/verifyForgetPassword";
  static const String kNewPassword = "${baseUrl}auth/newPassword";
  static const String kLogout = "${baseUrl}auth/logout";
  static const String kDeActivate = "${baseUrl}client/deActivate";
  static const String kUpdateProfile = "${baseUrl}client/update-profile";


  /////////////////// address ////////////////
  static const String kCities = "${baseUrl}countries/1/cities";
  static const String kZones = "${baseUrl}countries/cities";
  static const String kSubZones = "${baseUrl}countries/zones/";
  static const String kGetAddresses = "${baseUrl}address/all";
  static const String kAddresses = "${baseUrl}address/store";
  static const String kDeleteAddresses = "${baseUrl}address/delete/";
  static const String kUpdateAddresses = "${baseUrl}address/update/";

///////////////////// home ///////////////////////

  static const String kBrands = "${baseUrl}brands";
  static const String kBanners= "${baseUrl}banners/all";
  static const String kLatestProducts = "${baseUrl}products/latest";
  static const String kBestSeller = "${baseUrl}products/best_seller";

////////////////////////// PRODUCTS AND CATEGORIES /////////////
  static const String kCategoriesWithChildren = "${baseUrl}categories/all_with_childs";
  static const String kCategoriesBestSeller = "${baseUrl}categories/best_seller";
  static const String kProducts = "${baseUrl}products";
  static const String kProduct = "${baseUrl}product";

  static const String kProductDetails = "${baseUrl}product/";
  static const String kProductCheck = "${baseUrl}products/check";
  static const String kToggleFavourite = "${baseUrl}favourites/toggle";
  static const String kAllFavorite = "${baseUrl}favourites/all";
  static const String kBrandByCategory = "${baseUrl}category/";


  ///////////////// cart /////kDeliveryFee////////////
  static const String kDeliveryFee = "${baseUrl}deliveryFees";
  static const String kPaymentMethod = "${baseUrl}payment_methods";
  static const String kDeliveryText = "${baseUrl}delivery_text/";

  ////////////////// orders
  static const String kOrder = "${baseUrl}orders";
  static const String kCancelOrder = "${baseUrl}order";
  static const String kAllOrders = "${baseUrl}orders";
  static const String kAllOrderStatus = "${baseUrl}order_statuses";
  static const String kCheckCoupon = "${baseUrl}checkCoupon/";
  static const String kPrescriptionOrder = "${baseUrl}order_requests";
  static const String kPrescription = "${baseUrl}order_requests";
  static const String kTrackOrder = "${baseUrl}order";



  /////////////settings////////////////

  static const String kAboutApp = "${baseUrl}about/";
  static const String kTerms = "${baseUrl}terms/";
  static const String kPrivacy = "${baseUrl}privacy/";
  static const String kReturnPolicy = "${baseUrl}refund/";

  static const String kContactUs = "${baseUrl}contactUs";
  static const String kChangeLang = "${baseUrl}lang/change";

  static const String kSocial = "${baseUrl}contactData";



  /////////////points////////////////
  static const String kAllPoints = "${baseUrl}points/all";
  static const String kConvertPoints = "${baseUrl}points/convert";
  static const String kBalance = "${baseUrl}balance/all";
  static const String kStatistics = "${baseUrl}client/statics";


///////////////notification///

  static const String kAllowNotification = "${baseUrl}notification/allow_notification";
  static const String kNotification = "${baseUrl}notification/all";
  static const String kNotificationRead = "${baseUrl}notification/read";

}
