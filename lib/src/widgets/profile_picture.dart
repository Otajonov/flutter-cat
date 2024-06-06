import 'dart:math';
import 'package:flutter/material.dart';

class ProfilePicture extends StatelessWidget {
  final String? imageUrl;
  final double? size;
  final String? letter;
  final Color? color;
  final double? radius;
  final VoidCallback? onTap;

  const ProfilePicture({
    super.key,
    this.imageUrl,
    this.size,
    this.letter,
    this.color,
    this.radius,
    this.onTap
  });

  @override
  Widget build(BuildContext context) {
    // Use the provided size or default to 40.0 if not provided
    final double displaySize = size ?? 40;
    // Calculate borderRadius for roundness, default to displaySize / 2 for a perfect circle
    final double effectiveBorderRadius = radius ?? displaySize / 2;
    return GestureDetector(
      onTap: onTap,
        child: Container(
      width: displaySize,
      height: displaySize,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(effectiveBorderRadius),
      ),
      clipBehavior: Clip.antiAlias, // Ensures the child is clipped to borderRadius
      child: imageUrl != null
          ? FadeInImage.assetNetwork(
        placeholder: Theme.of(context).brightness == Brightness.light ? "packages/cat/lib/assets/images/placeholder_light.webp" : "packages/cat/lib/assets/images/placeholder_dark.webp", // Placeholder image in assets
        image: imageUrl!,
        fit: BoxFit.cover,
        width: displaySize,
        height: displaySize,
        fadeInDuration: const Duration(milliseconds: 250),
        fadeOutDuration: const Duration(milliseconds: 150),
        imageErrorBuilder: (context, error, stackTrace) => _errorWidget(displaySize),
      )
          : _errorWidget(displaySize),
    ));
  }

  Widget _errorWidget(double size) {
    return Container(
      width: size,
      height: size,
      color: color ?? _getRandomColor(),
      child: Center(
        child: Text(
          letter ?? 'A',
          style: TextStyle(
            color: Colors.white,
            fontSize: size / 2, // Adjust font size based on the container size
          ),
        ),
      ),
    );
  }

  Color _getRandomColor() {
    Random random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }
}
