import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app_for_care_monitor/widgets/card-list-tile.dart';

class CardDetail {
  String title;
  String subtitle;

  CardDetail({this.title, this.subtitle});
}

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<CardDetail> cards = [
    CardDetail(title: 'Pepperoni', subtitle: "\$60",),
    CardDetail(title: 'Cheese Corn', subtitle: '\$20'),
    CardDetail(title: 'Paneer Pizza', subtitle: '\$40'),
    CardDetail(title: 'Margherita', subtitle: '\$40'),
    CardDetail(title: 'Veg Pizza', subtitle: '\$30')
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 20.0),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: (){Navigator.pop(context);},
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 3,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) => CardListTile(
                title: cards[index].title,
                subtitle: cards[index].subtitle,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width*0.95,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: Colors.white,
                      elevation: 8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                        Text("Total Items:${cards.length}",
                        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold,fontSize: 20)),
                          Text("Total:\$320",
                              style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold,fontSize: 20)),
                        ],
                      ),
                    )
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}