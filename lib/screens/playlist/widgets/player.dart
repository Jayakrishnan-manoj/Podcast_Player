import 'package:flutter/material.dart';

import 'package:podcast_player/scoped_models/scoped_playlist.dart';
import 'package:scoped_model/scoped_model.dart';

class Player extends StatelessWidget {
  final height = 200;
  final textStyle = const TextStyle(
    color: Colors.white,
    fontSize: 18,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.indigo),
      height: height.toDouble(),
      padding: const EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      child: ScopedModelDescendant<ScopedPlaylist>(
        builder: (context, child, ScopedModel) => _playerPanel(ScopedModel),
      ),
    );
  }

  Widget _playerPanel(ScopedPlaylist scopedModel) {
    var label1 = '';
    var label2 = '';
    var label3 = '';
    if (scopedModel.selectedEpisode != null) {
      label1 = 'Now Playing...';
      label2 = scopedModel.selectedEpisode!.podcast.name;
      label3 = scopedModel.selectedEpisode!.title;
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _textLabel(label1),
        _textLabel(label2),
        _textLabel(label3),
      ],
    );
  }

  Widget _textLabel(String text) {
    return Text(
      text,
      style: textStyle,
    );
  }
}
