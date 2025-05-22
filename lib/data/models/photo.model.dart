class Photo {
  final int albumId;
  final String thumbnailUrl;
  final String url;

  Photo({required this.albumId, required this.thumbnailUrl, required this.url});

  factory Photo.fromJson(Map<String, dynamic> json) =>
      Photo(albumId: json['albumId'], thumbnailUrl: json['thumbnailUrl'], url: json['url']);
}
