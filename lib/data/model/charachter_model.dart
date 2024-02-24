import 'package:valorantapp/data/model/ability_model.dart';
import 'package:valorantapp/data/model/role_model.dart';
import 'package:valorantapp/data/model/voisce_line.dart';

class CharachterModel {
  String description, displayName, displayIcon, fullPortrait;
  List<Abilities> abilities;
  VoiceLine voiceLine;
  Role role;
  CharachterModel(
      {required this.displayName,
      required this.displayIcon,
      required this.description,
      required this.fullPortrait,
      required this.voiceLine,
      required this.role,
      required this.abilities});
}
