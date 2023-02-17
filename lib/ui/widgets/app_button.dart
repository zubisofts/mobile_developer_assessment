import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final Function onTap;
  final String buttonText;
  final bool isLoading;
  final bool isPrimary;
  final bool isActive;
  const AppButton(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      this.isLoading = false,
      this.isPrimary = true,
      this.isActive = true})
      : super(key: key);

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Material(
      type: MaterialType.transparency,
      child: InkWell(
        onTap: () {
          if (widget.isActive) {
            widget.onTap();
          }
        },
        splashColor: Theme.of(context).primaryColor,
        child: Container(
          height: 50,
          width: 300,
          decoration: BoxDecoration(
            color: widget.isActive
                ? widget.isPrimary
                    ? themeData.colorScheme.primary
                    : themeData.colorScheme.background
                : Colors.grey,
            borderRadius: BorderRadius.circular(6),
          ),
          alignment: Alignment.center,
          child: Text(
            widget.isLoading ? 'processing...' : widget.buttonText,
            style: themeData.textTheme.bodyLarge?.copyWith(
              color: widget.isActive
                  ? widget.isPrimary
                      ? themeData.colorScheme.onPrimary
                      : themeData.colorScheme.onBackground
                  : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextButton extends StatefulWidget {
  final Function onTap;
  final String buttonText;
  final bool isLoading;
  final bool isPrimary;
  final bool isActive;
  const AppTextButton(
      {Key? key,
      required this.onTap,
      required this.buttonText,
      this.isLoading = false,
      this.isPrimary = true,
      this.isActive = true})
      : super(key: key);

  @override
  State<AppTextButton> createState() => _AppTextButtonState();
}

class _AppTextButtonState extends State<AppTextButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Material(
        type: MaterialType.transparency,
        child: GestureDetector(
          onTap: () {
            if (widget.isActive) {
              widget.onTap();
            }
          },
          child: Center(
            child: Text(
              widget.buttonText,
              style: TextStyle(
                  fontSize: 15,
                  color: widget.isPrimary
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).highlightColor),
            ),
          ),
        ),
      ),
    );
  }
}
