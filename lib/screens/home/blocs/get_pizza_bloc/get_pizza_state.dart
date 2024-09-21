part of 'get_pizza_bloc.dart';

@immutable
sealed class GetPizzaState extends Equatable {
  const GetPizzaState();

  @override
  List<Object> get props => [];
}

final class GetPizzaInitial extends GetPizzaState {}

class GetPizzaFailure extends GetPizzaState {}

class GetPizzaLoading extends GetPizzaState {}

class GetPizzaSuccess extends GetPizzaState {

  final List<Pizza> pizzas;
  const GetPizzaSuccess(this.pizzas);

}
