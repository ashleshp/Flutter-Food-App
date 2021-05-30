import 'package:food_app_for_care_monitor/model/menumodel.dart';

class ViewModel{
  Menu _menu ;
  ViewModel({Menu food}): _menu=food;

  String get name{
    return _menu.name;
  }

  String get description{
    return _menu.description;
  }

  String get imageurl{
    return _menu.imageurl;
  }

  String get price{
    return _menu.price;
  }

  String get banneriamge{
    return _menu.bannerimage;
  }
}