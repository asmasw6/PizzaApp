import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:flutter_application_1/screens/home/blocs/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:flutter_application_1/screens/home/views/details_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: Row(
          children: [
            Image.asset(
              'assets/images/8.png',
              scale: 14,
            ),
            SizedBox(
              width: screenWidth * .02,
            ),
            const Text(
              "PIZZA",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
          IconButton(
              onPressed: () {
                context.read<SignInBloc>().add(SignOutRequired());
              },
              icon: const Icon(CupertinoIcons.arrow_right_to_line)),
        ],
      ),
      body: builGridViewList(),
    );
  }

  Widget builGridViewList() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: BlocBuilder<GetPizzaBloc, GetPizzaState>(
        builder: (context, state) {
          if (state is GetPizzaSuccess) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 9 / 16,
              ),
              itemCount: state.pizzas.length,
              itemBuilder: (context, int index) {
                return Material(
                  elevation: 4,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                    20.0,
                  )),
                  child: InkWell(
                    // like make animation on sqaure
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(state.pizzas[index]),
                          ));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network(
                          state.pizzas[index].picture,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                          ),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: state.pizzas[index].isVeg
                                      ? Colors.green
                                      : Colors.red,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    state.pizzas[index].isVeg
                                        ? "VEG"
                                        : "NON-VEG",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * .02,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.green.shade100,
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 8,
                                  ),
                                  child: Text(
                                    state.pizzas[index].spicy == 1
                                        ? "🌶️ BLAND"
                                        : state.pizzas[index].spicy == 2
                                            ? "🌶️ BALANCE"
                                            : "🌶️ SPICY", // more than 2
                                    style: TextStyle(
                                      color: state.pizzas[index].spicy == 1
                                          ? Colors.green
                                          : state.pizzas[index].spicy == 2
                                              ? Colors.orange
                                              : Colors.redAccent
                                                  .shade400, // more than 2,
                                      fontWeight: FontWeight.w800,
                                      fontSize: 10,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10.0,
                          ),
                          child: Text(
                            state.pizzas[index].name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12.0, vertical: 6.0),
                          child: Text(
                            state.pizzas[index].description,
                            style: TextStyle(
                              //fontWeight: FontWeight.w300,
                              color: Colors.grey.shade700,
                              fontSize: 10,
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "💰${state.pizzas[index].price - (state.pizzas[index].price * (state.pizzas[index].discount) / 100.00)}",
                                      style: TextStyle(
                                        //fontWeight: FontWeight.w300,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .primary,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(
                                      "\$${state.pizzas[index].price}.00",
                                      style: TextStyle(
                                          //fontWeight: FontWeight.w300,
                                          color: Colors.grey.shade500,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w700,
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    // Add your onPressed action here
                                  },
                                  child: const Icon(
                                    CupertinoIcons.add_circled_solid,
                                    size: 16, // Adjust the size as needed
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is GetPizzaLoading) {
            return Center(
              child: CircularProgressIndicator(
                color: Theme.of(context).colorScheme.primary,
              ),
            );
          } else {
            return const Center(
              child: Text("An Error has ocuured ❌"),
            );
          }
        },
      ),
    );
  }
}
