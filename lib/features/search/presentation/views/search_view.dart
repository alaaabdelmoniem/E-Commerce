// import 'package:e_commerce/core/constants/app_colors.dart';
// import 'package:e_commerce/core/data/mock_products.dart';
// import 'package:e_commerce/core/models/product_model.dart';
// import 'package:e_commerce/core/theme/app_fonts.dart';
// import 'package:e_commerce/core/utils/widgets/nav.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class SearchView extends StatefulWidget {
//   const SearchView({super.key});

//   @override
//   State<SearchView> createState() => _SearchViewState();
// }

// class _SearchViewState extends State<SearchView> {
//   final TextEditingController _searchController = TextEditingController();
//   String? _selectedId;
//   List<ProductModel> _results = [];

//   @override
//   void initState() {
//     super.initState();
//     _results = List.from(mockProducts);
//     _searchController.addListener(_onSearch);
//   }

//   void _onSearch() {
//     final query = _searchController.text.toLowerCase();
//     setState(() {
//       _results = mockProducts
//           .where(
//             (p) =>
//                 p.name.toLowerCase().contains(query) ||
//                 p.description.toLowerCase().contains(query),
//           )
//           .toList();
//     });
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         scrolledUnderElevation: 0,
//         leading: GestureDetector(
//           onTap: () => Navigation.pop(context),
//           child: Padding(
//             padding: EdgeInsets.only(left: 16.w),
//             child: Icon(
//               Icons.arrow_back_ios,
//               size: 20.r,
//               color: AppColors.textDark,
//             ),
//           ),
//         ),
//         title: Text(
//           'Search',
//           style: TextStyle(
//             fontSize: 18.sp,
//             fontFamily: AppFonts.primaryFont,
//             fontWeight: FontWeight.w600,
//             color: AppColors.textDark,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // ── Search Bar ──────────────────────────────────────
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
//             child: Container(
//               height: 44.h,
//               decoration: BoxDecoration(
//                 color: const Color(0xffF5F5F5),
//                 borderRadius: BorderRadius.circular(8.r),
//               ),
//               child: TextField(
//                 controller: _searchController,
//                 style: TextStyle(
//                   fontSize: 14.sp,
//                   fontFamily: AppFonts.primaryFont,
//                   color: AppColors.textDark,
//                 ),
//                 decoration: InputDecoration(
//                   hintText: 'Search any Product..',
//                   hintStyle: TextStyle(
//                     fontSize: 14.sp,
//                     fontFamily: AppFonts.primaryFont,
//                     color: AppColors.textLight,
//                   ),
//                   prefixIcon: Icon(
//                     Icons.search,
//                     color: AppColors.textLight,
//                     size: 20.r,
//                   ),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: 12.h),
//                 ),
//               ),
//             ),
//           ),

//           // ── Result Count ────────────────────────────────────
//           Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.w),
//             child: Text(
//               '${_results.length} Items',
//               style: TextStyle(
//                 fontSize: 14.sp,
//                 fontFamily: AppFonts.primaryFont,
//                 fontWeight: FontWeight.w600,
//                 color: AppColors.textDark,
//               ),
//             ),
//           ),

//           SizedBox(height: 12.h),

//           // ── Product Grid ─────────────────────────────────────
//           Expanded(
//             child: _results.isEmpty
//                 ? Center(
//                     child: Text(
//                       'No products found',
//                       style: TextStyle(
//                         fontSize: 14.sp,
//                         fontFamily: AppFonts.primaryFont,
//                         color: AppColors.textMedium,
//                       ),
//                     ),
//                   )
//                 : GridView.builder(
//                     padding: EdgeInsets.symmetric(horizontal: 16.w),
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 12.w,
//                       mainAxisSpacing: 12.h,
//                       childAspectRatio: 0.72,
//                     ),
//                     itemCount: _results.length,
//                     itemBuilder: (context, index) {
//                       final product = _results[index];
//                       final isSelected = _selectedId == product.id;
//                       return _ProductCard(
//                         product: product,
//                         isSelected: isSelected,
//                         onTap: () => setState(() {
//                           _selectedId = isSelected ? null : product.id;
//                         }),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // ── Product Card ──────────────────────────────────────────────────────────────
// class _ProductCard extends StatelessWidget {
//   const _ProductCard({
//     required this.product,
//     required this.isSelected,
//     required this.onTap,
//   });

//   final ProductModel product;
//   final bool isSelected;
//   final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: AnimatedContainer(
//         duration: const Duration(milliseconds: 200),
//         decoration: BoxDecoration(
//           color: const Color(0xffF5F5F5),
//           borderRadius: BorderRadius.circular(10.r),
//           border: Border.all(
//             color: isSelected ? const Color(0xff6C63FF) : Colors.transparent,
//             width: 2,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // ── Product Image ──
//             Expanded(
//               flex: 5,
//               child: ClipRRect(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(10.r),
//                   topRight: Radius.circular(10.r),
//                 ),
//                 child: SizedBox(
//                   width: double.infinity,
//                   child: Image.network(
//                     product.imageUrl,
//                     fit: BoxFit.contain,
//                     loadingBuilder: (_, child, progress) {
//                       if (progress == null) return child;
//                       return Container(
//                         color: const Color(0xffEEEEEE),
//                         child: Center(
//                           child: CircularProgressIndicator(
//                             strokeWidth: 2,
//                             color: AppColors.primary,
//                             value: progress.expectedTotalBytes != null
//                                 ? progress.cumulativeBytesLoaded /
//                                       progress.expectedTotalBytes!
//                                 : null,
//                           ),
//                         ),
//                       );
//                     },
//                     errorBuilder: (_, __, ___) => Container(
//                       color: const Color(0xffEEEEEE),
//                       child: Icon(
//                         Icons.image_not_supported_outlined,
//                         color: AppColors.textLight,
//                         size: 32.r,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ),

//             // ── Product Info ──
//             Expanded(
//               flex: 4,
//               child: Padding(
//                 padding: EdgeInsets.all(8.r),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Name
//                     Text(
//                       product.name,
//                       style: TextStyle(
//                         fontSize: 13.sp,
//                         fontFamily: AppFonts.primaryFont,
//                         fontWeight: FontWeight.w600,
//                         color: AppColors.textDark,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),

//                     // Description
//                     Text(
//                       product.description,
//                       style: TextStyle(
//                         fontSize: 10.sp,
//                         fontFamily: AppFonts.primaryFont,
//                         fontWeight: FontWeight.w400,
//                         color: AppColors.textMedium,
//                         height: 1.4,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),

//                     // Price
//                     Text(
//                       '₹${product.price.toInt()}',
//                       style: TextStyle(
//                         fontSize: 13.sp,
//                         fontFamily: AppFonts.primaryFont,
//                         fontWeight: FontWeight.w700,
//                         color: AppColors.textDark,
//                       ),
//                     ),

//                     // Stars + Review count
//                     Row(
//                       children: [
//                         _StarRating(rating: product.rating),
//                         SizedBox(width: 4.w),
//                         Expanded(
//                           child: Text(
//                             _formatReviews(product.reviews),
//                             style: TextStyle(
//                               fontSize: 9.sp,
//                               fontFamily: AppFonts.primaryFont,
//                               color: AppColors.textLight,
//                             ),
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatReviews(int count) {
//     if (count >= 1000000) {
//       return '${(count / 1000000).toStringAsFixed(1)}M';
//     } else if (count >= 1000) {
//       final formatted = count.toString().replaceAllMapped(
//         RegExp(r'(\d)(?=(\d{3})+$)'),
//         (m) => '${m[1]},',
//       );
//       return formatted;
//     }
//     return count.toString();
//   }
// }

// // ── Star Rating ───────────────────────────────────────────────────────────────
// class _StarRating extends StatelessWidget {
//   const _StarRating({required this.rating});
//   final double rating;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: List.generate(5, (index) {
//         final filled = index < rating.floor();
//         final half = !filled && index < rating;
//         return Icon(
//           filled
//               ? Icons.star_rounded
//               : half
//               ? Icons.star_half_rounded
//               : Icons.star_outline_rounded,
//           color: const Color(0xffFFAB00),
//           size: 13.r,
//         );
//       }),
//     );
//   }
// }
