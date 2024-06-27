
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider_app/core/utils/shared_widgets/text_widget.dart';
import 'package:provider_app/core/utils/styles.dart';
import '../constants/app_color.dart';
import '../theme/app_color/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fl_toast/fl_toast.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:flutter/material.dart' hide ModalBottomSheetRoute;

import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

import 'locator.dart';


class DialogsAndPopUp {
  const DialogsAndPopUp._();

  static Future showPopup({
    required BuildContext context,
    required Widget content,
    required String title,
    double? height,
    double? width,
    bool showCloseIcon = true,
  }) async {
    return showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: Colors.white,
        contentPadding: EdgeInsets.zero,
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide.none,
        ),
        content: SingleChildScrollView(
          child: Container(
            height: height ?? 0.3.sh,
            width: width ?? 0.8.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.r),
            ),
            padding: EdgeInsets.all(10.h),
            child: Column(
              children: [
                // if(showCloseIcon)
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                //   child: Align(
                //       alignment: Alignment.topRight,
                //       child: InkWell(
                //         onTap: (){
                //           Navigator.pop(context);
                //         },
                //         child: Container(
                //           height: 0.05.sh,
                //           width: 0.09.sw,
                //           decoration: BoxDecoration(
                //               color: Colors.red[400],
                //               shape: BoxShape.circle),
                //           child: const Center(
                //             child: Icon(
                //               Icons.clear,
                //               color: Colors.white,
                //             ),
                //           ),
                //         ),
                //       )),
                // ),
                // SizedBox(height: 30.h,),
                TextWidget(
                  text: title,
                  fontSize: 0.022.sh,
                  textAlign: TextAlign.center,
                  maxLines: 3,
                ),
                SizedBox(
                  height: 20,
                ),
                Expanded(child: content)
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future showAnimatedPopup(
      {required BuildContext context,
        required Widget content,
        String? title,
        double? height,
        double? width,
        String? cartPosition,
        DialogTransitionType? animation,
        bool dismissible = true}) async {
    return showAnimatedDialog(
      context: context,
      animationType: DialogTransitionType.slideFromBottom,
      curve: Curves.fastOutSlowIn,

      barrierDismissible: dismissible,
      //alignment: cartPosition ==CartPosition.Right.text()? Alignment.centerLeft:Alignment.centerRight,
      duration: const Duration(milliseconds: 500),
      builder: (ctx) => AlertDialog(
        //  alignment:cartPosition ==CartPosition.Right.text()? Alignment.centerLeft:Alignment.centerRight,
          insetPadding: EdgeInsets.zero,
          actionsOverflowAlignment: OverflowBarAlignment.start,
          actionsAlignment: MainAxisAlignment.start,
          //   backgroundColor: Theme.of(context).backgroundColor,
          contentPadding: EdgeInsets.zero,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14.r),
            // borderRadius: BorderRadius.only(
            //   topRight: Radius.circular(cartPosition ==CartPosition.Right.text()? 20.r:0),
            //   bottomRight:  Radius.circular(cartPosition ==CartPosition.Right.text()? 20.r:0),
            //   topLeft: Radius.circular(cartPosition ==CartPosition.Right.text()? 0.r:20.r),
            //   bottomLeft: Radius.circular(cartPosition ==CartPosition.Right.text()? 0.r:20.r),
            //
            // ),
            borderSide: BorderSide.none,
          ),
          content: Container(
            height: height ?? 0.4.sh,
            width: width ?? 0.8.sw,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.r),
            ),
            padding: EdgeInsets.all(0.h),
            child: content,
          )),
    );
  }

  static Future bottomSheet(
      {required BuildContext context,
        required Widget content,
        required String title,
        double? height,
        double? width,
        bool hasCloseIcon = true}) async {
    return showMaterialModalBottomSheet(
      shape: OutlineInputBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r), topLeft: Radius.circular(20.r)),
        borderSide: BorderSide.none,
      ),
      context: context,
      builder: (ctx) => SingleChildScrollView(
        child: Container(
          height: height ?? 0.3.sh,
          width: width ?? 0.8.sw,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r)),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(10, title == '' ? 0 : 10, 10, 0),
                child: Row(
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Center(
                      child: Text(
                        title,
                        style: Styles.kBold16,
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    if (hasCloseIcon == true)
                      Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            // child: Container(
                            //   height: 0.05.sh,
                            //   width: 0.09.sw,
                            //   decoration: BoxDecoration(
                            //       color: Colors.red[400],
                            //       shape: BoxShape.circle),
                            child: const Center(
                              child: Icon(
                                Icons.clear,
                                color: kHintColor,
                              ),
                              // ),
                            ),
                          )),
                  ],
                ),
              ),

              //   SizedBox(height: 30.h,),

              //   SizedBox(height: 20,),
              Expanded(child: content)
            ],
          ),
        ),
      ),
    );
  }

  static void previewToast({
    required String msg,
    required BuildContext context,
    bool error = false,
    VoidCallback? onTap
  }) {
    // Fluttertoast.showToast(
    //   msg: msg,
    //   fontSize: 16.sp,
    //   toastLength: Toast.LENGTH_LONG,
    //   gravity: ToastGravity.BOTTOM,
    //   backgroundColor: AppColor.primaryColor.withOpacity(0.9),
    // );
    showStyledToast(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Material(
          elevation: 20,
          child: InkWell(
            onTap: onTap,
            child: Container(
                width: 0.8.sh,
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                    color: error ? Colors.red[700] : Colors.white,
                    borderRadius: BorderRadius.circular(12.r)),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!error)
                      Image.asset(
                        'assets/images/logo_pharmacy.png',
                        height: 0.05.sh,
                      ),
                    if (error)
                      const Icon(
                        Icons.info_outline,
                        color: Colors.white,
                        size: 35,
                      ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Expanded(
                      child: Text(msg,
                          style: Styles.kMedium16
                              .copyWith(color: error ? Colors.white : kTextColor),
                          textAlign: TextAlign.center,
                          maxLines: 5),
                    ),
                  ],
                )),
          ),
        ),
      ),
      backgroundColor: Colors.transparent,
      alignment: Alignment.topCenter,
      context: context,
    );

    // FancySnackbar.showSnackbar(
    //   context,
    //   snackBarType: FancySnackBarType.success,
    //   color:error? SnackBarColors.error3 : SnackBarColors.waitting5,
    //   title: description!=null? msg : error? 'error'.tr() : 'success'.tr(),
    //    message: description ?? msg,
    //   duration: 2,
    //   onCloseEvent: () {},
    // );
  }

}
