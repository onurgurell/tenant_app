import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ExpressYourselfViewModel extends ChangeNotifier {
  final List<Widget> _addIncomeList = [];
  String? _selectedText;
  int? _selectedPetNoButton;
  int? _selectedIncomeButton;
  bool _isSelected = false;
  bool _isLoading = false;
  File? _image;
  String? _dateTime;
  RangeValues _currentRangeValues = const RangeValues(0, 100000);

  String? get selectedText => _selectedText;
  int? get selectedPetButton => _selectedPetNoButton;
  int? get selectedIncomeButton => _selectedIncomeButton;
  bool get isSelected => _isSelected;
  RangeValues get currentRangeValues => _currentRangeValues;
  File? get image => _image;
  String? get dateTime => _dateTime;
  bool get isLoading => _isLoading;

  List<Widget> get addIncomeList => _addIncomeList;

  void loadingIndicator() {
    _isLoading = !_isLoading;
    notifyListeners();
  }

  void updateText(String text) {
    _selectedText = text;
    notifyListeners();
  }

  void petYesOrNoButton(int index) {
    _selectedPetNoButton = index;
    notifyListeners();
  }

  void chooseButton() {
    _isSelected = !_isSelected;
    notifyListeners();
  }

  void incomeYesOrNoButton(int? index) {
    _selectedIncomeButton = index;
    notifyListeners();
  }

  void addIncome(Widget widget) {
    _addIncomeList.add(widget);
    notifyListeners();
  }

  void addRangeValue(RangeValues values) {
    _currentRangeValues = values;
    notifyListeners();
  }

  Future getImage() async {
    loadingIndicator();

    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      File? img = File(image.path);
      _image = img;
      notifyListeners();
    } catch (e) {
      print('image $e');
    }
    loadingIndicator();
  }

  Future deleteImage() async {
    loadingIndicator();

    _image = null;
    notifyListeners();
    loadingIndicator();
  }

  updateDate() {
    _dateTime = DateFormat.yMd().format(DateTime.now());
    notifyListeners();
  }
}
