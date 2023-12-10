import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/constants/regexp.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/utilities/common_utilities.dart';
import 'package:skeleton_231210/utilities/form/form_validators.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class ProxyInputTextWidget extends StatelessWidget {
  final String formControlName;
  final String label;
  final Widget? prefixLabel;
  final String? formGroupName;
  final bool denyEmoji;
  final String? topLabel;
  final bool obscureText;
  final bool alignLabelWithHint;
  final int? maxLength;
  final FocusNode? focusNode;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final List<TextInputFormatter> inputFormatters;
  final Color? borderColor;
  final Color? labelColor;
  final Color? textColor;
  final Color? fillColor;
  final Color errorColor;
  final ReactiveFormFieldCallback? onChanged;
  final VoidCallback? onSubmitted;
  final Widget? suffixIcon;

  const ProxyInputTextWidget({
    Key? key,
    required this.label,
    this.prefixLabel,
    this.topLabel,
    this.focusNode,
    this.maxLength,
    this.onSubmitted,
    this.onChanged,
    this.formGroupName,
    required this.formControlName,
    this.inputFormatters = const [],
    this.obscureText = false,
    this.alignLabelWithHint = true,
    this.denyEmoji = true,
    this.keyboardType = TextInputType.visiblePassword,
    this.textInputAction = TextInputAction.next,
    this.borderColor,
    this.textColor,
    this.fillColor = ThemeColors.tangerine100,
    this.labelColor,
    this.errorColor = ThemeColors.red,
    this.suffixIcon,
  }) : super(key: key);

  String get fullFormControlName => CommonUtilities.joinList([formGroupName, formControlName], separator: '.');

  @override
  Widget build(BuildContext context) {
    Widget textField = ReactiveTextField(
      autocorrect: false,
      focusNode: focusNode,
      minLines: keyboardType == TextInputType.multiline ? 3 : null,
      maxLines: keyboardType == TextInputType.multiline ? null : 1,
      obscureText: obscureText,
      keyboardType: keyboardType,
      textInputAction: textInputAction,
      onSubmitted: (_) => onSubmitted,
      onChanged: onChanged,
      inputFormatters: [...inputFormatters, if (denyEmoji) FilteringTextInputFormatter.deny(RegexpConstants.emoji)],
      formControlName: fullFormControlName,
      validationMessages: FormValidators.validationMessages(),
      style: TextStyle(
        color: textColor ?? ThemeColors.blackLight,
        fontFamily: ProxyConstants.getFontFamily(ProxyFontFamily.body),
        height: 1,
      ),
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        errorMaxLines: 2,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        alignLabelWithHint: alignLabelWithHint,
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.zero,
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: errorColor),
          borderRadius: BorderRadius.zero,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? ThemeColors.blackLight),
          borderRadius: BorderRadius.zero,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? ThemeColors.blackLight),
          borderRadius: BorderRadius.zero,
        ),
        counterStyle: TextStyle(color: borderColor),
        filled: fillColor != null,
        label: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (prefixLabel != null) ...[
              prefixLabel!,
              const ProxySpacingHorizontalWidget(size: ProxySpacing.small),
            ],
            ProxyTextWidget(
              text: label,
              fontSize: ProxyFontSize.small,
              color: labelColor ?? ThemeColors.grey,
            ),
          ],
        ),
        errorStyle: TextStyle(
          color: errorColor,
          fontFamily: ProxyConstants.getFontFamily(ProxyFontFamily.body),
          fontSize: ProxyConstants.getFontSize(ProxyFontSize.small),
        ),
        fillColor: fillColor,
        border: OutlineInputBorder(
          borderSide: BorderSide(color: borderColor ?? ThemeColors.blackLight),
          borderRadius: BorderRadius.zero,
        ),
      ),
    );

    if (topLabel?.isNotEmpty == true) {
      return Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: ProxyTextWidget(
              text: topLabel!,
              color: fillColor ?? ThemeColors.blackLight,
              fontSize: ProxyFontSize.large,
            ),
          ),
          const ProxySpacingVerticalWidget(size: ProxySpacing.small),
          textField,
        ],
      );
    }

    return textField;
  }
}
