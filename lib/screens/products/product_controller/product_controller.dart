import 'package:my_store/screens/products/model/product_model.dart';
import 'package:my_store/screens/products/repository/Product_repo.dart';

class ProductController {
  final _repo = ProductRepo();

  Future<ProductModel?> getRepo() async {

    ProductModel? response = await _repo.getProducts();

    return response;
}

}
