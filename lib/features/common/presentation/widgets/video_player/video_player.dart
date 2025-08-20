import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_showcase/features/common/common.dart';
import 'package:flutter_showcase/logger.dart';
import 'package:video_player/video_player.dart';

/// Video player widget
class AppVideoPlayer extends StatefulWidget {
  /// constructor
  const AppVideoPlayer({required this.mediaPath, this.isNetwork = false, super.key});

  /// Media file path
  final String mediaPath;

  /// Whether the video is from the network
  final bool isNetwork;

  @override
  State<AppVideoPlayer> createState() => _AppVideoPlayerState();
}

class _AppVideoPlayerState extends State<AppVideoPlayer> {
  late VideoPlayerController _controller;
  double _videoPosition = 0;

  @override
  void initState() {
    super.initState();

    _controller =
        (widget.isNetwork
              ? VideoPlayerController.networkUrl(Uri.parse(widget.mediaPath))
              : VideoPlayerController.file(File(widget.mediaPath)))
          ..initialize()
              .then((_) {
                // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                setState(() {});
              })
              .onError(
                (error, stackTrace) {
                  logger.e(error);
                  showErrorNotification('Error loading video: $error');
                },
              );

    _controller.addListener(() {
      if (mounted) {
        final videoPosition =
            _controller.value.position.inSeconds / _controller.value.duration.inSeconds;
        if (_videoPosition != videoPosition) {
          setState(() {
            _videoPosition = videoPosition;
          });
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          if (_controller.value.isInitialized)
            AspectRatio(
              aspectRatio: _controller.value.aspectRatio,
              child: VideoPlayer(_controller),
            )
          else
            Container(),

          Row(
            children: [
              IconButton(
                onPressed: _controller.value.isInitialized
                    ? () {
                        setState(
                          () {
                            _controller.value.isPlaying ? _controller.pause() : _controller.play();
                          },
                        );
                      }
                    : null,
                icon: Icon(_controller.value.isPlaying ? Icons.pause : Icons.play_arrow),
              ),

              Expanded(
                child: LinearProgressIndicator(
                  value: _controller.value.isInitialized ? _videoPosition : 0.0,
                  minHeight: 5,
                  valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
