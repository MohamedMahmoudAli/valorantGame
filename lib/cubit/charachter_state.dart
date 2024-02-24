part of 'charachter_cubit.dart';

@immutable
abstract class CharachterState {}

class CharachterInitial extends CharachterState {
  CharachterInitial();
}

class CharachterLoading extends CharachterState {
  CharachterLoading();
}

class CharachterLoaded extends CharachterState {
  List<CharachterModel> listCharachter;
  CharachterLoaded({required this.listCharachter});
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CharachterLoaded && other.listCharachter == listCharachter;
  }

  @override
  int get hashCode => listCharachter.hashCode;
}

class CharachterError extends CharachterState {
  final String message;

  CharachterError({
    required this.message
  });
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    return other is CharachterError && other.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
