sealed class SearchProductState{}
final class SearchInitial extends SearchProductState{}
final class SearchLoadingState extends SearchProductState{}
final class SearchSuccedState extends SearchProductState{}
final class SearchErrorState extends SearchProductState{
  String message;
  SearchErrorState(this.message);
}
