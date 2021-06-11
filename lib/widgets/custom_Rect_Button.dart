import 'package:flutter/material.dart';

class RoundedCustomButton extends StatelessWidget {
  RoundedCustomButton({
    Key key,
    this.lable,
    this.textColor,
    this.buttonColor,
    this.fontSize,
    this.elevation = 0.0,
    this.bold,
    this.enabled = true,
    this.iconBack = false,
    this.iconforward = false,
    this.borderColor,
    this.onTap,
  }) : super(key: key);

  final String lable;
  final dynamic onTap;
  final double fontSize;
  final double elevation;
  final Color buttonColor;
  final Color borderColor;
  final Color textColor;
  final bool bold;
  final bool enabled;
  final bool iconBack;
  final bool iconforward;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: !enabled ? Colors.grey : buttonColor,
      elevation: !enabled ? 0.0 : elevation,
      shape: RoundedRectangleBorder(
        side: borderColor != null
            ? BorderSide(color: borderColor)
            : BorderSide(color: buttonColor),
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: InkWell(
          borderRadius: BorderRadius.circular(20.0),
          onTap: onTap,
          child: Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  iconBack
                      ? Icon(
                          Icons.arrow_forward,
                          color: textColor,
                        )
                      : Container(
                          width: 8,
                        ),
                  Center(
                    child: Text(
                      lable,
                      style: Theme.of(context).textTheme.button.copyWith(
                          fontSize: 14,
                          color: textColor,
                          fontWeight:FontWeight.bold),
                    ),
                  ),
                  iconforward
                      ? Icon(
                          Icons.arrow_forward_ios,
                          color: textColor,
                        )
                      : Container(
                          width: 8,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
