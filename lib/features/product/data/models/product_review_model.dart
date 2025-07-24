class ProductReviewModel {
  final String productName;
  final String comment;
  final String rating;

  ProductReviewModel(
      {required this.productName, required this.comment, required this.rating});

  Map<String, dynamic> toJson() {
    return {'product': productName, 'comment': comment, 'rating': rating};
  }
}
