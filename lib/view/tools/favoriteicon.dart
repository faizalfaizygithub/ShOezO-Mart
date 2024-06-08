import 'package:flutter/material.dart';
import 'package:ui/model/productDataModel.dart';
import 'package:ui/view/screens/Pages/DetailsPage/bloc/details_bloc.dart';

class HeartIcon extends StatefulWidget {
  final DisplayProductModel displayProductModel;
  const HeartIcon({super.key, required this.displayProductModel});

  @override
  State<HeartIcon> createState() => _HeartIconState();
}

class _HeartIconState extends State<HeartIcon> with TickerProviderStateMixin {
  final DetailsBloc detailsBloc = DetailsBloc();

  AnimationController? _controller;
  Animation<Color?>? _coloranimation;
  Animation<double?>? _sizeAnimation;
  bool isFav = false;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 500), vsync: this);

    _coloranimation = ColorTween(begin: Colors.grey.shade400, end: Colors.red)
        .animate(_controller!);

    _sizeAnimation = TweenSequence(<TweenSequenceItem<double>>[
      TweenSequenceItem<double>(tween: Tween(begin: 30, end: 50), weight: 30),
      TweenSequenceItem<double>(tween: Tween(begin: 50, end: 30), weight: 30),
    ]).animate(_controller!);

    _controller!.addListener(() {
      print(_controller!.value);
      print(_coloranimation!.value);

      _controller!.addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            isFav = true;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(() {
            isFav = false;
          });
        }
      });
    });
    super.initState();

    // _controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller!,
        builder: (context, child) {
          return IconButton(
            onPressed: () {
              setState(() {
                isFav ? _controller!.reverse() : _controller!.forward();
                isFav
                    ? detailsBloc.add(FavoriteButtonClickedRemoveEvent(
                        clickedProduct: widget.displayProductModel))
                    : detailsBloc.add(FavoriteButtonClickedEvent(
                        clickedProduct: widget.displayProductModel));
              });
            },
            icon: Icon(
              Icons.favorite,
              color: _coloranimation!.value,
              size: _sizeAnimation!.value,
            ),
          );
        });
  }
}
