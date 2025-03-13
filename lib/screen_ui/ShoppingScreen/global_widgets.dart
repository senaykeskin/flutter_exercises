import 'package:flutter/material.dart';
import 'package:flutter_exercises/global/constants.dart';
import 'package:flutter_exercises/screen_ui/ShoppingScreen/product_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

AppBar shoppingAppBar(Color backgroundColor) {
  return AppBar(
    backgroundColor: backgroundColor,
    centerTitle: true,
    title: Text("Search",
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.w400)),
    leading: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.chevron_left_outlined,
          size: 30,
          color: Colors.black,
        )),
    actions: [
      Container(
        margin: EdgeInsets.only(right: 10),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            "assets/images/woman.png",
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
      )
    ],
  );
}

class ProductContainer extends StatelessWidget {
  const ProductContainer({
    super.key,
    required this.index,
  });

  final int index;

  void showToastMessage(BuildContext context) {
    Fluttertoast.showToast(
      msg: "Sepete eklendi!",
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 15,
      toastLength: Toast.LENGTH_SHORT,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(children: [
        Positioned(
          top: 10,
          left: 0,
          right: 0,
          child: Image.asset(
            productList[index]["image"]!,
            height: 130,
          ),
        ),
        Positioned(
            top: 160,
            left: 10,
            right: 10,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productList[index]["title"]!,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                ),
                Text(
                  productList[index]["amount"]!,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                )
              ],
            )),
        Positioned(
          bottom: 0,
          left: 10,
          right: 10,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$${productList[index]["price"]!}",
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
              IconButton(
                  onPressed: () {
                    showToastMessage(context);
                  },
                  icon: Icon(
                    Icons.add_circle,
                    size: 40,
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ]),
    );
  }
}

class Filters extends StatefulWidget {
  const Filters({super.key, required this.onFilterSelected});

  final Function(List<Map<String, dynamic>>) onFilterSelected;

  @override
  State<Filters> createState() => _FiltersState();
}

class _FiltersState extends State<Filters> {
  int selectedSortIndex = -1;
  int selectedPriceIndex = -1;

  final List<String> filterSortButton = [
    "Shampoo",
    "Soap",
    "Detergent"
  ];
  final List<String> filterPriceButton = [
    "\$20 - \$40",
    "\$41 - \$70",
    "\$71 - \$120"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: W(context),
      height: H(context) * 0.7,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Sort By",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            sortButtons(filterSortButton, isSort: true),
            const SizedBox(height: 50),
            const Text(
              "Price Range",
              style: TextStyle(
                color: Colors.black,
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            sortButtons(filterPriceButton, isSort: false),
          ],
        ),
      ),
    );
  }

  Row sortButtons(List<String> list, {required bool isSort}) {
    int selectedIndex = isSort ? selectedSortIndex : selectedPriceIndex;

    void selectButton(int index) {
      setState(() {
        if (isSort) {
          selectedSortIndex = (selectedSortIndex == index) ? -1 : index;
        } else {
          selectedPriceIndex = (selectedPriceIndex == index) ? -1 : index;
        }
      });
      applyFilters();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(list.length, (index) {
        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            backgroundColor:
            selectedIndex == index ? Colors.grey[300] : Colors.white,
            elevation: 1,
          ),
          onPressed: () => selectButton(index),
          child: Text(
            list[index],
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      }),
    );
  }

  void applyFilters() {
    List<Map<String, dynamic>> filteredProducts = productList;

    if (selectedSortIndex >= 0) {
      String type = filterSortButton[selectedSortIndex];
      filteredProducts = filteredProducts
          .where((product) => product['type'] == type.toLowerCase())
          .toList();
    }

    if (selectedPriceIndex == 0) {
      // Filter for $20 - $40
      filteredProducts = filteredProducts
          .where((product) =>
      product['price'] >= 20.0 && product['price'] <= 40.0)
          .toList();
    } else if (selectedPriceIndex == 1) {
      // Filter for $41 - $70
      filteredProducts = filteredProducts
          .where((product) =>
      product['price'] >= 41.0 && product['price'] <= 70.0)
          .toList();
    } else if (selectedPriceIndex == 2) {
      // Filter for $71 - $120
      filteredProducts = filteredProducts
          .where((product) =>
      product['price'] >= 71.0 && product['price'] <= 120.0)
          .toList();
    }

    widget.onFilterSelected(filteredProducts);
  }
}
