import 'package:flutter/material.dart';
import 'package:restofood/data/food_data.dart';
import 'package:restofood/detail.dart';
import 'package:restofood/model/food_model.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restofood"),
        backgroundColor: Colors.orange,
        leading: Icon(Icons.fastfood, color: Colors.white),
      ),
      body: SingleChildScrollView(child: HomeBody()),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Daftar Makanan & Minuman",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold)),
          SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          ListFood()
        ],
      ),
    );
  }
}

class ListFood extends StatefulWidget {
  @override
  _ListFoodState createState() => _ListFoodState();
}

class _ListFoodState extends State<ListFood> {
  List<Food> foods;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foods = FoodData.getFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        // separatorBuilder: (BuildContext context, index) => Divider(
        //   color: Colors.blue,
        // ),
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: foods.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Detail(
                      listFood: foods[index],
                    ),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 64,
                      height: 64,
                      child: Image.asset("images/${foods[index].image}",
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          foods[index].name,
                          style: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Text(
                            foods[index].description,
                            style:
                                TextStyle(fontSize: 14, color: Colors.black54),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Text(
                              "Rp ${foods[index].price.toString()}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
