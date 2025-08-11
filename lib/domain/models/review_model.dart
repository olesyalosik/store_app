part of '_models.dart';
class ReviewModel {
  final int? rating;
  final String? comment;
  final String? date;
  final String? reviewerName;
  final String? reviewerEmail;

  const ReviewModel({
   required  this.rating, 
   required  this.comment, 
   required  this.date,
   required  this.reviewerEmail, 
    required this.reviewerName,
  });
}