abstract class CategoryState{}
class CategoryInitState extends CategoryState{}
class CategoryLoadingState extends CategoryState{}
class CategorySuccessState extends CategoryState{}
class CategoryErrorState extends CategoryState{
  String message;
  CategoryErrorState(this.message);
}