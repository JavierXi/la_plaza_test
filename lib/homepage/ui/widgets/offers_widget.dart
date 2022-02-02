import 'package:flutter/material.dart';
import 'package:la_plaza/homepage/ui/widgets/item_widget.dart';

class OffersWidget extends StatefulWidget {
  final dynamic picture;
  final int discount;
  final String itemName;
  final int price;
  final int discountPrice;
  final String description;
  const OffersWidget({
    Key? key,
    required this.picture,
    required this.discount,
    required this.itemName,
    required this.price,
    required this.discountPrice,
    required this.description,
  }) : super(key: key);

  @override
  _OffersWidgetState createState() => _OffersWidgetState();
}

class _OffersWidgetState extends State<OffersWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Row(
            children: [
              const SizedBox(width: 10),
              ItemWidget(
                picture: widget.picture,
                discount: widget.discount.toString(),
                itemName: widget.itemName,
                price: widget.price.toString(),
                description: widget.description,
              ),
              ItemWidget(
                picture: widget.picture,
                discount: widget.discount.toString(),
                itemName: widget.itemName,
                price: widget.price.toString(),
                description: widget.description,
              ),
              ItemWidget(
                picture: widget.picture,
                discount: widget.discount.toString(),
                itemName: widget.itemName,
                price: widget.price.toString(),
                description: widget.description,
              ),
            ],
          ),
        )
      ],
    );
  }
}
