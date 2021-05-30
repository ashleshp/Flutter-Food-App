import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:food_app_for_care_monitor/screen/cartscreen.dart';
import 'package:food_app_for_care_monitor/viewmodel/listViewModel.dart';
import 'package:food_app_for_care_monitor/viewmodel/viewmodel.dart';
import 'package:food_app_for_care_monitor/widgets/Sliver_tabBar.dart';
import 'package:food_app_for_care_monitor/widgets/menugrid.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<ListViewModel>(context, listen: false).fetchFoodMenu();

  }
  @override
  void dispose() {
    super.dispose();
  }


  Widget build(BuildContext context) {
    var listViewModel = Provider.of<ListViewModel>(context);
    List<ViewModel> foods = listViewModel.food;
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context,bool value){
                return <Widget>[
                  SliverAppBar(
                    title: Center(child: Text('Food\n App',)),
                    backgroundColor: Colors.white,
                    expandedHeight: MediaQuery.of(context).size.height * 0.35,
                    flexibleSpace: FlexibleSpaceBar(
                      background: CarouselSlider.builder(
                          itemCount: foods.length,
                          itemBuilder: (BuildContext context,index,_){
                            var food = foods[index];
                            return Container(
                              child: CachedNetworkImage(imageUrl: food.banneriamge,
                                imageBuilder:(context, imageProvider){
                                  return Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          fit: BoxFit.fitWidth,
                                          image: imageProvider,
                                        )
                                    ),
                                  );
                                } ,
                                placeholder: (context,url){
                                  return Center(
                                    child:CircularProgressIndicator() ,
                                  );
                                },
                                errorWidget : (context,url,error){
                                  return Icon(Icons.error_outline);
                                },
                              ),
                            );
                          },
                          options: CarouselOptions(autoPlay: true,height: MediaQuery.of(context).size.height * 0.35)),
                    ),
                  ),
                  SliverPersistentHeader(delegate: StickyTabBar(color: Colors.white,
                    tabBar: TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.white ,
                      tabs: [
                        Tab(icon: Text('Pizza',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),),
                        Tab(icon: Text('Sushi',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,),),),
                      ],
                    ),
                  ),
                    pinned: true,
                  ),
                ];
              },
              body: TabBarView(
                children: [
                  MenuGrid(foods: listViewModel.food),
                  Container(child: Center(child: Text("Sushi's Coming Soon",style: TextStyle(fontSize: 28),))),
                ],
              ),
            ),
          ),
        ),
      floatingActionButton: Container(height: 75,width: 75,
        child: FloatingActionButton(onPressed:  () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Dashboard()),
          );
        },
          child: Container(child: Icon(Icons.shopping_cart_outlined,color: Colors.black,)),
          backgroundColor: Colors.white,
          elevation: 8,
        ),
      ),
    );
  }
}
//////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////
/*
working scafold
Scaffold(
      body:  SafeArea(
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[

        Padding(
              padding: const EdgeInsets.only(left:30, bottom: 15, top:15),
          child: Text('Headlines', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
          ),

        Expanded(
        child: MenuGrid(foods: listViewModel.food),

        ),
        ],
      )

     ),
    floatingActionButton: FloatingActionButton(onPressed: (){},
      child: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
      backgroundColor: Colors.white,
      elevation: 8,
     ),
    );
######### with sliver

CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.red,
              expandedHeight: 200,
            ),
            StickyTabBar(),
            SliverGrid(
              gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1),
              delegate: SliverChildBuilderDelegate(
                    (_, index){
                    var food = foods[index];
                    return Container(
                      child: Card(
                        margin: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
                        elevation: 4,
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Ink.image(
                                  image: NetworkImage(food.imageurl,
                                  ),
                                  height: 250,
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
                                        fontSize: 24,
                                      ),
                                    ),
                                    SizedBox(height: 12,),
                                    Text(
                                      food.description,
                                      style: TextStyle(fontSize: 18,
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
                                        ElevatedButton(onPressed:(){}, child: Text('ADD'), ),
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
                childCount: foods.length
              ),
            )
          ],
        ),



 */
