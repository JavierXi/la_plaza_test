import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_plaza/homepage/repository/data_api.dart';
import 'package:la_plaza/homepage/ui/widgets/data_model.dart';
import 'package:la_plaza/homepage/ui/widgets/item_widget.dart';
import 'package:la_plaza/homepage/ui/widgets/search_field.dart';
import 'package:la_plaza/utils/colors.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final logo = 'assets/la_plaza_logo.png';
  late List<Data> itemsList = [];
  String query = '';

  @override
  void initState() {
    super.initState();
    searchNetworkItem(query);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: color.AppColor.backgroundColor,
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          toolbarHeight: 80,
          backgroundColor: color.AppColor.backgroundColor,
          title: Image.asset(
            logo,
            width: size.width * 0.5,
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 20),
              buildSearch(),
              const SizedBox(height: 25),
              Row(
                children: [
                  Text(
                    '  Todos los productos',
                    style: TextStyle(
                      color: color.AppColor.companyBlackColor,
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              FutureBuilder<List<Data>>(
                future: DataApi.getInternetData(),
                builder: (context, snapshot) {
                  final items = snapshot.data;
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return SizedBox(
                        height: size.height / 2,
                        width: size.width,
                        child: Center(
                          child: CircularProgressIndicator(
                            color: color.AppColor.lightGreenColor,
                          ),
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Column(
                          children: [
                            const SizedBox(height: 70),
                            Icon(
                              Icons.error_rounded,
                              color: color.AppColor.lightGreenColor,
                              size: 130,
                            ),
                            Text(
                              'Lo sentimos\nParece que ha ocurrido un error',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: color.AppColor.companyBlackColor,
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        );
                      } else {
                        ConnectionState.done;
                        return itemsList.isEmpty
                            ? Column(
                                children: [
                                  const SizedBox(height: 70),
                                  Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Icon(
                                        Icons.search_rounded,
                                        color: color.AppColor.lightGreenColor,
                                        size: 130,
                                      ),
                                      Positioned(
                                        top: 29,
                                        left: 29,
                                        child: Icon(
                                          Icons.sentiment_dissatisfied_rounded,
                                          color: color.AppColor.lightGreenColor,
                                          size: 45,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Lo sentimos\nParece que no tenemos ese producto',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: color.AppColor.companyBlackColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 150),
                                ],
                              )
                            : buildItems(itemsList);
                      }
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        onChanged: searchNetworkItem,
      );

  Widget buildItems(List<Data> itemsList) => GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.7,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          final item = itemsList[index];
          return buildItem(item);
        },
      );

  Widget buildItem(Data item) => ItemWidget(
        itemName: item.itemName,
        price: item.price,
        discount: item.promoValue,
        description: item.description,
        picture: Image.network(
          item.urlImage,
          fit: BoxFit.cover,
        ),
      );

  Future searchNetworkItem(String query) async {
    final items = await DataApi.searchItems(query);
    final result = items.toList();
    if (!mounted) return;
    setState(() {
      this.query = query;
      itemsList = result;
    });
  }
}
