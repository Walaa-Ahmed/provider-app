import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:dropdown_search/dropdown_search.dart';

import '../../constants/app_color.dart';
import '../styles.dart';


class CustDropDown extends StatefulWidget {
  final List<String> items;
  final Function(String)? onChanged;
  final String hintText;
  final double borderRadius;
  final double maxListHeight;
  final double borderWidth;
  final int defaultSelectedIndex;
  final bool enabled;
  final String ? itemSelected;

  const CustDropDown({
    Key? key,
    required this.items,
    required this.onChanged,
    this.hintText = '',
    this.borderRadius = 10,
    this.maxListHeight = 100,
    this.borderWidth = 1,
    this.defaultSelectedIndex = -1,
    this.enabled = true, this.itemSelected,
  }) : super(key: key);

  @override
  _CustDropDownState createState() => _CustDropDownState();
}

class _CustDropDownState extends State<CustDropDown>
    with WidgetsBindingObserver {
  bool _isOpen = false, _isAnyItemSelected = false, _isReverse = false;
  late OverlayEntry _overlayEntry;
  late RenderBox? _renderBox;
  Widget? _itemSelected;
  late Offset dropDownOffset;
  final LayerLink _layerLink = LayerLink();
  String?itemSelected ;




  @override
  Widget build(BuildContext context) {
    return   Center(
        child: Container(
          height: 50,
          padding: EdgeInsets.all(0),
          child: DropdownSearch<String>(

            //autoValidateMode: AutovalidateMode.always,
            items: widget.items,
            popupProps:  PopupProps.menu(
                showSelectedItems: true,
                showSearchBox: true,
               fit: FlexFit.loose,
                menuProps: MenuProps(backgroundColor:Colors.white, ),
                searchFieldProps: const TextFieldProps(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    decoration: InputDecoration(
                      icon: Icon(Icons.search),
                      hintText: 'Search',
                      fillColor: kLightGrey,
                      enabledBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color:Colors.transparent,width: 3 )
                      ),
                      focusedBorder: OutlineInputBorder(
                        //  borderRadius: BorderRadius.circular(10.r),
                          borderSide: BorderSide(color:Colors.transparent,width: 3 )
                      ),
                    )
                ),
                itemBuilder: (ctx, item, isSelected) {
                  return  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: !isSelected
                        ? BoxDecoration(
                      border: Border(bottom: BorderSide(color: kLightGrey)),
                      //  borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    )
                        : BoxDecoration(
                      //  border: Border.all(color: Theme.of(context).primaryColor),
                      //  borderRadius: BorderRadius.circular(5),
                      color: kSecondaryColor,
                    ),
                    child: ListTile(
                      selected: isSelected,
                      title: Text(item,style: Styles.kBold14.copyWith(color: isSelected? kPrimaryColor:kTextColor),),

                    ),
                  );
                }          //  title: "Select item",
            ),
            //  dropdownButtonProps: DropdownButtonProps(color: Colors.blue,),

            dropdownDecoratorProps: DropDownDecoratorProps(
              textAlignVertical: TextAlignVertical.center,
              dropdownSearchDecoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 8),
                  hintText: widget.hintText??"",
                  hintStyle: Styles.kMedium14,
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color:kLightGrey,width: 1 )
                  ),
                  focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color:kLightGrey,width: 1 )
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: const BorderSide(color:Colors.green,width: 8 )
                  )),
            ),
            onChanged: (value) {
              widget.onChanged!(value!);
            },
            selectedItem: itemSelected,
          ),
        ));
  }


}

class PrimaryContainer extends StatelessWidget {
  final Widget child;
  final double? radius;
  final Color? color;
  const PrimaryContainer({
    Key? key,
    this.radius,
    this.color,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius ?? 30),
        boxShadow: [
          BoxShadow(
            color: color ?? const Color(0XFF1E1E1E),
          ),
          const BoxShadow(
            offset: Offset(2, 2),
            blurRadius: 4,
            spreadRadius: 0,
            color: Colors.black,
            //inset: true,
          ),
        ],
      ),
      child: child,
    );
  }
}
