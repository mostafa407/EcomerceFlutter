
sealed class AddCardState{}
final class AddCardInitial extends AddCardState {}

final class AddCardProductLoading extends AddCardState {}

final class AddCardProductSucess extends AddCardState
{
  String message;
  AddCardProductSucess(this.message);
}

final class AddCardProductError extends AddCardState {
  String messge;
  AddCardProductError(this.messge);
}
