import 'package:flutter/material.dart';

import '../../constants/app_color.dart';


class DefaultButton extends StatefulWidget {
  final String? title;
  final Function? function;
  final Color ?color;
  final Color ?textColor;
  final double  radius;
  final double font;
  final double? width;
  final double ? height;
  final Color ? borderColor;
  final bool ? isLoad;

  const DefaultButton(
      {Key? key,
        required this.font,
        this.title,
        this.function,
        this.color,
        this.textColor,
        this.height,
        this.width,
        this.borderColor,
        this.isLoad = false,
        required this.radius})
      : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton>
    with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);
  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {

    return ScaleTransition(
      scale: _tween.animate(
        CurvedAnimation(
          parent: _controller,
          curve: Curves.easeOut,
          reverseCurve: Curves.easeIn,
        ),
      ),
      child: SizedBox(
        height: widget.height
            ?? MediaQuery.of(context).size.height *.06,
        //height:  MediaQuery.of(context).size.height * 01,
        width:widget.width?? MediaQuery.of(context).size.width *.8,
        child: TextButton(
          onPressed: () {
            _controller.forward().then((_) {
              _controller.reverse();
            });
             widget.function!();
          },

          style: TextButton.styleFrom(
            foregroundColor: widget.textColor, padding: EdgeInsets.zero,
            backgroundColor: widget.color,
            shape: RoundedRectangleBorder(
              side:  BorderSide(color: widget.borderColor ?? Colors.transparent), //,
              borderRadius: BorderRadius.circular(widget.radius),
            ),
          ),
          child:
          widget.isLoad!?
              const CircularProgressIndicator(color: kSecondaryColor,strokeWidth: 2,):
          Center(
            child: Text(
              widget.title!,
              style: TextStyle(
             //   height:  MediaQuery.of(context).size.height*0.001,
                //  fontWeight: FontWeight.bold,
                fontSize: widget.font,),
            ),
          ),
        ),
      ),
    );
  }
}
