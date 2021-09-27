import 'package:flutter/material.dart';
import 'package:providerfirebase/Api/FetchDataFromJsonFile.dart';
import 'DrawerInHome.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      body: Container(
        color: Colors.white70,
        child: FutureBuilder(
            future: readJsoncitises(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(child: Text('${snapshot.error}'));
              } else if (snapshot.hasData) {
                List<City> data = snapshot.data as List<City>;
                return ListView.builder(
                    itemBuilder: (BuildContext context, index) {
                  return Container(
                      color: Colors.white,
                      height: 80,
                      child: Card(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 5,
                        margin:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                        child: InkWell(
                          child: Padding(
                            padding: EdgeInsets.only(top: 20),
                            child: Text(
                              data[index].name.toString(),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ));
                });
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            }),
      ),
    );
  }
}
