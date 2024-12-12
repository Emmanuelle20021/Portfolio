class Project {
  Project({
    required this.title,
    required this.images,
    required this.description,
    required this.urlGit,
    this.urlPlaystore,
    this.urlFigma,
  });

  final String title;
  final List<String> images;
  final String description;
  final String urlGit;
  final String? urlPlaystore;
  final String? urlFigma;
}
