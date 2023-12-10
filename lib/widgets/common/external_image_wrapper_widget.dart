import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:skeleton_231210/constants/icons.dart';
import 'package:skeleton_231210/utilities/image_utilities.dart';
import 'package:skeleton_231210/widgets/common/local_image_wrapper_widget.dart';

class ExternalImageWrapperWidget extends StatelessWidget {
  final String path;
  final Widget? errorWidget;
  final double? width;
  final double? height;

  const ExternalImageWrapperWidget({
    Key? key,
    required this.path,
    this.width,
    this.height,
    this.errorWidget,
  }) : super(key: key);

  Widget _buildError(BuildContext context, String url, dynamic error) {
    return errorWidget ??
        Center(
          child: SizedBox(
            width: 60.0,
            height: 60.0,
            child: SvgPicture.asset(
              IconsConstants.notFound,
            ),
          ),
        );
  }

  Widget _buildPlaceholder(BuildContext context, String url, DownloadProgress progress) {
    return const LocalImageWrapperWidget(image: IconsConstants.notFound);
  }

  @override
  Widget build(BuildContext context) {
    if (path.endsWith('svg')) {
      return SvgPicture.network(
        path,
        headers: ImageUtilities.getHeaders(),
      );
    }

    return CachedNetworkImage(
      imageUrl: path,
      width: width,
      height: height,
      fit: BoxFit.fill,
      errorWidget: _buildError,
      progressIndicatorBuilder: _buildPlaceholder,
      httpHeaders: ImageUtilities.getHeaders(),
    );
  }
}
