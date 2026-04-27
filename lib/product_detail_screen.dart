import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Map<String, Object> productDetails;
  const ProductDetailScreen({
    super.key,
    required this.productDetails,
  });

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int sizeIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // == name ===
          Text(
            widget.productDetails['title'].toString(),
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Spacer(),
          // == image ==
          Image.asset(
            widget.productDetails['imageUrl'].toString(),
            width: double.infinity,
            height: 220,
            fit: BoxFit.contain,
          ),
          Spacer(
            flex: 2,
          ),
          // === bottom container ===
          Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
              color: Color.fromRGBO(245, 247, 249, 1),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '\$ ${widget.productDetails['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Center(
                  child: SizedBox(
                    height: 80,
                    // === size list ===
                    child: ListView.separated(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              sizeIndex = index;
                            });
                          },
                          child: Chip(
                            padding: EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 10,
                            ),
                            label: Text(
                              (widget.productDetails['sizes'] as List)[index]
                                  .toString(),
                            ),
                            side: BorderSide(
                              color: Theme.of(context).hoverColor, // Change this to your desired color
                              width: 1.0,
                            ),
                            backgroundColor: index == -1 || index != sizeIndex
                                ? null
                                : Theme.of(context).colorScheme.primary,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(width: 10);
                      },
                      itemCount:
                          (widget.productDetails['sizes'] as List<int>).length,
                    ),
                  ),
                ),
                // === add to cart button ===
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_cart),
                    label: const Text('Add to Cart'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      foregroundColor: Colors.black,
                      minimumSize: const Size(
                        double.infinity,
                        50,
                      ),
                    ),
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
