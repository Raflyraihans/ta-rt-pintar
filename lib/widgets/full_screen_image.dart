import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FullScreenImage extends StatelessWidget {
  final String image;
  const FullScreenImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: InteractiveViewer(
                panEnabled: true,
                minScale: 1,
                maxScale: 4,
                child: Hero(
                  tag: image,
                  child: CachedNetworkImage(
                      imageUrl: image,
                      fit: BoxFit.fitWidth,
                      placeholder: (context, err) {
                        return Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: CircularProgressIndicator(
                                  color: Colors.white),
                            ));
                      }),
                ),
              ),
            ),
            const Positioned(
              top: 12,
              left: 12,
              child: BackButton(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
