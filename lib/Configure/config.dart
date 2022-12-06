import 'package:dio/dio.dart';
import 'package:langories/model/Product.dart';

class Config {
  Dio dio = Dio();

  Future<List<Product>> getAllProducts(String category) async {
    var products = await dio.get("https://fakestoreapi.com/products");
    List<Product> productList =  [];
    if (products.statusCode == 200) {
        products.data.forEach((i) {
        Product productObj = Product.fromJson(i);
        if(productObj.category==category)
        {
          productList.add(productObj);
        }
      });
    }
    return productList;
  }

  // Future<Set<String>> getCategories() async {
  //   List<Product> products = await getAllProducts();
  //   Set<String> categories = {};
  //   for (int i = 0; i < products.length; i++) {
  //    print("Products($i) = ${products[i].category}\n");
  //     categories.add(products[i].category!);
  //   }
    // int j = 0; 
    //   categories.forEach((i){
    //    print("Categories ($j) : $i ");
    //    j++;
  
    //   });
    //  return categories;
  // }
}
