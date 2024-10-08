sealed class MyFavouriteProductState{}
final class MyFavouriteProductInitial extends MyFavouriteProductState{}
final class MyFavouriteLoadingState extends MyFavouriteProductState{}
final class MyFavouriteSuccessState extends MyFavouriteProductState{}
final class MyFavouriteErrorState extends MyFavouriteProductState{
  String message;
  MyFavouriteErrorState(this.message);
}