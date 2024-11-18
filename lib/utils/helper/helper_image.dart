
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'helper.dart';

class HelperImage{

  static imageNetwork({required String imgUrl, required String errorImage}) {
    return CachedNetworkImage(
      imageUrl: imgUrl,
      fit: BoxFit.cover,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            //  colorFilter: const ColorFilter.mode(Colors.red, BlendMode.colorBurn),
          ),
        ),
      ),
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Helper.imageLoader(),
      errorWidget: (context, url, error) => SizedBox(
        child: SizedBox(
            child: Image.asset(errorImage)),
      ),
    );
  }

}