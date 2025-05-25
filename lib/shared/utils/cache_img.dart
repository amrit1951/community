import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

cacheImage({required img}) {
  return CachedNetworkImage(
    placeholder: (context, url) => const CircularProgressIndicator(),
    imageUrl: img,
  );
}
