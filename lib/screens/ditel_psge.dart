import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/stor_model.dart';
import '../provider/home_provder.dart';

class DitelPsge extends StatelessWidget {
  const DitelPsge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ditel"),
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).apiCalling(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<StorModel>? apiList = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 12,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            height: 350,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(15),
                              image: DecorationImage(
                                image: NetworkImage(
                                  apiList![tempIndex].image.toString(),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Id : ${apiList[tempIndex].id}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Title : ${apiList[tempIndex].title}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Description : ${apiList[tempIndex].description}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Category : ${apiList[tempIndex].category}",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Rate : ${apiList[tempIndex].rating!.rate} ⭐",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Price : ${apiList[tempIndex].price} \$",
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              letterSpacing: 1,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Provider.of<HomeProvider>(context, listen: false)
                            .priceList
                            .add(
                              apiList[tempIndex].price,
                            );

                        Provider.of<HomeProvider>(context, listen: false)
                            .titleList
                            .add(
                              apiList[tempIndex].title.toString(),
                            );
                        Provider.of<HomeProvider>(context, listen: false)
                            .idList
                            .add(
                              apiList[tempIndex].id!,
                            );
                        Provider.of<HomeProvider>(context, listen: false)
                            .totel();
                        Navigator.of(context).pushReplacementNamed('/cart');
                      },
                      child: Container(
                        height: 80,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.black26,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          "add to cart",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
