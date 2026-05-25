import 'package:e_commerce/features/home/data/models/product_model/product_model.dart';
import 'package:e_commerce/features/home/presentation/widgets/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.recommendProducts});
  final List<ProductModel> recommendProducts;
  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      itemCount: recommendProducts.length,
      itemBuilder: (context, index) =>
          ProductItem(productModel: recommendProducts[index]),

      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 15.h,
        crossAxisSpacing: 14.w,
        childAspectRatio: 163.w / 305.h,
      ),
    );
  }
}
