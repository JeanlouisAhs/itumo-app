class Video {
  final String? id;
  final String? title;
  final String? coverImage;
  final String? publishedAt;
  final List<Tag>? tags;
  final String? videoUrl;
  final String? description;
  final int? duration;

  Video({
    this.id,
    this.title,
    this.coverImage,
    this.publishedAt,
    this.tags,
    this.videoUrl,
    this.description,
    this.duration,
  });
}

class Tag {
  final String name;

  Tag(this.name);
}
