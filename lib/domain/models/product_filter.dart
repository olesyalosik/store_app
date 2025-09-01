part of '_models.dart';

class ProductFilter extends Equatable {
  final SortPair? sortBy;
  final CategoryEnum? category;

  const ProductFilter({required this.sortBy, required this.category});

  factory ProductFilter.initial() =>
      ProductFilter(sortBy: null, category: null);

  @override
  List<Object?> get props => [sortBy];

  ProductFilter copyWith({SortPair? sortBy, CategoryEnum? category}) =>
      ProductFilter(
        sortBy: sortBy ?? this.sortBy,
        category: category ?? this.category,
      );
}
