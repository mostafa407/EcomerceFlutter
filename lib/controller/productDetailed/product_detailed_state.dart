part of 'product_detailed_cubit.dart';

@immutable
sealed class ProductDetailedState {}

final class ProductDetailedInitial extends ProductDetailedState {}
final class ProductDetailedLoading extends ProductDetailedState{}
final class ProductDetailedSuccess extends ProductDetailedState{}
final class ProductDetailedError extends ProductDetailedState{}
