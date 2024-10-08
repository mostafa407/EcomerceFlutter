abstract class ProductState{}
class ProductInitialState extends ProductState{}
class ProductLoadingState extends ProductState{}
class ProductSuccessState extends ProductState{}
class ProductErrorState extends ProductState{
  String message;
  ProductErrorState(this.message);
}
