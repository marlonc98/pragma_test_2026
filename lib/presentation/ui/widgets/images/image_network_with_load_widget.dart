import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class ImageNetworkWithLoadWidget extends StatefulWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  final String? defaultImage;
  final Map<String, String>? headers;
  final bool notShowDefaultImage;
  final bool useCache;

  const ImageNetworkWithLoadWidget(
    this.imageUrl, {
    super.key,
    this.height,
    this.width,
    this.defaultImage,
    this.fit = BoxFit.cover,
    this.headers,
    this.useCache = false,
    this.notShowDefaultImage = false,
  });

  @override
  State<ImageNetworkWithLoadWidget> createState() =>
      _ImageNetworkWithLoadWidgetState();
}

class _ImageNetworkWithLoadWidgetState
    extends State<ImageNetworkWithLoadWidget> {
      
  bool _isWeb() {
    return widget.imageUrl.startsWith('http') ||
        widget.imageUrl.startsWith('https');
  }

  bool _isLocal() {
    return widget.imageUrl.startsWith('assets/') ||
        widget.imageUrl.startsWith('file:') ||
        widget.imageUrl.startsWith('blob:');
  }

  void _saveIsCache() {
    if (widget.useCache && _isWeb()) {
      DefaultCacheManager()
          .getSingleFile(widget.imageUrl, headers: widget.headers)
          .then((file) {})
          .catchError((e) {});
    }
  }

  @override
  void initState() {
    super.initState();
    if (_isWeb() && widget.useCache) {
      _saveIsCache();
    }
  }

  Widget _buildDefaultOrSvg() {
    if(widget.notShowDefaultImage) {
      return const SizedBox.shrink();
    }
    if (widget.defaultImage != null) {
      return Image.asset(
        widget.defaultImage!,
        height: widget.height ?? 250,
        fit: widget.fit,
        width: widget.width ?? double.infinity,
      );
    }
    return SizedBox(
      height: widget.height ?? 250,
      width: widget.width ?? double.infinity,
      child: Container(
        color: Colors.grey[200],
        child: Center(
          child: Opacity(
            opacity: 0.3,
            child: CircularProgressIndicator(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return SizedBox(
      height: widget.height,
      width: widget.width,
      child: Container(
        color: Colors.grey[200],
        child: const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isWeb() && widget.useCache) {
      return FutureBuilder<File>(
        future: DefaultCacheManager().getSingleFile(widget.imageUrl, headers: widget.headers),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return _buildLoading();
          } else if (snapshot.hasError || !snapshot.hasData || snapshot.data == null) {
            return _buildDefaultOrSvg();
          } else {
            return Image.file(
              snapshot.data!,
              fit: widget.fit,
              width: widget.width,
              height: widget.height,
              errorBuilder: (context, error, stackTrace) => _buildDefaultOrSvg(),
            );
          }
        },
      );
    }

    return Image(
      image: _isWeb()
          ? NetworkImage(widget.imageUrl, headers: widget.headers)
              as ImageProvider<Object>
          : (_isLocal()
              ? AssetImage(widget.imageUrl) as ImageProvider<Object>
              : FileImage(File(widget.imageUrl)) as ImageProvider<Object>),
      fit: widget.fit,
      width: widget.width,
      height: widget.height,
      errorBuilder: (context, error, stackTrace) => _buildDefaultOrSvg(),
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return _buildLoading();
      },
    );
  }
}