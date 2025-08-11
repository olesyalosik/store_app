class Review {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  const Review({
    this.rating, 
    this.comment, 
    this.date,
    this.reviewerEmail, 
    this.reviewerName,
  });
}