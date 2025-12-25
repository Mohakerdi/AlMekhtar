abstract class AvailableState {}

class AvailableInitial extends AvailableState {}

class AvailableLoading extends AvailableState {}

class AvailableLoaded extends AvailableState {
  final List<dynamic> available;
  AvailableLoaded(this.available);
}

class AvailableError extends AvailableState {
  final String message;
  AvailableError(this.message);
}
