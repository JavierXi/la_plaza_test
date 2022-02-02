import 'package:flutter/material.dart';
import 'package:la_plaza/utils/colors.dart' as color;

class ItemDetails extends StatefulWidget {
  final dynamic picture;
  final String itemName;
  final int price;
  final int discount;
  final String description;

  const ItemDetails({
    Key? key,
    required this.picture,
    required this.itemName,
    required this.price,
    required this.discount,
    required this.description,
  }) : super(key: key);

  @override
  _ItemDetailsState createState() => _ItemDetailsState();
}

class _ItemDetailsState extends State<ItemDetails> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decreaseCounter() {
    if (_counter > 0) {
      setState(() {
        _counter--;
      });
    } else {
      null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: color.AppColor.backgroundColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            color: color.AppColor.darkGrayColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          widget.itemName,
          style: TextStyle(
            color: color.AppColor.darkGrayColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 180,
                  height: 180,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: color.AppColor.lightGreenColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 180,
                  width: 180,
                  child: widget.picture,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Stack(
              children: [
                SizedBox(
                  width: 75,
                  height: 75,
                  child: Center(
                    child: CircularProgressIndicator(
                      color: color.AppColor.lightGreenColor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                  width: 75,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: widget.picture,
                  ),
                ),
              ],
            ),
            Container(
              width: size.width,
              margin: const EdgeInsets.fromLTRB(20, 30, 20, 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: color.AppColor.companyWhiteColor,
                boxShadow: [
                  BoxShadow(
                    color: color.AppColor.companyBlackColor.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: const Offset(0, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(5),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          children: [
                            Text(
                              widget.itemName,
                              style: TextStyle(
                                color: color.AppColor.darkGrayColor,
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.favorite_outline_rounded,
                        color: color.AppColor.darkGrayColor.withOpacity(0.4),
                        size: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    widget.description,
                    style: TextStyle(
                      color: color.AppColor.darkGrayColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  widget.discount != 0
                      ? Text(
                          '\$' + widget.price.toString() + '.00 COP',
                          style: TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: color.AppColor.companyRedColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      : const SizedBox(),
                  const SizedBox(height: 10),
                  Text(
                    '\$' +
                        (widget.price * (1 - (widget.discount / 100)))
                            .toString() +
                        '0 COP',
                    style: TextStyle(
                      color: color.AppColor.lightGreenColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    height: 45,
                    width: size.width * 0.9,
                    decoration: BoxDecoration(
                      color: color.AppColor.companyWhiteColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              color.AppColor.companyBlackColor.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset: const Offset(0, 1),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          onPressed: () {
                            _decreaseCounter();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_down_rounded,
                            size: 30,
                            color:
                                color.AppColor.darkGrayColor.withOpacity(0.5),
                          ),
                        ),
                        Text(
                          _counter.toString(),
                          style: TextStyle(
                            color:
                                color.AppColor.darkGrayColor.withOpacity(0.8),
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            _incrementCounter();
                          },
                          icon: Icon(
                            Icons.keyboard_arrow_up_rounded,
                            size: 30,
                            color:
                                color.AppColor.darkGrayColor.withOpacity(0.5),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton.icon(
                      label: const Text('Añadir al carrito'),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 25,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        textStyle: TextStyle(
                          color: color.AppColor.companyWhiteColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                        primary: color.AppColor.lightGreenColor,
                      ),
                      icon: Icon(
                        Icons.shopping_basket_outlined,
                        color: color.AppColor.companyWhiteColor,
                        size: 25,
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Descripción',
                        style: TextStyle(
                          color: color.AppColor.darkGrayColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 30,
                          color: color.AppColor.darkGrayColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
