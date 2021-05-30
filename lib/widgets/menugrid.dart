
import 'package:flutter/material.dart';
import 'package:food_app_for_care_monitor/viewmodel/viewmodel.dart';
class MenuGrid extends StatefulWidget {
  List<ViewModel> foods;
  MenuGrid({this.foods});
  @override
  _MenuGridState createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
        itemCount: widget.foods.length,
        itemBuilder: (_, index){
          var food = widget.foods[index];
          return GridTile(
            child:Card(
              margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              elevation: 4,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Stack(
                    children: [
                      Ink.image(
                        image: NetworkImage(food.imageurl,
                        ),
                        height: MediaQuery.of(context).size.height* 0.25,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(16).copyWith(bottom: 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Text(
                           food.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                        SizedBox(height: 12,),
                        Text(
                          food.description,
                          style: TextStyle(fontSize: 16,
                          color: Colors.grey),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              food.price,
                              style: TextStyle(
                                  fontSize:16,
                                color: Colors.black,
                              ),
                            ),
                            ElevatedButton(

                              style: ElevatedButton.styleFrom(
                                primary: Colors.black,
                                 shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                  ),
                                  ),
                                padding: EdgeInsets.fromLTRB(30.0, 0, 30.0, 0)
                              ),
                              child: Text('ADD'),
                              onPressed: ()async {
                                //TODO: Add a new card to cards with title 'Unit Testing' and subtitle of 'Intermediate'.
                                print('${food.name},${food.price}');
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.black,
                                    content: Text("Adding ${food.name} to cart",style: TextStyle(color: Colors.white),),
                                    duration: const Duration(milliseconds: 1500),
                                    width: 280.0, // Width of the SnackBar.
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, // Inner padding for SnackBar content.
                                    ),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          );
        },
    );
  }
}
