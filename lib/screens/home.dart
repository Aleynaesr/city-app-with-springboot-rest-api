import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:cities/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> favoriteCityList = [];

  _saveList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("key", list);
    return true;
  }

  _getSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("key") != null) {
      favoriteCityList = prefs.getStringList("key")!;
    }
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _getSavedList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: topAppBar,
        body: TabBarView(
          children: [
            // Read json file
            FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/cities.json"),
                builder: (context, snapshot) {
                  var mydata = json.decode(snapshot.data.toString());
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: mydata == null ? 0 : mydata.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shadowColor: mainColor,
                          color: secondColor,
                          elevation: 2.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          margin: const EdgeInsets.symmetric(
                              horizontal: 14.0, vertical: 6.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 15.0, vertical: 15.0),
                                  leading: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      mydata[index]["city"],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      if (!favoriteCityList
                                          .contains(mydata[index]["city"])) {
                                        favoriteCityList
                                            .add(mydata[index]["city"]);
                                      }
                                      _saveList(favoriteCityList);
                                    });
                                  },
                                  style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                        mainColor,
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                              side: const BorderSide(
                                                  color: mainColor)))),
                                  child: const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            favoriteCityList.isEmpty
                ? const Center(
                    child: Text(
                      "You don't have a favorite city yet!",
                    ),
                  )
                : ListView.builder(
                    itemCount: favoriteCityList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        shadowColor: mainColor,
                        color: secondColor,
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 14.0, vertical: 6.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 15.0),
                                leading: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(
                                    favoriteCityList[index],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    favoriteCityList
                                        .remove(favoriteCityList[index]);
                                    _saveList(favoriteCityList);
                                  });
                                },
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all<Color>(
                                      mainColor,
                                    ),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(5.0),
                                            side: const BorderSide(
                                                color: mainColor)))),
                                child: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ],
        ),
      ),
    );
  }

//Creating AppBar function
  final topAppBar = AppBar(
    centerTitle: true,
    title: const Text(
      "Cities",
      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
    ),
    bottom: const TabBar(
      indicatorColor: secondColor,
      unselectedLabelColor: Colors.grey,
      tabs: [
        Tab(icon: Icon(Icons.article_rounded)),
        Tab(icon: Icon(Icons.favorite)),
      ],
    ),
  );
}
