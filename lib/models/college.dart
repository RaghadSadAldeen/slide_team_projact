import 'package:slide_team_project/models/major.dart';

class College {
  final String name;
  final String imageUrl;
  final List<Major> majors;

  College({required this.name, required this.imageUrl, required this.majors});
}