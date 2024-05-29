import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecomapp/components/custom_button.dart';
import 'package:ecomapp/utils/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool addButtonLoad = false;

  void onAddToCart() async {
    setState(() {
      addButtonLoad = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(children: [
                  SizedBox(
                    height: 500,
                    width: double.infinity,
                    child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://images.unsplash.com/photo-1605812860427-4024433a70fd?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
                  ),
                  Positioned(
                    top: 35,
                    right: 35,
                    child: Container(
                      decoration: ShapeDecoration(
                          color: CustomTheme.yellow,
                          shape: CircleBorder(),
                          shadows: [
                            BoxShadow(
                                color: CustomTheme.grey,
                                blurRadius: 3,
                                offset: Offset(1, 3))
                          ]),
                      child: IconButton(
                        icon: Icon(Icons.share),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ),
                  ),
                ]),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: DefaultTextStyle(
                      style: Theme.of(context).textTheme.headlineLarge!,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(top: 22),
                            child: Text("title"),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Row(
                              children: [Text("MRP: "), Text("\$ price")],
                            ),
                          ),
                          CustomButton(
                            text: "Add to Cart",
                            onPress: onAddToCart,
                            loading: addButtonLoad,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20),
                            child: Text(
                              "About the items",
                              style: Theme.of(context).textTheme.headlineMedium,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              "the items description",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
          Positioned(
            top: 35,
            left: 35,
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 3,
                        offset: Offset(1, 3),
                        color: CustomTheme.grey),
                  ]),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
