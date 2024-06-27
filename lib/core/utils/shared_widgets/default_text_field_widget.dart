import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_color.dart';
import '../../theme/app_color/app_colors.dart';
import '../styles.dart';

class DefaultTextFieldWidget extends StatefulWidget {
  final String? title;
  final String? hint;
  final Color? titleColor;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final VoidCallback? onTap;
  final bool isNumber;
  final bool isEmail;
  final bool enabled;
  final bool autofocus;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool? readOnly;
  final FontWeight? labelFontWeight;
  final int? maxLines;
  final bool? password;
  const DefaultTextFieldWidget(
      {super.key,
      this.title,
      this.controller,
      this.hint,
      this.titleColor,
      this.validator,
      this.onChanged,
      this.isNumber = false,
      this.isEmail = false,
      this.enabled = true,
      this.suffixIcon,
      this.prefixIcon,
      this.readOnly,
      this.labelFontWeight = FontWeight.normal,
      this.maxLines = 1,
      this.onTap,
      this.password = false,
      this.autofocus = false});

  @override
  State<DefaultTextFieldWidget> createState() => _DefaultTextFieldWidgetState();
}

class _DefaultTextFieldWidgetState extends State<DefaultTextFieldWidget> {
  bool seePassword = false;
  dynamic hasError = false;

  @override
  Widget build(BuildContext context) {
    Widget? buildSuffixIcon() {
      if (hasError == null) {
        return const Icon(Icons.check_circle_outline, color: Colors.green);
      } else {
        return const SizedBox(
          height: 0,
          width: 0,
        );
      }

      return null;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // TextWidget(
        //   text: title,
        //   fontSize: 16.sp,
        //   color: titleColor ?? AppColor.blackColor,
        //   fontWeight: labelFontWeight,
        // ),
        // SizedBox(height: 8.h),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            controller: widget.controller,
            enabled: widget.enabled,
            readOnly: widget.readOnly ?? false,
            maxLines: widget.maxLines,
            onTap: widget.onTap,
            cursorColor: kSecondaryColor,
            autofocus: widget.autofocus,
            keyboardType: widget.isNumber
                ? TextInputType.number
                : widget.isEmail
                    ? TextInputType.emailAddress
                    : TextInputType.text,
            obscureText: widget.password == true && !seePassword,
            decoration: InputDecoration(
              suffixIcon: widget.password ?? false
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          seePassword = !seePassword;
                        });
                      },
                      child: Icon(
                        seePassword
                            ? Icons.remove_red_eye
                            : Icons.visibility_off,
                        color: Colors.black38,
                      ),
                    )
                  : buildSuffixIcon(),
              //suffixIcon: widget.suffixIcon,
              prefixIcon: widget.prefixIcon,
              labelText: widget.title,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.borderColor),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.borderColor),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(
                  color: kPrimaryColor,
                  width: 1,
                ),
              ),
              isDense: true,
              labelStyle: Styles.kLight16,
              floatingLabelStyle: Styles.kBold16.copyWith(color: kHintColor),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              hintText: widget.hint ?? widget.title,
              fillColor: Colors.white,
              filled: true,
              hintStyle: TextStyle(
                color: AppColor.borderColor,
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
            ),
            validator: widget.validator,
            onChanged: widget.onChanged,
          ),
        ),
      ],
    );
  }
}
