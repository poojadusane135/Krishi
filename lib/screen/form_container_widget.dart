import 'package:flutter/material.dart';

class FormContainerWidget extends StatefulWidget {
  final TextEditingController? controller;
  final Key? fieldKey;
  final bool? isPasswordField;
  final String? hintText;
  final double? height;
  final BorderRadius? borderRadius;
  final Color? borderColor;
  final VoidCallback? onPressed;
  final String? buttonText;

  const FormContainerWidget({
    this.controller,
    this.fieldKey,
    this.isPasswordField,
    this.hintText,
    this.height,
    this.borderRadius,
    this.borderColor,
    this.onPressed,
    this.buttonText,
  });

  @override
  _FormContainerWidgetState createState() => _FormContainerWidgetState();
}

class _FormContainerWidgetState extends State<FormContainerWidget> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 15),
      child: Container(
        width: double.infinity,
        height: widget.height ?? 35,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10),
          border: Border.all(
            color: widget.borderColor ?? Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 1, // Spread radius
              blurRadius: 1, // Blur radius
              offset: Offset(0, 1), // Shadow offset
            ),
          ],
        ),
        child: Center(
          child: Stack(
            alignment: Alignment.centerRight,
            children: [
              TextFormField(
                style: TextStyle(color: Colors.black),
                controller: widget.controller,
                key: widget.fieldKey,
                obscureText: widget.isPasswordField == true ? _obscureText : false,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                  hintText: widget.hintText,
                  hintStyle: TextStyle(color: Colors.black45, fontSize: 20),
                  alignLabelWithHint: true,
                  suffixIcon: widget.isPasswordField == true
                      ? GestureDetector(
                    onTap: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                    child: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: _obscureText == false ? Colors.blue : Colors.grey,
                    ),
                  )
                      : null,
                ),
              ),
              if (widget.buttonText != null)
                Positioned(
                  right: 10,
                  child: ElevatedButton(
                    onPressed: widget.onPressed,
                    child: Text(widget.buttonText!),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
