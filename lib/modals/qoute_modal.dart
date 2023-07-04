
class QuoteModel {
  int id;
  String category;
  List<Quote> quotes;

  QuoteModel({
    required this.id,
    required this.category,
    required this.quotes,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) => QuoteModel(
    id: json["id"],
    category: json["category"],
    quotes: List<Quote>.from(json["quotes"].map((x) => Quote.fromJson(x))),
  );

}

class Quote {
  int? id;
  String quote;
  String author;

  Quote({
    this.id,
    required this.quote,
    required this.author,
  });

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
    id: json["id"],
    quote: json["quote"],
    author: json["author"],
  );
}
