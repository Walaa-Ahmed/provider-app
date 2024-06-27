

import 'package:flutter/material.dart';

import '../../constants/app_color.dart';
import '../styles.dart';






class DefaultTextField extends StatefulWidget {

 const  DefaultTextField({Key? key,this.icon,this.label,this.number,this.maxLines,
     this.image,this.description=false,this.password=false,this.controller,this.validator,this.email = false, this.height}) : super(key: key);

  final String? label;
 final IconData? icon;
 final bool? number;
 final  bool? email;
 final String? image;
 final bool? description;
 final bool? password;
 final int ? maxLines;
 final  TextEditingController ?controller ;
   final String? Function(String?)? validator;
   final double ?height;


  @override
  State<DefaultTextField> createState() => _DefaultTextFieldState();
}

class _DefaultTextFieldState extends State<DefaultTextField> {

  bool focus2 = false;
  bool seePassword = false;
  TextEditingController controller2 =TextEditingController();
dynamic hasError = false;
@override
  void initState() {
    // TODO: implement initState
  //widget.password=false;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    Widget? buildSuffixIcon() {

      if (hasError == null) {

        return const Icon(Icons.check_circle_outline, color: Colors.green);
      } else  {
        return const SizedBox(height: 0,width: 0,);
        //   const Icon(
        //   Icons.error,
        //   color: Colors.red,
        //   size: 24,
        // );
      }

      return null;
    }
    return Container(
      height: widget.height,
   //   width: width*0.8,
//margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
      //  border: Border.all(color: Colors.grey.shade200)

      ),
      child: FocusScope(
        child: Focus(
          onFocusChange: (focus) => setState(() {focus2 = focus;}),
          child: TextFormField(
            controller: widget.controller ?? controller2,
            cursorColor: kSecondaryColor,
            keyboardType:widget.number!=null? TextInputType.number: widget.email == true? TextInputType.emailAddress :TextInputType.text,
            maxLines: widget.description==true && widget.password==false?4:widget.maxLines??1,
            obscureText: widget.password==true&&!seePassword,
            onChanged: (val) {
              setState(() {
                hasError =  widget.validator!(widget.controller!.text);
               print( widget.validator!(widget.controller!.text));
              //  hasError = false;
                //hasConfirmation = isValid;
              });
              // if (widget.onChanged != null) {
              //   widget.onChanged!(val);
              // }
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
              border:
              const OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(
                    width: 1, color: kLightGrey),
              ),
                enabledBorder: const OutlineInputBorder(
                  borderRadius:
                  BorderRadius.all(Radius.circular(7)),
                  borderSide: BorderSide(
                      width: 1, color: kLightGrey),
                ),
              focusedBorder:  OutlineInputBorder(
                borderRadius:
                BorderRadius.all(Radius.circular(7)),
                borderSide: BorderSide(
                    width: 2,
                    color: hasError != null? kLightGrey : kPrimaryColor
                ),
              ),


              label:Text( widget.label.toString(),style: Styles.kLight11.copyWith(color: kMediumGrey.withOpacity(.5)),),

              labelStyle: Styles.kLight16,
              floatingLabelStyle: Styles.kBold16.copyWith(color: kHintColor),
             prefixIcon:
              widget.icon!=null? Icon(widget.icon,
                  color:Colors.grey)
                  :SizedBox(height: 0,),
              suffixIcon: widget.password??false?InkWell(
                onTap: (){
                  setState(() {
                    seePassword=!seePassword;
                  });
                },
                child: Icon(
                  seePassword?
                  Icons.remove_red_eye:
                  Icons.visibility_off,
                  color: Colors.black38,
                ),
              ): buildSuffixIcon()
              // const SizedBox (
              //   height: 0,
              //   width: 0,
              // )
            ),

            validator: widget.validator,
          ),
        ),
      ),
    );
  }
}
