import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/stor_model.dart';
import '../provider/home_provder.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("cart"),
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
                    flex: 10,
                    child: ListView.builder(
                      itemCount:
                          Provider.of<HomeProvider>(context, listen: true)
                              .titleList
                              .length,
                      itemBuilder: (context, index) => Card(
                        child: ListTile(
                          leading: Text(
                            Provider.of<HomeProvider>(context, listen: true)
                                .idList[index]
                                .toString(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                          title: Text(
                            Provider.of<HomeProvider>(context, listen: true)
                                .titleList[index]
                                .toString(),
                          ),
                          subtitle: Text(
                            Provider.of<HomeProvider>(context, listen: true)
                                .priceList[index]
                                .toString(),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              Provider.of<HomeProvider>(context, listen: false)
                                  .remove(index);

                              Provider.of<HomeProvider>(context, listen: false)
                                  .totel();
                            },
                            icon: const Icon(Icons.remove),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.black45,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Total : ${Provider.of<HomeProvider>(context, listen: true).ans} \$",
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
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
