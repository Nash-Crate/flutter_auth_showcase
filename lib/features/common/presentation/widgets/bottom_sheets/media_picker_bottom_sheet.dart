import 'package:flutter/material.dart';

/// Media picker from camera or gallery
class MediaPickerBottomSheet extends StatelessWidget {
  /// Constructor
  const MediaPickerBottomSheet({
    required this.takeImageFromCamera,
    required this.takeVideoFromCamera,
    required this.pickImageFromGallery,
    required this.pickVideoFromGallery,
    super.key,
  });

  /// Callback to take image from camera
  final VoidCallback takeImageFromCamera;

  /// Callback to take video from camera
  final VoidCallback takeVideoFromCamera;

  /// Callback to take image from gallery
  final VoidCallback pickImageFromGallery;

  /// Callback to take video from gallery
  final VoidCallback pickVideoFromGallery;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Container(
                width: 50,
                height: 6,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),

            // Padding(
            //   padding: const EdgeInsets.symmetric(vertical: 10),
            //   child: Text(
            //     'Pick media',
            //     style: context.textTheme.titleLarge,
            //   ),
            // ),
            // const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera (Image)'),
              onTap: () {
                takeImageFromCamera();
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Camera (Video)'),
              onTap: () {
                takeVideoFromCamera();
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Gallery (Image)'),
              onTap: () {
                pickImageFromGallery();
                Navigator.of(context).pop();
              },
            ),

            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Gallery (Video)'),
              onTap: () {
                pickVideoFromGallery();
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
