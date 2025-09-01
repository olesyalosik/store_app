import 'package:store_app/domain/enums/sort_by.dart';
import 'package:store_app/domain/enums/sort_type.dart';

enum SortPair {
  titleAsc(SortBy.title, SortType.asc),
  priceAsc(SortBy.price, SortType.asc),
  ratingAsc(SortBy.rating, SortType.asc),
  titleDesc(SortBy.title, SortType.desc),
  priceDesc(SortBy.price, SortType.desc),
  ratingDesc(SortBy.rating, SortType.desc);

  final SortBy sortBy;
  final SortType sortType;

  const SortPair(this.sortBy, this.sortType);

  @override
  String toString() {
    switch (this) {
      case SortPair.titleAsc:
        return 'Title A->Z';
      case SortPair.titleDesc:
        return 'Title Z->A';
      case SortPair.priceAsc:
        return 'Price low->high';
      case SortPair.priceDesc:
        return 'Price high->low';
      case SortPair.ratingAsc:
        return 'Rating low->high';
      case SortPair.ratingDesc:
        return 'Rating high->low';
    }
  }
}
