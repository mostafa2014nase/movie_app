import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/core/app_constants.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double height;
  final double width;
  final BoxFit fit;
  CustomImage({required this.image,required this.height,required this.width, this.fit = BoxFit.cover});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image, height: height, width: width, fit: fit,
      placeholder: (context, url) => Image.asset(Images.placeholder, height: height, width: width, fit: fit),
      errorWidget: (context, url, error) => Image.asset(Images.placeholder, height: height, width: width, fit: fit),
    );
  }
}


class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper({required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}

class RatingBar extends StatelessWidget {
  final double rating;
  final double size;
  final double ratingCount;
  RatingBar({required this.rating, required this.ratingCount, this.size = 18});

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];
    List<Widget> _rateList = [];

    int realNumber = rating.floor()~/2;
    int partNumber = ((rating - realNumber) * 10).ceil();
    int actual = (ratingCount.floor())~/2;
    realNumber = realNumber - actual;

    print(realNumber);
    print(actual);

    for (int i = 0; i < actual; i++) {
      _starList.add(SizedBox(
        height: size,
        width: size,
        child: Icon(Icons.star, color: Theme.of(context).primaryColor, size: size),
      ));
    }

    for (int i = 0; i < realNumber; i++) {
      _starList.add(SizedBox(
        height: size,
        width: size,
        child: Icon(Icons.star,color: Colors.grey, size: size),
      ));
    }



    _starList.add(Padding(
      padding: EdgeInsets.only(left: 3.0),
      child: Text('($ratingCount)', style: TextStyle(fontSize: size*0.8, color: Theme.of(context).disabledColor))),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}