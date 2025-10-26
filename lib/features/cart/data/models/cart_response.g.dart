// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
  status: json['status'] as String,
  numOfCartItems: (json['numOfCartItems'] as num).toInt(),
  cartId: json['cartId'] as String,
  data: CartData.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
  id: json['_id'] as String,
  cartOwner: json['cartOwner'] as String,
  products: (json['products'] as List<dynamic>?)
      ?.map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: json['createdAt'] as String,
  updatedAt: json['updatedAt'] as String,
  totalCartPrice: (json['totalCartPrice'] as num).toInt(),
);

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
  '_id': instance.id,
  'cartOwner': instance.cartOwner,
  'products': instance.products,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
  'totalCartPrice': instance.totalCartPrice,
};

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
  count: (json['count'] as num).toInt(),
  id: json['_id'] as String,
  product: Product.fromJson(json['product'] as Map<String, dynamic>),
  price: (json['price'] as num).toInt(),
);

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
  id: json['_id'] as String,
  title: json['title'] as String,
  quantity: (json['quantity'] as num?)?.toInt(),
  imageCover: json['imageCover'] as String,
  category: Category.fromJson(json['category'] as Map<String, dynamic>),
  brand: Brand.fromJson(json['brand'] as Map<String, dynamic>),
  ratingsAverage: json['ratingsAverage'] as num,
  subcategory: (json['subcategory'] as List<dynamic>)
      .map((e) => SubCategory.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
  '_id': instance.id,
  'title': instance.title,
  'quantity': instance.quantity,
  'imageCover': instance.imageCover,
  'category': instance.category,
  'brand': instance.brand,
  'ratingsAverage': instance.ratingsAverage,
  'subcategory': instance.subcategory,
};

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
  id: json['_id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

Brand _$BrandFromJson(Map<String, dynamic> json) => Brand(
  id: json['_id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  image: json['image'] as String,
);

Map<String, dynamic> _$BrandToJson(Brand instance) => <String, dynamic>{
  '_id': instance.id,
  'name': instance.name,
  'slug': instance.slug,
  'image': instance.image,
};

SubCategory _$SubCategoryFromJson(Map<String, dynamic> json) => SubCategory(
  id: json['_id'] as String,
  name: json['name'] as String,
  slug: json['slug'] as String,
  category: json['category'] as String,
);

Map<String, dynamic> _$SubCategoryToJson(SubCategory instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };
