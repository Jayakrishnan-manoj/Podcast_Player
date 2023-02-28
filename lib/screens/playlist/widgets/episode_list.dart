import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:podcast_player/models/episode.dart';
import 'package:podcast_player/scoped_models/scoped_playlist.dart';
import 'package:scoped_model/scoped_model.dart';

typedef EpisodeListTapCallBack = void Function(Episode e);

class EpisodeList extends StatelessWidget {
  final EpisodeListTapCallBack onItemTap;

  EpisodeList(this.onItemTap);

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedPlaylist>(
      builder: (context, child, ScopedModel) => Expanded(
        child: ListView(
          children:
              ScopedModel.episodes.map((e) => _playerListViewItem(e)).toList(),
        ),
      ),
    );
  }

  Widget _playerListViewItem(Episode e) {
    return GestureDetector(
      onTap: () => onItemTap(e),
      child: _playerListViewItemSubTitle(e),
    );
  }

  Widget _playerListViewItemSubTitle(Episode e) {
    final subTitle = (e.isPlaying ? '[PLAYING]' : '') + e.podcast.name;

    return Container(
      padding: const EdgeInsets.fromLTRB(15.0, 15.0, 25.0, 25.0),
      child: Text(
        subTitle,
        style: const TextStyle(fontSize: 18),
      ),
    );
  }
}
