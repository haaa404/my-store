import '../repository/category_repo.dart';

class CategoriesController {

  final _repo = CategoriesRepo();

  Future<List<dynamic>> getCategories() async {

    List<dynamic> response = await _repo.getCategories();

    return response;
  }

}
