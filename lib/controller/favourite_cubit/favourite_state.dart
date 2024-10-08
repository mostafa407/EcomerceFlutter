sealed class FavouriteState{}
final class FavouriteIntial extends FavouriteState{}
final class FavouriteSateSucceed extends FavouriteState{
  String message;
  FavouriteSateSucceed(this.message);
}
final class FavouriteLoadingState extends FavouriteState{}
final class FavouriteErrorState extends FavouriteState{}

