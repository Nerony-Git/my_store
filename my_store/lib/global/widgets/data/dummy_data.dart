import 'package:my_store/utils/constants/images.dart';
import 'package:my_store/utils/models/category_model.dart';
import 'package:my_store/utils/models/user_model.dart';

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

  /// User
  static final UserModel user = UserModel(
      firstName: 'John',
      lastName: 'Doe',
      username: username,
      email: 'bughuntedbykwaku@gmail.com',
      phoneNumber: '03749274992',
      profilePicture: MyImages.user,
      address: [
        AddressModel(
          id: '1',
          name: 'John Doe',
          phoneNumber: '03749274992',
          street: 'Hill Avenue',
          city: 'Watford',
          county: 'Hertfordshire',
          postalCode: 'WD24 3YS',
          country: 'UK',
        ),
        AddressModel(
          id: '1',
          name: 'John Doe',
          phoneNumber: '03749274992',
          street: 'Hill Avenue',
          city: 'Watford',
          county: 'Hertfordshire',
          postalCode: 'WD24 3YS',
          country: 'UK',
        ),
      ]);

  /// Cart
  static final CartModel cart = CartModel(
    cartID: '001',
    items: [
      CartItemModel(
        productID: '001',
        variationID: '1',
        quantity: 2,
        title: products[0].title,
        img: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
      CartItemModel(
        productID: '002',
        variationID: '1',
        quantity: 1,
        title: products[0].title,
        img: products[0].thumbnail,
        brandName: products[0].brand!.name,
        price: products[0].productVariations![0].price,
        selectedVariation: products[0].productVariations![0].attributeValues,
      ),
    ],
  );

  /// Order
  static final List<OrderModel> orders = [
    OrderModel(
      id: 'MSA0023',
      status: OrdeerStatus.processing,
      items: cart.items,
      totalAmount: 85,
      orderDate: DateTime(2024, 03, 20),
      deliveryDate: DateTime(2024, 04, 10),
    ),
    OrderModel(
      id: 'MSA0023',
      status: OrdeerStatus.shipped,
      items: cart.items,
      totalAmount: 85,
      orderDate: DateTime(2024, 02, 15),
      deliveryDate: DateTime(2024, 03, 2),
    ),
  ];

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
}
