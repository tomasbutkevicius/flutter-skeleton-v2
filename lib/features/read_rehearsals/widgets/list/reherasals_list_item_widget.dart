import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:skeleton_231210/constants/proxy.dart';
import 'package:skeleton_231210/constants/settings.dart';
import 'package:skeleton_231210/features/read_rehearsals/models/rehearsal_teaser_model.dart';
import 'package:skeleton_231210/theme/theme_colors.dart';
import 'package:skeleton_231210/widgets/proxy/spacing/proxy_spacing_widget.dart';
import 'package:skeleton_231210/widgets/proxy/text/proxy_text_widget.dart';

class RehearsalsListItemWidget extends StatelessWidget {
  final RehearsalTeaserModel item;

  const RehearsalsListItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: ThemeColors.orange.withOpacity(0.2),
        child: Container(
          margin: const EdgeInsets.all(10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: ProxyTextWidget(
                  text: item.title,
                  fontSize: ProxyFontSize.extraLarge,
                  fontWeight: ProxyFontWeight.bold,
                ),
              ),
              const ProxySpacingVerticalWidget(
                size: ProxySpacing.small,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: ProxyTextWidget(
                  text: DateFormat(SettingsConstants.yearMonthDay).format(item.date),
                ),
              ),
              const ProxySpacingVerticalWidget(
                size: ProxySpacing.small,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
