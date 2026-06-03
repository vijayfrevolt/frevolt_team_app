import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function onPressed;
  final bool isLoading;
  final bool? isDisabled;
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final Color backgroundColor;
  final Color? textColor;
  final double? fontSize;
  final FontWeight? fontWeight;
  final EdgeInsetsGeometry? padding;
  final BorderSide? border;
  final IconData? icon;
  final double? iconSize;
  final Color? iconColor;
  final bool? isElevatedButton;
  final double? elevation;

  const CustomButton({super.key, 
    required this.text,
    required this.onPressed,
    required this.isLoading,
    this.isDisabled,
    this.width,
    this.height,
    this.borderRadius,
    this.borderColor,
    required this.backgroundColor,
    this.textColor,
    this.fontSize,
    this.fontWeight,
    this.padding,
    this.border,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isElevatedButton,
    this.elevation,
  });
  
  @override
  State<StatefulWidget> createState() {
    return _CustomButtonState();
  }
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.isDisabled == true || widget.isLoading ? null : () => widget.onPressed(),
      child: Container(
        width: widget.width ?? 150,
        height: widget.height ?? 50,
        decoration: BoxDecoration(
          color: widget.isDisabled == true
              ? Colors.grey
              : widget.backgroundColor,
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 8),
          border: widget.border != null ? Border.fromBorderSide(widget.border!) : null,
        ),
        child: Center(
          child: widget.isLoading
              ? SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(widget.textColor ?? Colors.white),
                  ),
                )
              : Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (widget.icon != null) ...[
                      Icon(
                        widget.icon,
                        size: widget.iconSize ?? 20,
                        color: widget.iconColor ?? Colors.white,
                      ),
                      const SizedBox(width: 8),
                    ],
                    Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.textColor ?? Colors.white,
                        fontSize: widget.fontSize ?? 16,
                        fontWeight: widget.fontWeight ?? FontWeight.normal,
                      ),
                    ),
                  ],),
        ),
      ),
    );
  }}