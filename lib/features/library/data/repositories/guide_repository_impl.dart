import '../datasources/local_guide_data_source.dart';
import '../models/first_aid_guide.dart';

class GuideRepositoryImpl {
  GuideRepositoryImpl(this._dataSource);

  final LocalGuideDataSource _dataSource;

  List<FirstAidGuide> getGuides() => _dataSource.getGuides();
}
