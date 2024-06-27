
import 'dart:convert';
import 'dart:io';

import '../constants/constants.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../local_database/database_helper.dart';
import 'dio_utils.dart';
import 'navigation.service.dart';
import 'package:sqflite/sqflite.dart';

GetIt sl = GetIt.I;

setup() async {
  sl.allowReassignment = true;

  // var dir = await getApplicationDocumentsDirectory();
  // sl.registerSingleton(Hive..init(dir.path)..registerAdapter(StoreOrderModelAdapter()));

  //
  sl.registerSingleton<SharedPreferences>(await SharedPreferences.getInstance());
//  sl.registerSingleton<SharedPreferencesUtils>(await SharedPreferencesUtils.getInstance());
  sl.registerSingleton<DioUtils>(DioUtils.getInstance());
  sl.registerSingleton<NavigationService>(NavigationService());
  sl.registerSingleton<Database>(await DatabaseHelper.initialDb());

  // repository locator
  // sl.registerSingleton<AuthenticationRepository>(AuthenticationRepository.getInstance());
  // sl.registerSingleton<HomeRepository>(HomeRepository.getInstance());
  // sl.registerSingleton<CategoryProductsRepository>(CategoryProductsRepository.getInstance());
  // sl.registerSingleton<BrandRepository>(BrandRepository.getInstance());
  // sl.registerSingleton<ProductDetailsRepository>(ProductDetailsRepository.getInstance());
  // sl.registerSingleton<AddressRepository>(AddressRepository.getInstance());
  // sl.registerSingleton<CartRepository>(CartRepository.getInstance());
  // sl.registerSingleton<OrderSummaryRepository>(OrderSummaryRepository.getInstance());
  // sl.registerSingleton<OrdersRepository>(OrdersRepository.getInstance());
  // sl.registerSingleton<WishListRepository>(WishListRepository.getInstance());
  // sl.registerSingleton<AboutAppRepository>(AboutAppRepository.getInstance());
  // sl.registerSingleton<MenuRepository>(MenuRepository.getInstance());
  // sl.registerSingleton<PointsRepository>(PointsRepository.getInstance());
  // sl.registerSingleton<PrescriptionRepository>(PrescriptionRepository.getInstance());
  //
  // sl.registerSingleton<NotificationRepository>(NotificationRepository.getInstance());


}


// //set and get language (ar, en)
// setLanguage(String lang) {
//   sl<SharedPreferencesUtils>().setString(kLanguage, lang);
// }
//
// getLanguage() {
//   return sl<SharedPreferencesUtils>().getString(kLanguage) ?? Platform.localeName.substring(0,2);
// }
//
// //set and get token
// setUserToken(String token) {
//   sl<SharedPreferencesUtils>().setString(kToken, token);
// }
//
// getUserToken() {
//   return sl<SharedPreferencesUtils>().getString(kToken);
// }
//
// //set and get user role
// setUserImage(String image) {
//   sl<SharedPreferencesUtils>().setString(kImage, image);
// }
//
// getUserImage() {
//   return sl<SharedPreferencesUtils>().getString(kImage);
// }
//
// setUserGender(String gender) {
//   sl<SharedPreferencesUtils>().setString(kGender, gender);
// }
//
// getUserGender() {
//   return sl<SharedPreferencesUtils>().getString(kGender) ?? '';
// }
//
//
// setTax(String tax) {
//   sl<SharedPreferencesUtils>().setDouble(kTax, double.parse(tax));
// }
//
// getTax() {
//   return sl<SharedPreferencesUtils>().getDouble(kTax) ?? 0;
// }
// //set and get phone
// setUserPhone(String phone) {
//   sl<SharedPreferencesUtils>().setString(kPhone, phone);
// }
//
// getUserPhone() {
//   return sl<SharedPreferencesUtils>().getString(kPhone) ?? '';
// }
//
// //set and get client id
// setClientId(int id) {
//   sl<SharedPreferencesUtils>().setInt(kClientId, id);
// }
//
// getClientId() {
//   return sl<SharedPreferencesUtils>().getInt(kClientId) ?? 0;
// }
//
//
// //set and get client name
// setClientName(String name) {
//   sl<SharedPreferencesUtils>().setString(kClientName, name);
// }
//
// getClientName() {
//   return sl<SharedPreferencesUtils>().getString(kClientName) ?? '';
// }
//
//
// //set and get user lat
// setUserLat(double lat) {
//   sl<SharedPreferencesUtils>().setDouble(kUserLat, lat);
// }
//
// getUserLat() {
//   return sl<SharedPreferencesUtils>().getDouble(kUserLat);
// }
//
//
//
// //set and get user long
// setUserLong(double long) {
//   sl<SharedPreferencesUtils>().setDouble(kUserLong, long);
// }
//
// getUserLong() {
//   return sl<SharedPreferencesUtils>().getDouble(kUserLong);
// }
//
//
// //set and get user City
// setUserCity(String city) {
//   sl<SharedPreferencesUtils>().setString(kUserCity, city);
// }
//
// getUserCity() {
//   return sl<SharedPreferencesUtils>().getString(kUserCity);
// }
//
// setUserZone(String zone) {
//   sl<SharedPreferencesUtils>().setString(kUserZone, zone);
// }
//
// getUserZone() {
//   return sl<SharedPreferencesUtils>().getString(kUserZone);
// }
//
//
// setUserSubZone(String subZone) {
//   sl<SharedPreferencesUtils>().setString(kUserSubZone, subZone);
// }
//
// getUserSubZone() {
//   return sl<SharedPreferencesUtils>().getString(kUserSubZone);
// }
//
// setUserSubZoneId(int subZoneId) {
//   sl<SharedPreferencesUtils>().setInt(kUserSubZoneId, subZoneId);
// }
// getUserSubZoneIdForAddress() {
//   return sl<SharedPreferencesUtils>().getInt(kUserSubZoneIdForAddress);
// }
//
// setUserSubZoneIdForAddress(int subZoneId) {
//   sl<SharedPreferencesUtils>().setInt(kUserSubZoneIdForAddress, subZoneId);
// }
// getUserSubZoneId() {
//   return sl<SharedPreferencesUtils>().getInt(kUserSubZoneId);
// }
// setUserZoneId(int zoneId) {
//   sl<SharedPreferencesUtils>().setInt(kUserZoneId, zoneId);
// }
//
// getUserZoneId() {
//   return sl<SharedPreferencesUtils>().getInt(kUserZoneId);
// }
// setUserZoneIdForAddress(int zoneId) {
//   sl<SharedPreferencesUtils>().setInt(kUserZoneIdForAddress, zoneId);
// }
//
// getUserZoneIdForAddress() {
//   return sl<SharedPreferencesUtils>().getInt(kUserZoneIdForAddress);
// }
// setUserCityId(int id) {
//   sl<SharedPreferencesUtils>().setInt(kUserCityId, id);
// }
//
// getUserCityId() {
//   return sl<SharedPreferencesUtils>().getInt(kUserCityId);
// }
//
// setUserCityIdForAddress(int id) {
//   sl<SharedPreferencesUtils>().setInt(kUserCityIdForAddress, id);
// }
//
// getUserCityIdForAddress() {
//   return sl<SharedPreferencesUtils>().getInt(kUserCityIdForAddress);
// }
//
// //set and get user country
// setUserCountry(String id) {
//   sl<SharedPreferencesUtils>().setString(kUserCountry, id);
// }
//
// getUserCountry() {
//   return sl<SharedPreferencesUtils>().getString(kUserCountry) ?? '';
// }
//
//
// //set and get cart discount
// setCartDiscount(double discount) {
//   sl<SharedPreferencesUtils>().setDouble(kCartDiscount, discount);
// }
//
// getCartDiscount() {
//   return sl<SharedPreferencesUtils>().getDouble(kCartDiscount)?.toDouble() ?? 0;
// }
//
// //set and get cart discount
// setCartCoupon(String coupon) {
//   sl<SharedPreferencesUtils>().setString(kCartCoupon, coupon);
// }
//
// getCartCoupon() {
//   return sl<SharedPreferencesUtils>().getString(kCartCoupon) ?? '';
// }
// // switch notification
// setNotifyStatus(int status) {
//   sl<SharedPreferencesUtils>().setInt(kNotify, status);
// }
//
// getNotifyStatus() {
//   return sl<SharedPreferencesUtils>().getInt(kNotify) ?? 1;
// }
// removeData(){
//   sl<SharedPreferencesUtils>().removeUserData();
//
// }
// removeKey(String key){
//   sl<SharedPreferencesUtils>().removeString(key);
// }
// removeAddressLocation(){
//   sl<SharedPreferencesUtils>().removeString(kUserCityIdForAddress);
//   sl<SharedPreferencesUtils>().removeString(kUserZoneIdForAddress);
//   sl<SharedPreferencesUtils>().removeString(kUserSubZoneIdForAddress);
//   print(getUserSubZoneIdForAddress().toString()+"nnnnnn");
// }
// removeLocation(){
//   sl<SharedPreferencesUtils>().removeString(kUserCityId);
//   sl<SharedPreferencesUtils>().removeString(kUserZoneId);
//   sl<SharedPreferencesUtils>().removeString(kUserSubZoneId);
//   sl<SharedPreferencesUtils>().removeString(kUserSubZone);
//   sl<SharedPreferencesUtils>().removeString(kUserZone);
//   sl<SharedPreferencesUtils>().removeString(kUserSubZone);
//
//   sl<SharedPreferencesUtils>().removeString(kSubZone);
//   sl<SharedPreferencesUtils>().removeString(kZone);
// }
//
// setCity(CityModel address){
//
//   sl<SharedPreferencesUtils>().setString(kCity, jsonEncode(address.toJson()));
// }
//
//
// getCity(){
//
// return  sl<SharedPreferencesUtils>().getString(kCity);
// }
//
// setZone(ZoneModel zone){
//   sl<SharedPreferencesUtils>().setString(kZone, jsonEncode(zone.toJson()));
// }
//
// getZone(){
//  return sl<SharedPreferencesUtils>().getString(kZone);
// }
//
// setSubZone(SubZoneModel subZone){
//   sl<SharedPreferencesUtils>().setString(kSubZone, jsonEncode(subZone.toJson()));
// }
//
// getSubZone(){
//   return sl<SharedPreferencesUtils>().getString(kSubZone);
//}