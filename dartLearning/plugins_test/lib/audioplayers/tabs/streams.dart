import 'package:audioplayers/audioplayers.dart';
import 'package:plugins_test/audioplayers/components/player_widget.dart';
import 'package:plugins_test/audioplayers/components/properties_widget.dart';
import 'package:plugins_test/audioplayers/components/stream_widget.dart';
import 'package:plugins_test/audioplayers/components/tab_content.dart';
import 'package:flutter/material.dart';

class StreamsTab extends StatelessWidget {
  final AudioPlayer player;

  const StreamsTab({
    required this.player,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabContent(
      children: [
        PlayerWidget(player: player),
        const Divider(),
        StreamWidget(player: player),
        const Divider(),
        PropertiesWidget(player: player),
      ],
    );
  }
}