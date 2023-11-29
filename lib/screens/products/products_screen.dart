import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:my_store/screens/products/model/product_model.dart';
import 'package:my_store/screens/products/product_controller/product_controller.dart';
import 'package:my_store/widgets/product_widget.dart';
import 'package:my_store/widgets/small_text.dart';
import 'package:my_store/widgets/text_field_widget.dart';
import '../../routes.dart';
import '../../utilis.dart';

class ProductsScreen extends StatefulWidget {
  const ProductsScreen({super.key, this.category = ''});
  final String? category;

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final _controller = TextEditingController();
  late Future<ProductModel?> _model;
  List<Products>? _products = [];
  List<Products>? _response = [];

  @override
  void initState() {
    super.initState();
    _model = getRepo();
    _controller.addListener(() {
      if(_controller.text == ''){
        setState(() {});
      }
    });
  }

  Future<ProductModel?> getRepo() async {
    return await ProductController().getRepo();
  }

  fun(Products data) {
    Navigator.pushNamed(context, AppRoutes.productDetails,
        arguments: {'arg': data});
  }

  onSubmit() {

    final text = _controller.text;
    if (text.isNotEmpty && _products!.isNotEmpty) {
      _response = [];
      for (Products product in _products!) {
        if (text.toLowerCase().substring(0, 2) ==
            product.title!.toLowerCase().substring(0, 2)) {
          _response!.add(product);
        } //if
      } //for
    } //outer if

    setState(() {});
  } //fun

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
              (widget.category == '' ? 'Products' : widget.category.toString()),
              style: appBarStyle),
          centerTitle: true,
          leading: widget.category != ''
              ? IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Colors.black,
                  ),
                  onPressed: () => Navigator.pop(context),
                )
              : const SizedBox(
                  height: 0,
                  width: 0,
                ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Search Bar
                TextFieldWidget(
                    onSubmit: onSubmit,
                    controller: _controller,
                    hint: 'Iphone'),

                const SizedBox(
                  height: 30,
                ),

                //Product Card
                _controller.text.isEmpty || _response!.isEmpty
                    ? FutureBuilder<ProductModel?>(
                        future: _model,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data!.products!.length,
                                  itemBuilder: (context, index) {
                                    _products = snapshot.data!.products;
                                    final data =
                                        snapshot.data!.products![index];

                                    return widget.category == ''
                                        ? InkWell(
                                            onTap: () => fun(data),
                                            child: ProductWidget(
                                              price: data.price.toString(),
                                              name: data.title.toString(),
                                              imageUrl:
                                                  data.thumbnail.toString(),
                                              category:
                                                  data.category.toString(),
                                              company: data.brand.toString(),
                                              rating: data.rating.toString(),
                                            ),
                                          )
                                        : widget.category == data.category
                                            ? InkWell(
                                                onTap: () => fun(data),
                                                child: ProductWidget(
                                                  price: data.price.toString(),
                                                  name: data.title.toString(),
                                                  imageUrl:
                                                      data.thumbnail.toString(),
                                                  category:
                                                      data.category.toString(),
                                                  company:
                                                      data.brand.toString(),
                                                  rating:
                                                      data.rating.toString(),
                                                ),
                                              )
                                            : const SizedBox(
                                                height: 0,
                                                width: 0,
                                              );
                                  });
                            } //if

                            else if (snapshot.hasError) {
                              return Center(
                                child: SmallText(
                                  text: '${snapshot.error}',
                                ),
                              );
                            }
                          }

                          return const Center(
                            child: SpinKitWave(
                              color: Colors.greenAccent,
                            ),
                          );
                        })
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _response!.length,
                        itemBuilder: (context, index) {
                          final data = _response![index];
                          return InkWell(
                            onTap: () => fun(data),
                            child: ProductWidget(
                              price: data.price.toString(),
                              name: data.title.toString(),
                              imageUrl: data.thumbnail.toString(),
                              category: data.category.toString(),
                              company: data.brand.toString(),
                              rating: data.rating.toString(),
                            ),
                          );
                        }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
