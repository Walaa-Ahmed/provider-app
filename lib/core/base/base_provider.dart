import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseProvider with ChangeNotifier {
  static BaseProvider get(context) =>
      Provider.of<BaseProvider>(context, listen: false);
  bool _isLoading = false;

  bool get getIsLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
  bool _isCreateLoading = false;

  bool get getIsCreateLoading => _isCreateLoading;

  set isCreateLoading(bool value) {
    _isCreateLoading = value;
    notifyListeners();
  }

  static bool checkAPIDataWithErrorSuccessCallback(
      {required res, Function? onSuccess, Function? onError}) {
    if (res.data['status'] == true) {
      if (onSuccess != null) onSuccess(res.data["msg"]);
      return true;
    } else {
        if (onError != null) {
          if(res.data["msg"]!=null) {
          onError(res.data["msg"]);
        } else if(res.data["message"]!=null) {
            onError(res.data["message"]);
          }
      }
      return false;
    }
  }


}
