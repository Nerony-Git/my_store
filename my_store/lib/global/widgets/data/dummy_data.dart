import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/models/address_model.dart';
import 'package:my_store/utils/models/banner_model.dart';
import 'package:my_store/utils/models/brand_category_model.dart';
import 'package:my_store/utils/models/brand_model.dart';
import 'package:my_store/utils/models/category_model.dart';
import 'package:my_store/utils/models/product_attribute_model.dart';
import 'package:my_store/utils/models/product_category_model.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/models/product_variation_model.dart';
import 'package:my_store/utils/models/user_model.dart';
import 'package:my_store/utils/routes/routes.dart';

class DummyData {
  /// Banners
  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: MyImages.banner1, targetScreen: Routes.order, active: false),
    BannerModel(
        imageUrl: MyImages.banner2, targetScreen: Routes.cart, active: true),
    BannerModel(
        imageUrl: MyImages.banner3,
        targetScreen: Routes.wishlist,
        active: true),
    BannerModel(
        imageUrl: MyImages.banner4, targetScreen: Routes.search, active: true),
    BannerModel(
        imageUrl: MyImages.banner5,
        targetScreen: Routes.settings,
        active: true),
    BannerModel(
        imageUrl: MyImages.banner6,
        targetScreen: Routes.userAddress,
        active: true),
    BannerModel(
        imageUrl: MyImages.banner7, targetScreen: Routes.order, active: true),
    BannerModel(
        imageUrl: MyImages.banner8,
        targetScreen: Routes.checkout,
        active: false),
  ];

  // /// User
  // static final UserModel user = UserModel(
  //   firstName: 'John',
  //   lastName: 'Doe',
  //   username: 'username',
  //   email: 'bughuntedbykwaku@gmail.com',
  //   phoneNumber: '03749274992',
  //   profilePicture: MyImages.user,
  //   address: [
  //     AddressModel(
  //       id: '1',
  //       name: 'John Doe',
  //       phoneNumber: '03749274992',
  //       street: 'Hill Avenue',
  //       city: 'Watford',
  //       county: 'Hertfordshire',
  //       postalCode: 'WD24 3YS',
  //       country: 'UK',
  //     ),
  //     AddressModel(
  //       id: '1',
  //       name: 'John Doe',
  //       phoneNumber: '03749274992',
  //       street: 'Hill Avenue',
  //       city: 'Watford',
  //       county: 'Hertfordshire',
  //       postalCode: 'WD24 3YS',
  //       country: 'UK',
  //     ),
  //   ],
  // );

  // /// Cart
  // static final CartModel cart = CartModel(
  //   cartID: '001',
  //   items: [
  //     CartItemModel(
  //       productID: '001',
  //       variationID: '1',
  //       quantity: 2,
  //       title: products[0].title,
  //       img: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //     CartItemModel(
  //       productID: '002',
  //       variationID: '1',
  //       quantity: 1,
  //       title: products[0].title,
  //       img: products[0].thumbnail,
  //       brandName: products[0].brand!.name,
  //       price: products[0].productVariations![0].price,
  //       selectedVariation: products[0].productVariations![0].attributeValues,
  //     ),
  //   ],
  // );

  // /// Order
  // static final List<OrderModel> orders = [
  //   OrderModel(
  //     id: 'MSA0023',
  //     status: OrdeerStatus.processing,
  //     items: cart.items,
  //     totalAmount: 85,
  //     orderDate: DateTime(2024, 03, 20),
  //     deliveryDate: DateTime(2024, 04, 10),
  //   ),
  //   OrderModel(
  //     id: 'MSA0023',
  //     status: OrdeerStatus.shipped,
  //     items: cart.items,
  //     totalAmount: 85,
  //     orderDate: DateTime(2024, 02, 15),
  //     deliveryDate: DateTime(2024, 03, 2),
  //   ),
  // ];

  /// List of all categories
  static final List<CategoryModel> categories = [
    /// Categories
    CategoryModel(
      id: '1',
      name: 'Sports',
      img: MyImages.sportIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '2',
      name: 'Electronics',
      img: MyImages.electronicsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '3',
      name: 'Clothes',
      img: MyImages.clothIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '4',
      name: 'Animals',
      img: MyImages.animalIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '5',
      name: 'Furniture',
      img: MyImages.furnitureIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '6',
      name: 'Shoes',
      img: MyImages.shoeIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '7',
      name: 'Cosmetics',
      img: MyImages.cosmeticsIcon,
      isFeatured: true,
    ),
    CategoryModel(
      id: '8',
      name: 'Jewellery',
      img: MyImages.jeweleryIcon,
      isFeatured: true,
    ),

    /// Sub categories
    // Sports
    CategoryModel(
      id: '9',
      name: 'Sports Shoes',
      img: MyImages.sportIcon,
      parentID: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '10',
      name: 'Track Suits',
      img: MyImages.sportIcon,
      parentID: '1',
      isFeatured: false,
    ),
    CategoryModel(
      id: '11',
      name: 'Sports Equipment',
      img: MyImages.sportIcon,
      parentID: '1',
      isFeatured: false,
    ),

    // Furniture
    CategoryModel(
      id: '12',
      name: 'Bedroom Furniture',
      img: MyImages.furnitureIcon,
      parentID: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '13',
      name: 'Kitchen Furniture',
      img: MyImages.furnitureIcon,
      parentID: '5',
      isFeatured: false,
    ),
    CategoryModel(
      id: '14',
      name: 'Office Furniture',
      img: MyImages.furnitureIcon,
      parentID: '5',
      isFeatured: false,
    ),

    // Electronics
    CategoryModel(
      id: '15',
      name: 'Laptop',
      img: MyImages.electronicsIcon,
      parentID: '2',
      isFeatured: false,
    ),
    CategoryModel(
      id: '16',
      name: 'Mobile',
      img: MyImages.electronicsIcon,
      parentID: '2',
      isFeatured: false,
    ),

    // Clothes
    CategoryModel(
      id: '17',
      name: 'Shirts',
      img: MyImages.clothIcon,
      parentID: '3',
      isFeatured: false,
    ),
  ];

  /// List of all brands
  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: MyImages.nikeLogo,
        name: 'Nike',
        productsCount: 387,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: MyImages.adidasLogo,
        name: 'Adidas',
        productsCount: 87,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: MyImages.jordanLogo,
        name: 'Jordan',
        productsCount: 37,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: MyImages.pumaLogo,
        name: 'Puma',
        productsCount: 47,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: MyImages.appleLogo,
        name: 'Apple',
        productsCount: 7,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: MyImages.zaraLogo,
        name: 'ZARA',
        productsCount: 39,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: MyImages.electronicsIcon,
        name: 'Samsung',
        productsCount: 79,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: MyImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 37,
        isFeatured: false),
    BrandModel(
        id: '9',
        image: MyImages.ikeaLogo,
        name: 'IKEA',
        productsCount: 17,
        isFeatured: false),
    BrandModel(
        id: '10',
        image: MyImages.acerLogo,
        name: 'Acer',
        productsCount: 65,
        isFeatured: false),
  ];

  /// List of all brand categories
  static final List<BrandCategoryModel> brandCategory = [
    BrandCategoryModel(brandID: '1', categoryID: '1'),
    BrandCategoryModel(brandID: '1', categoryID: '8'),
    BrandCategoryModel(brandID: '1', categoryID: '9'),
    BrandCategoryModel(brandID: '1', categoryID: '10'),
    BrandCategoryModel(brandID: '2', categoryID: '1'),
    BrandCategoryModel(brandID: '2', categoryID: '8'),
    BrandCategoryModel(brandID: '2', categoryID: '9'),
    BrandCategoryModel(brandID: '2', categoryID: '10'),
    BrandCategoryModel(brandID: '3', categoryID: '1'),
    BrandCategoryModel(brandID: '3', categoryID: '8'),
    BrandCategoryModel(brandID: '3', categoryID: '9'),
    BrandCategoryModel(brandID: '3', categoryID: '10'),
    BrandCategoryModel(brandID: '4', categoryID: '1'),
    BrandCategoryModel(brandID: '4', categoryID: '8'),
    BrandCategoryModel(brandID: '4', categoryID: '9'),
    BrandCategoryModel(brandID: '4', categoryID: '10'),
    BrandCategoryModel(brandID: '5', categoryID: '15'),
    BrandCategoryModel(brandID: '5', categoryID: '2'),
    BrandCategoryModel(brandID: '10', categoryID: '2'),
    BrandCategoryModel(brandID: '10', categoryID: '14'),
    BrandCategoryModel(brandID: '6', categoryID: '3'),
    BrandCategoryModel(brandID: '6', categoryID: '16'),
    BrandCategoryModel(brandID: '7', categoryID: '2'),
    BrandCategoryModel(brandID: '8', categoryID: '5'),
    BrandCategoryModel(brandID: '8', categoryID: '11'),
    BrandCategoryModel(brandID: '8', categoryID: '12'),
    BrandCategoryModel(brandID: '8', categoryID: '13'),
    BrandCategoryModel(brandID: '9', categoryID: '5'),
    BrandCategoryModel(brandID: '9', categoryID: '11'),
    BrandCategoryModel(brandID: '9', categoryID: '12'),
    BrandCategoryModel(brandID: '9', categoryID: '13'),
  ];

  /// List of all product categories
  static final List<ProductCategoryModel> productCategories = [
    ProductCategoryModel(productID: '001', categoryID: '1'),
    ProductCategoryModel(productID: '001', categoryID: '8'),
    ProductCategoryModel(productID: '004', categoryID: '3'),
    ProductCategoryModel(productID: '002', categoryID: '3'),
    ProductCategoryModel(productID: '002', categoryID: '16'),
    ProductCategoryModel(productID: '003', categoryID: '3'),
    ProductCategoryModel(productID: '005', categoryID: '1'),
    ProductCategoryModel(productID: '005', categoryID: '8'),
    ProductCategoryModel(productID: '040', categoryID: '2'),
    ProductCategoryModel(productID: '040', categoryID: '15'),
    ProductCategoryModel(productID: '006', categoryID: '2'),
    ProductCategoryModel(productID: '007', categoryID: '4'),
    ProductCategoryModel(productID: '009', categoryID: '1'),
    ProductCategoryModel(productID: '009', categoryID: '8'),
    ProductCategoryModel(productID: '010', categoryID: '1'),
    ProductCategoryModel(productID: '010', categoryID: '8'),
    ProductCategoryModel(productID: '011', categoryID: '1'),
    ProductCategoryModel(productID: '011', categoryID: '8'),
    ProductCategoryModel(productID: '012', categoryID: '1'),
    ProductCategoryModel(productID: '012', categoryID: '8'),
    ProductCategoryModel(productID: '013', categoryID: '1'),
    ProductCategoryModel(productID: '013', categoryID: '8'),
    ProductCategoryModel(productID: '014', categoryID: '1'),
    ProductCategoryModel(productID: '014', categoryID: '9'),
    ProductCategoryModel(productID: '015', categoryID: '1'),
    ProductCategoryModel(productID: '015', categoryID: '9'),
    ProductCategoryModel(productID: '016', categoryID: '1'),
    ProductCategoryModel(productID: '016', categoryID: '9'),
    ProductCategoryModel(productID: '017', categoryID: '1'),
    ProductCategoryModel(productID: '017', categoryID: '9'),
    ProductCategoryModel(productID: '018', categoryID: '1'),
    ProductCategoryModel(productID: '018', categoryID: '10'),
    ProductCategoryModel(productID: '019', categoryID: '1'),
    ProductCategoryModel(productID: '019', categoryID: '10'),
    ProductCategoryModel(productID: '020', categoryID: '1'),
    ProductCategoryModel(productID: '020', categoryID: '10'),
    ProductCategoryModel(productID: '021', categoryID: '1'),
    ProductCategoryModel(productID: '021', categoryID: '10'),
    ProductCategoryModel(productID: '022', categoryID: '5'),
    ProductCategoryModel(productID: '022', categoryID: '11'),
    ProductCategoryModel(productID: '023', categoryID: '5'),
    ProductCategoryModel(productID: '023', categoryID: '11'),
    ProductCategoryModel(productID: '024', categoryID: '5'),
    ProductCategoryModel(productID: '024', categoryID: '11'),
    ProductCategoryModel(productID: '025', categoryID: '5'),
    ProductCategoryModel(productID: '025', categoryID: '11'),
    ProductCategoryModel(productID: '026', categoryID: '5'),
    ProductCategoryModel(productID: '026', categoryID: '12'),
    ProductCategoryModel(productID: '027', categoryID: '5'),
    ProductCategoryModel(productID: '027', categoryID: '12'),
    ProductCategoryModel(productID: '028', categoryID: '5'),
    ProductCategoryModel(productID: '028', categoryID: '12'),
    ProductCategoryModel(productID: '029', categoryID: '5'),
    ProductCategoryModel(productID: '029', categoryID: '13'),
    ProductCategoryModel(productID: '030', categoryID: '5'),
    ProductCategoryModel(productID: '030', categoryID: '13'),
    ProductCategoryModel(productID: '031', categoryID: '5'),
    ProductCategoryModel(productID: '031', categoryID: '13'),
    ProductCategoryModel(productID: '032', categoryID: '5'),
    ProductCategoryModel(productID: '032', categoryID: '13'),
    ProductCategoryModel(productID: '033', categoryID: '2'),
    ProductCategoryModel(productID: '033', categoryID: '14'),
    ProductCategoryModel(productID: '034', categoryID: '2'),
    ProductCategoryModel(productID: '034', categoryID: '14'),
    ProductCategoryModel(productID: '035', categoryID: '2'),
    ProductCategoryModel(productID: '035', categoryID: '14'),
    ProductCategoryModel(productID: '036', categoryID: '2'),
    ProductCategoryModel(productID: '036', categoryID: '14'),
    ProductCategoryModel(productID: '037', categoryID: '2'),
    ProductCategoryModel(productID: '037', categoryID: '15'),
    ProductCategoryModel(productID: '038', categoryID: '2'),
    ProductCategoryModel(productID: '038', categoryID: '15'),
    ProductCategoryModel(productID: '039', categoryID: '2'),
    ProductCategoryModel(productID: '039', categoryID: '15'),
    ProductCategoryModel(productID: '008', categoryID: '2'),
  ];

  /// List of all products
  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike Sports Shoe',
      stock: 15,
      price: 85,
      isFeatured: true,
      thumbnail: MyImages.productImage1,
      description: 'Green Nike Sports Shoe',
      brand: BrandModel(
        id: '1',
        image: MyImages.nikeLogo,
        name: 'Nike',
        productsCount: 35,
        isFeatured: true,
      ),
      images: [
        MyImages.productImage1,
        MyImages.productImage23,
        MyImages.productImage21,
        MyImages.productImage9,
      ],
      salePrice: 50,
      sku: 'ABR4568',
      categoryID: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['UK 4.5', 'UK 5', 'UK 6']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 70,
          salePrice: 56,
          image: MyImages.productImage1,
          description:
              'This is a product description for Green Nike Sports Shoe.',
          attributeValues: {'Color': 'Green', 'Size': 'UK 4.5'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 80,
          image: MyImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'UK 4.5'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 80,
          image: MyImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'UK 5'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 155,
          price: 85,
          image: MyImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'UK 4.5'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 0,
          price: 90,
          image: MyImages.productImage23,
          attributeValues: {'Color': 'Red', 'Size': 'UK 4.5'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 11,
          price: 90,
          image: MyImages.productImage23,
          attributeValues: {'Color': 'Red', 'Size': 'UK 6'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-Shirt for all ages',
      stock: 150,
      price: 35,
      isFeatured: true,
      thumbnail: MyImages.productImage69,
      description:
          'This is a product description for Blue Nike Sleeveless vest. There are more things that can be added but...',
      brand: BrandModel(
        id: '6',
        image: MyImages.zaraLogo,
        name: 'ZARA',
      ),
      images: [
        MyImages.productImage68,
        MyImages.productImage69,
        MyImages.productImage5,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryID: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather Brown Jacket',
      stock: 50,
      price: 350,
      isFeatured: false,
      thumbnail: MyImages.productImage64,
      description:
          'This is a product description for Leather Brown Jacket. There are more things that can be added but...',
      brand: BrandModel(
        id: '6',
        image: MyImages.zaraLogo,
        name: 'ZARA',
      ),
      images: [
        MyImages.productImage64,
        MyImages.productImage65,
        MyImages.productImage66,
        MyImages.productImage67,
      ],
      salePrice: 300,
      sku: 'ABR4568',
      categoryID: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar T-Shirt dry fit',
      stock: 15,
      price: 158,
      isFeatured: false,
      thumbnail: MyImages.productImage60,
      description:
          'This is a product description for 4 Color collar T-Shirt dry fit. There are more things that can be added but...',
      brand: BrandModel(
        id: '6',
        image: MyImages.zaraLogo,
        name: 'ZARA',
      ),
      images: [
        MyImages.productImage60,
        MyImages.productImage61,
        MyImages.productImage62,
        MyImages.productImage63,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryID: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 34,
          price: 158,
          salePrice: 108,
          image: MyImages.productImage60,
          description:
              'This is a product description for 4 Color collar T-Shirt dry fit.',
          attributeValues: {'Color': 'Red', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 15,
          price: 126,
          image: MyImages.productImage60,
          attributeValues: {'Color': 'Red', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 104,
          image: MyImages.productImage61,
          attributeValues: {'Color': 'Yellow', 'Size': 'S'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 126,
          image: MyImages.productImage61,
          attributeValues: {'Color': 'Yellow', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 158,
          image: MyImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 18,
          price: 126,
          image: MyImages.productImage62,
          attributeValues: {'Color': 'Green', 'Size': 'M'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 11,
          price: 158,
          image: MyImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'L'},
        ),
        ProductVariationModel(
          id: '7',
          stock: 11,
          price: 126,
          image: MyImages.productImage63,
          attributeValues: {'Color': 'Blue', 'Size': 'M'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '005',
      title: 'Nike Air Jordan Shoes',
      stock: 15,
      price: 118,
      isFeatured: false,
      thumbnail: MyImages.productImage10,
      description:
          'Nike Air Jordan Shoes for running. Quality product, Long Lasting',
      brand: BrandModel(
          id: '1',
          image: MyImages.nikeLogo,
          name: 'Nike',
          productsCount: 50,
          isFeatured: true),
      images: [
        MyImages.productImage7,
        MyImages.productImage8,
        MyImages.productImage9,
        MyImages.productImage10,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryID: '9',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 26,
          price: 118,
          salePrice: 92.80,
          image: MyImages.productImage8,
          description:
              'This is a product description for Nike Air Jordan Shoes.',
          attributeValues: {'Color': 'Orange', 'Size': 'UK 6'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 34,
          price: 96,
          image: MyImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'UK 5'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 5,
          price: 104,
          image: MyImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'UK 5.5'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 89,
          image: MyImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'UK 4.5'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 13,
          price: 118,
          image: MyImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'UK 6'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 18,
          price: 95,
          image: MyImages.productImage8,
          attributeValues: {'Color': 'Orange', 'Size': 'UK 4.5'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'Samsung Galaxy S9 (64GB - 4GB RAM)',
      stock: 25,
      price: 850,
      isFeatured: false,
      thumbnail: MyImages.productImage11,
      description:
          'This is a product description for Samsung Galaxy S9 (64GB - 4GB RAM), Long battery timing. There are more things that can be added but...',
      brand: BrandModel(
        id: '7',
        image: MyImages.electronicsIcon,
        name: 'Samsung',
      ),
      images: [
        MyImages.productImage11,
        MyImages.productImage12,
        MyImages.productImage13,
        MyImages.productImage12,
      ],
      salePrice: 720,
      sku: 'ABR4568',
      categoryID: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Pink', 'Red', 'Blue']),
        // ProductAttributeModel(name: 'Storage', values: ['64GB', '128GB', '256GB']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog Food',
      stock: 12,
      price: 30,
      isFeatured: false,
      thumbnail: MyImages.productImage18,
      description:
          'This is a product description for TOMI Dog Food. There are more things that can be added but...',
      brand: BrandModel(
        id: '7',
        image: MyImages.electronicsIcon,
        name: 'Samsung',
      ),
      images: [
        MyImages.productImage11,
        MyImages.productImage12,
        MyImages.productImage13,
        MyImages.productImage12,
      ],
      salePrice: 20,
      sku: 'ABR4568',
      categoryID: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Pink', 'Red', 'Blue']),
        // ProductAttributeModel(name: 'Storage', values: ['64GB', '128GB', '256GB']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '009',
      title: 'Nike Air Jordan 19',
      stock: 12,
      price: 139,
      isFeatured: false,
      thumbnail: MyImages.productImage19,
      description:
          'Nike Air Jordan Shoes for running. Quality product, Long Lasting',
      brand: BrandModel(
          id: '1',
          image: MyImages.nikeLogo,
          name: 'Nike',
          productsCount: 50,
          isFeatured: true),
      images: [
        MyImages.productImage19,
        MyImages.productImage20,
        MyImages.productImage21,
        MyImages.productImage22,
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryID: '9',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Orange', 'Black', 'Brown']),
        ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L', 'XL']),
      ],
      productVariations: [
        ProductVariationModel(
          id: '1',
          stock: 26,
          price: 118,
          salePrice: 92.80,
          image: MyImages.productImage8,
          description:
              'This is a product description for Nike Air Jordan Shoes.',
          attributeValues: {'Color': 'Orange', 'Size': 'UK 6'},
        ),
        ProductVariationModel(
          id: '2',
          stock: 34,
          price: 96,
          image: MyImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'UK 5'},
        ),
        ProductVariationModel(
          id: '3',
          stock: 5,
          price: 104,
          image: MyImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'UK 5.5'},
        ),
        ProductVariationModel(
          id: '4',
          stock: 15,
          price: 89,
          image: MyImages.productImage7,
          attributeValues: {'Color': 'Black', 'Size': 'UK 4.5'},
        ),
        ProductVariationModel(
          id: '5',
          stock: 13,
          price: 118,
          image: MyImages.productImage9,
          attributeValues: {'Color': 'Brown', 'Size': 'UK 6'},
        ),
        ProductVariationModel(
          id: '6',
          stock: 18,
          price: 95,
          image: MyImages.productImage8,
          attributeValues: {'Color': 'Orange', 'Size': 'UK 4.5'},
        ),
      ],
      productType: 'ProductType.variable',
    ),
  ];
}
