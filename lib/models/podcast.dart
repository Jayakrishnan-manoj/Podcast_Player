import 'package:podcast_player/models/episode.dart';

class Podcast {
  String name;
  List<Episode> episodes = [];

  Podcast(this.name);

  static List<Podcast> fetchAll() {
    var p1 = Podcast('Tim Sneath talks tips and takeaways');
    p1.episodes = [
      Episode(p1, "Product management"),
      Episode(p1, "de ble bla ble"),
      Episode(p1, "de blu bla ble"),
    ];
    var p2 = Podcast("Somebody educates on something");
    p2.episodes = [
      Episode(p2, "Evolving engineering"),
      Episode(p2, "de ble bla engineering"),
      Episode(p2, "de blu bla engineering"),
    ];
    var p3 = Podcast("Somebody speaks on Monologues");
    p3.episodes = [
      Episode(p3, "Mastering Monologues"),
      Episode(p3, "de ble bla Monologues"),
      Episode(p3, "de blu bla Monologues"),
    ];

    return [p1,p2,p3];
  }
}
