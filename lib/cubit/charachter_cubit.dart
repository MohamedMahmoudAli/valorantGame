import 'dart:convert';

// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:valorantapp/data/model/ability_model.dart';
import 'package:valorantapp/data/model/role_model.dart';
import 'package:valorantapp/data/model/voisce_line.dart';
import 'package:valorantapp/data/repo/repo_layer.dart';

import '../data/model/charachter_model.dart';

part 'charachter_state.dart';

class CharachterCubit extends Cubit<CharachterState> {
  CharachterCubit(this.repoLayer) : super(CharachterInitial());
  final RepoLayer repoLayer;
  // ignore: non_constant_identifier_names
  Future<void> getCharchter() async {
    try {
      emit(CharachterLoading());
      final listOfCharchterModel = await charachterRequest();
      emit(CharachterLoaded(listCharachter: listOfCharchterModel));
    } catch (e) {
      emit(CharachterError(message: e.toString()));
    }
  }

  Future<List<CharachterModel>> charachterRequest() async {
    try {
      final response = await repoLayer.getAgent();
      if (response == null) {
        return [];
      }
      final responseDecode = json.decode(response.body);
      final data = responseDecode["data"] as List<CharachterModel>;
      final list = data
          .map((dynamic e) {
            final role = e["role"] ?? {};
            final roleInfo = Role(
                displayName: role['displayName'] ?? "",
                description: role['description'] ?? "",
                displayIcon: role['displayIcon'] ?? "",
                uuid: role['uuid'] ?? "");
            final ability = e['abilities'] as List<dynamic>;
            final abilityinfo = ability.map((dynamic a) {
              return Abilities(
                  slot: a['slot'] ?? "",
                  displayName: a['displayName'] ?? "",
                  description: a['description'] ?? "",
                  displayIcon: a['displayIcon'] ?? "");
            }).toList();
            abilityinfo
                .retainWhere((element) => element.displayIcon.isNotEmpty);

            final voiceLine = e['voiceLine'] ?? {};
            final voiceMediaList = voiceLine["mediaList"] as List;
            final voiceMedia = VoiceLine(voiceline: voiceMediaList[0]['wave']);
            return CharachterModel(
                displayName: e['displayName'] ?? "",
                displayIcon: e['displayIcon'] ?? "",
                description: e['description'] ?? "",
                fullPortrait: e['fullPortrait'] ?? "",
                voiceLine: voiceMedia,
                role: roleInfo,
                abilities: abilityinfo);
          })
          .toSet()
          .toList();
      list.retainWhere((element) => element.fullPortrait.isNotEmpty);

      return list;
    } catch (e) {
      print(e);
      e.toString();
    }
    return [];
  }
}
