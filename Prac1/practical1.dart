abstract class Playable {
  void play();
}

mixin Logger {
  void logDebug(String message) {
    print('DEBUG: $message');
  }

  void logInfo(String message) {
    print('INFO: $message');
  }

  void logWarning(String message) {
    print('WARNING: $message');
  }

  void logError(String message) {
    print('ERROR: $message');
  }
}

abstract class MediaItem implements Playable {
  String title;
  String artist;

  MediaItem(this.title, this.artist);

  void displayInfo() {
    print('$title by $artist');
  }
}

class Song extends MediaItem with Logger {
  Song(String title, String artist) : super(title, artist);

  @override
  void play() {
    print('Playing song: $title');
  }
}

class Album extends MediaItem with Logger {
  List<Song> songs;

  Album(String title, String artist, this.songs) : super(title, artist);

  @override
  void play() {
    print('Playing album: $title');
    for (var song in songs) {
      song.play();
    }
  }
}

class Playlist extends MediaItem with Logger {
  List<MediaItem> items;

  Playlist(String title, String artist, this.items) : super(title, artist);

  @override
  void play() {
    print('Playing playlist: $title');
    for (var item in items) {
      item.play();
    }
  }
}

void main() {
  var song = Song('Shape of You', 'Ed Sheeran');
  song.displayInfo();
  song.logInfo('Song is now playing.');
  song.play();

  var album = Album('1989', 'Taylor Swift', [
    Song('Shake It Off', 'Taylor Swift'),
    Song('Blank Space', 'Taylor Swift')
  ]);
  album.displayInfo();
  album.logDebug('Album is loading.');
  album.play();

  var playlist = Playlist('My Favorites', 'Various Artists', [song, album]);
  playlist.displayInfo();
  playlist
      .logWarning('Some songs in this playlist may contain explicit content.');
  playlist.play();
}
