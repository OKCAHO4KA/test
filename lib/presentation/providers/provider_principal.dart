import 'package:flutter/cupertino.dart';

class ProviderPrincipal extends ChangeNotifier {
  bool isAddSender = true;
  bool isAddRecipient = true;

  bool isAddLineAddressPushed = false;

  setIsAddSender(bool value) {
    if (isAddSender == value) return;
    isAddSender = !isAddSender;
    notifyListeners();
  }

  setIsAddRecipien(bool value) {
    if (isAddRecipient == value) return;
    isAddRecipient = !isAddRecipient;
    notifyListeners();
  }

  addLineAddress() {
    isAddLineAddressPushed = !isAddLineAddressPushed;
    notifyListeners();
  }
}
