class QuoteModel {
  String category;
  String image;
  List<Quote> quotes;

  QuoteModel(this.category, this.image, this.quotes);

  factory QuoteModel.fromJson(Map<String, dynamic> json) {
    var quoteList = json['quotes'] as List;
    List<Quote> quotes = quoteList.map((quote) => Quote.fromJson(quote)).toList();

    return QuoteModel(
      json['quotes-category'],
      json['quotes-image'],
      quotes,
    );
  }
}

class Quote {
  int id;
  String quote;
  String author;

  Quote(this.id, this.quote, this.author);

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      json['id'],
      json['quote'],
      json['author'],
    );
  }
}