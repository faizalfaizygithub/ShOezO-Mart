import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui/view/screens/Pages/Cart/bloc/cart_bloc.dart';
import 'package:ui/view/screens/Pages/Cart/ui/cart_tile.dart';
import 'package:ui/view/tools/myTextStyle.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Cart'),
          actions: [
            Icon(
              Icons.shopping_cart,
              size: 28,
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        body: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: BlocConsumer<CartBloc, CartState>(
              bloc: cartBloc,
              listener: (context, state) {},
              listenWhen: (previous, current) => current is CartActionState,
              buildWhen: (previous, current) => current is! CartActionState,
              builder: (context, state) {
                switch (state.runtimeType) {
                  case CartSuccessState:
                    final cartData = state as CartSuccessState;
                    return cartData.cartItems.isEmpty
                        ? Center(
                            child: Text(
                              'Your cart is empty',
                              style: smallTextStyle,
                            ),
                          )
                        : ListView.builder(
                            itemCount: cartData.cartItems.length,
                            itemBuilder: (context, index) {
                              return MyCartTile(
                                  cartBloc: CartBloc(),
                                  homeDisplayProductModel:
                                      cartData.cartItems[index]);
                            });

                  default:
                    return Container();
                }
              },
            )),
      ),
    );
  }
}
