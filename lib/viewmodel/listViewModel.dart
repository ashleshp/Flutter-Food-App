import 'package:flutter/cupertino.dart';
import 'package:food_app_for_care_monitor/model/menumodel.dart';
import 'package:food_app_for_care_monitor/service/service.dart';
import 'viewmodel.dart';

enum LoadingStatus{
  Completed,
  Searching,
  Empty,
}

class ListViewModel with ChangeNotifier{
  LoadingStatus loadingStatus = LoadingStatus.Empty;
  List<ViewModel> food = List<ViewModel>();
  //////



  //methods
  void fetchFoodMenu() async {
    List<Menu> _menu=await WebService().getFoodMenu();
    loadingStatus = LoadingStatus.Searching;
    notifyListeners();
    this.food = _menu.map((food) => ViewModel(food: food)).toList();

    if(this.food.isEmpty){
      loadingStatus =LoadingStatus.Empty;
    }
    else{
      loadingStatus=LoadingStatus.Completed;
    }
    notifyListeners();
  }
}