import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ui/view/screens/Pages/Boots/ui/boots_page.dart';
import 'package:ui/view/screens/Pages/Home/bloc/home_bloc.dart';
import 'package:ui/view/screens/Pages/Shoes/ui/shoes_page.dart';
import 'package:ui/view/screens/Pages/Slippers/UI/slipers_page.dart';
import 'package:ui/view/screens/Pages/Watches/ui/watches_page.dart';
import 'package:ui/view/tools/assets.dart';
import 'package:ui/view/tools/carousel.dart';
import 'package:ui/view/tools/myTextStyle.dart';
import 'package:ui/view/tools/my_product_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.only(top: 40),
      top: true,
      child: Scaffold(
        appBar: appBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CarouselScreen(
                  photos: bannerspic,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Categories', style: mediumTextStyle),
                const SizedBox(
                  height: 13,
                ),
                allCategorySec(),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Most Popular', style: mediumTextStyle),
                    TextButton(
                      onPressed: () {},
                      child: Text('See all >', style: smallTextStyle),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 13,
                ),
                homeDisplayProductSec()
              ],
            ),
          ),
        ),
        drawer: const Drawer(),
      ),
    );
  }

  homeDisplayProductSec() {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listener: (context, state) {},
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(child: CircularProgressIndicator());
          case HomeSuccessLoadedState:
            final data = state as HomeSuccessLoadedState;
            return GridView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                controller: ScrollController(),
                itemCount: data.displyProducts!.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 0.6, crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: MyProductTile(
                      homeDisplayProductModel: data.displyProducts![index],
                      // homeBloc: homeBloc,
                    ),
                  );
                });
          case HomeErrorState:
            return const Center(
              child: Text('internet slow'),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }

  allCategorySec() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            categories('Shoes', () {
              Get.to(const ShoesPage(), duration: const Duration(seconds: 2));
            }),
            gyap(),
            categories('Slippers', () {
              Get.to(const SlippersPage(),
                  duration: const Duration(seconds: 2));
            }),
            gyap(),
            categories('Boots', () {
              Get.to(const BootsPage(), duration: const Duration(seconds: 2));
            }),
            gyap(),
            categories('Watches', () {
              Get.to(const WatchesPage(), duration: const Duration(seconds: 2));
            }),
            gyap(),
          ],
        ),
      ),
    );
  }

  appBar() {
    return AppBar(
      title: const Text(
        'Shoezo',
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_outlined,
            size: 28,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.shopping_cart_outlined,
            size: 28,
          ),
        ),
      ],
      bottom: PreferredSize(
          preferredSize: const Size(300, 50),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              style: const TextStyle(fontSize: 12),
              cursorHeight: 20,
              decoration: InputDecoration(
                  fillColor: Colors.grey.shade400,
                  filled: true,
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search your product?',
                  hintStyle: smallTextStyle,
                  contentPadding: const EdgeInsets.all(4),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide(color: Colors.grey.shade300)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
            ),
          )),
    );
  }

  categories(String txt, Function() ontap) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 35,
        width: 120,
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black54),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(txt, overflow: TextOverflow.fade, style: smallTextStyle),
        ),
      ),
    );
  }

  gyap() {
    return const SizedBox(
      width: 10,
    );
  }
}
