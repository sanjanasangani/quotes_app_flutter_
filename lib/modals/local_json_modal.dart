import 'dart:typed_data';
import 'package:dbminer_quotes_app/modals/qoute_modal.dart';

class LocalJsonModel {
  String jsonData;
  List<QuoteModel> Quotes;

  LocalJsonModel({
    required this.jsonData,
    required this.Quotes,
  });
}
