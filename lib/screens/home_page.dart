import 'package:adv_exam_1/model/stor_model.dart';
import 'package:adv_exam_1/provider/home_provder.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecom App"),
        actions: [
          IconButton(
            onPressed: () {
              Provider.of<HomeProvider>(context, listen: false).botton();
            },
            icon: const Icon(Icons.list),
          )
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<HomeProvider>(context, listen: false).apiCalling(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<StorModel>? apiList = snapshot.data;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: (Provider.of<HomeProvider>(context, listen: true).isList)
                  ? ListView.builder(
                      itemCount: apiList!.length,
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  tempIndex = index;
                                  Navigator.of(context).pushNamed("/ditel");
                                },
                                child: Container(
                                  height: 350,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        apiList[index].image.toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                apiList[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                '${apiList[index].price} \$',
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  : GridView.builder(
                      itemCount: apiList!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, mainAxisExtent: 300),
                      itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  print("deep");
                                },
                                child: Container(
                                  height: 100,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Colors.black12,
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        apiList[index].image.toString(),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                apiList[index].title.toString(),
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Text(
                                '${apiList[index].price} \$',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
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
