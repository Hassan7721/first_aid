import 'package:flutter/foundation.dart';
import '../../data/datasources/local_guide_data_source.dart';
import '../../data/models/first_aid_guide.dart';
import '../../data/repositories/guide_repository_impl.dart';

class LibraryProvider extends ChangeNotifier {
  LibraryProvider()
      : _repository = GuideRepositoryImpl(const LocalGuideDataSource()) {
    _guides = _repository.getGuides();
  }

  final GuideRepositoryImpl _repository;
  late final List<FirstAidGuide> _guides;
  final Set<String> _favoriteIds = {};
  String _query = '';
  String _category = 'All';

  List<FirstAidGuide> get guides => List.unmodifiable(_guides);
  Set<String> get favoriteIds => Set.unmodifiable(_favoriteIds);
  String get query => _query;
  String get category => _category;

  List<FirstAidGuide> get filteredGuides {
    return _guides.where((guide) {
      final matchesCategory =
          _category == 'All' || guide.category == _category;
      final searchable = '${guide.title} ${guide.subtitle}'.toLowerCase();
      final matchesQuery = searchable.contains(_query.toLowerCase());
      return matchesCategory && matchesQuery;
    }).toList();
  }

  void setQuery(String value) {
    _query = value;
    notifyListeners();
  }

  void setCategory(String value) {
    _category = value;
    notifyListeners();
  }

  void toggleFavorite(String guideId) {
    if (!_favoriteIds.add(guideId)) {
      _favoriteIds.remove(guideId);
    }
    notifyListeners();
  }

  bool isFavorite(String guideId) => _favoriteIds.contains(guideId);
}
