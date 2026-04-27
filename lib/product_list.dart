import 'package:currency_converter/global_variables.dart';
import 'package:currency_converter/product_card.dart';
import 'package:currency_converter/product_detail_screen.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: products.length,
        scrollDirection: Axis.vertical,
        separatorBuilder: (context, index) {
          // space between each product
          return SizedBox(
            height: 10,
          );
        },
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return ProductDetailScreen(
                      productDetails: products[index],
                    );
                  },
                ),
              );
            },
            child: ProductCard(
              productName: products[index]['title'].toString(),
              productPrice: products[index]['price'].toString(),
              productImage: products[index]['imageUrl'].toString(),
              // alternate coloring of product cards
              backgroundColor: index.isEven
                  ? Color.fromRGBO(208, 237, 251, 1)
                  : Color.fromRGBO(243, 245, 249, 1),
            ),
          );
        },
      ),
    );
  }
}
