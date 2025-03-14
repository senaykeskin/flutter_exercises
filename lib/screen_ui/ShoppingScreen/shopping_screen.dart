import 'package:flutter/material.dart';
import 'package:flutter_exercises/global/constants.dart';
import 'package:flutter_exercises/screen_ui/ShoppingScreen/product_list.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'global_widgets.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final Color backgroundColor = Color(0xfff0ece8);
  List<Map<String, dynamic>> filteredProducts = productList;
  late TextEditingController controller = TextEditingController();

  void updateFilteredProducts(List<Map<String, dynamic>> products) {
    setState(() {
      filteredProducts = products;
    });
  }

  void searchValue(String value) {
    setState(() {
      filteredProducts = productList
          .where((product) => product['title']
              .toString()
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: shoppingAppBar(backgroundColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  padding: horizontal10,
                  width: W(context) * 0.75,
                  height: H(context) * 0.07,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: TextField(
                      onChanged: (value) {
                        searchValue(value);
                      },
                      controller: controller,
                      style: TextStyle(color: Colors.black),
                      cursorColor: Colors.grey,
                      decoration: InputDecoration(
                          icon: Icon(
                            Icons.search_outlined,
                            color: Colors.grey[700],
                          ),
                          border: InputBorder.none,
                          hintText: "Search",
                          hintStyle:
                              TextStyle(fontSize: 16, color: Colors.grey[700])),
                    ),
                  ),
                ),
                Container(
                  height: H(context) * 0.07,
                  width: H(context) * 0.07,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                      child: IconButton(
                    icon: FaIcon(FontAwesomeIcons.sliders,
                        color: Colors.black, size: 25),
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          showDragHandle: true,
                          backgroundColor: Colors.white,
                          isScrollControlled: true,
                          builder: (context) {
                            return Filters(
                                onFilterSelected: updateFilteredProducts);
                          });
                    },
                  )),
                )
              ],
            ),
            Expanded(
              child: GridView.builder(
                padding: vertical10,
                itemCount: filteredProducts.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15,
                    childAspectRatio: 3 / 4.7),
                itemBuilder: (BuildContext context, int index) {
                  return ProductContainer(product: filteredProducts[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
