import 'package:flutter/material.dart';
import 'package:la_plaza/homepage/ui/widgets/item_details.dart';
import 'package:la_plaza/utils/colors.dart' as color;

class ItemWidget extends StatefulWidget {
  final dynamic picture;
  final String discount;
  final String itemName;
  final String price;
  final String description;
  const ItemWidget({
    Key? key,
    required this.picture,
    required this.discount,
    required this.itemName,
    required this.price,
    required this.description,
  }) : super(key: key);

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.45,
      height: (size.width * 0.45) * 1.7,
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 5,
      ),
      padding: const EdgeInsets.only(top: 15),
      decoration: BoxDecoration(
        color: color.AppColor.companyWhiteColor,
        boxShadow: [
          BoxShadow(
            color: color.AppColor.companyBlackColor.withOpacity(0.2),
            spreadRadius: 0,
            blurRadius: 1,
            offset: const Offset(1, 1),
          ),
        ],
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemDetails(
                    picture: widget.picture,
                    itemName: widget.itemName,
                    price: int.parse(widget.price),
                    discount: int.parse(widget.discount),
                    description: widget.description,
                  ),
                ),
              );
            },
            child: int.parse(widget.discount) != 0
                ? Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      Positioned(
                        left: 2,
                        bottom: 0,
                        child: Container(
                          width: size.width * 0.2,
                          height: size.width * 0.1 + 5,
                          decoration: BoxDecoration(
                            color:
                                color.AppColor.lightGreenColor.withOpacity(0.9),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: color.AppColor.lightGreenColor,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.4,
                        height: size.width * 0.4,
                        margin: const EdgeInsets.only(left: 7),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: widget.picture,
                        ),
                      ),
                      Positioned(
                        left: 2,
                        bottom: 0,
                        child: Container(
                          width: size.width * 0.2,
                          height: size.width * 0.1,
                          decoration: BoxDecoration(
                            color: color.AppColor.lightGreenColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              widget.discount.toString() + '%',
                              maxLines: 1,
                              style: TextStyle(
                                color: color.AppColor.companyWhiteColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    width: size.width * 0.4,
                    height: size.width * 0.4,
                    margin: const EdgeInsets.only(left: 7),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: widget.picture,
                    ),
                  ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.itemName,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color.AppColor.companyBlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$' + widget.price.toString() + '.00 COP',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: int.parse(widget.discount) != 0
                        ? color.AppColor.companyRedColor
                        : color.AppColor.companyWhiteColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '\$' +
                      (int.parse(widget.price) *
                              (1 - (int.parse(widget.discount) / 100)))
                          .toString() +
                      '0 COP',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: color.AppColor.companyBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.favorite_outline_rounded,
                        color: color.AppColor.darkGrayColor.withOpacity(0.4),
                        size: 25,
                      ),
                      Icon(
                        Icons.shopping_basket_outlined,
                        color: color.AppColor.darkGrayColor.withOpacity(0.4),
                        size: 25,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
