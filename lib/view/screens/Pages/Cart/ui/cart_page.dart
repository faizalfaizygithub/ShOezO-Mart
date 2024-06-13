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
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Text('My Cart'),
        ),
        actions: [
          const Icon(
            Icons.shopping_cart,
            size: 28,
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Container(
          padding: const EdgeInsets.all(10),
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
      bottomSheet: Container(
        color: Colors.grey.shade300,
        padding: const EdgeInsets.only(left: 12, right: 10),
        height: 50,
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '50600',
              style: mediumTextStyle,
            ),
            Container(
              width: 150,
              height: 40,
              decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey),
              child: Center(
                child: Text(
                  'Check Out',
                  style: smallWhiteTextStyle,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
