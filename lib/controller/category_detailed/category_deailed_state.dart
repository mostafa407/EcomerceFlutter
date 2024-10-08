sealed class CategoryDetilesState{}
final class CategoryDetilesInitial extends CategoryDetilesState{}
final class CategoryDetailsLodaingState extends CategoryDetilesState{}
final class CategoryDetilsSuccessState extends CategoryDetilesState {}

final class CategoryDetailsErrorState extends CategoryDetilesState {
  String message;
  CategoryDetailsErrorState(this.message);
}
