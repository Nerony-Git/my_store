import 'package:get/get.dart';
import 'package:my_store/features/email/screens/verify_email.dart';
import 'package:my_store/features/home/screens/home.dart';
import 'package:my_store/features/login/screens/login.dart';
import 'package:my_store/features/onboarding/screens/onboarding.dart';
import 'package:my_store/features/order/screens/order.dart';
import 'package:my_store/features/password/screens/forget_password.dart';
import 'package:my_store/features/product/screens/product_detail.dart';
import 'package:my_store/features/product/screens/product_reviews.dart';
import 'package:my_store/features/profile/screens/address.dart';
import 'package:my_store/features/profile/screens/profile.dart';
import 'package:my_store/features/profile/screens/settings.dart';
import 'package:my_store/features/signup/screens/signup.dart';
import 'package:my_store/features/store/screens/all_products.dart';
import 'package:my_store/features/store/screens/brand.dart';
import 'package:my_store/features/store/screens/cart.dart';
import 'package:my_store/features/store/screens/checkout.dart';
import 'package:my_store/features/store/screens/store.dart';
import 'package:my_store/features/store/screens/sub_category.dart';
import 'package:my_store/features/store/screens/wishlist.dart';
import 'package:my_store/utils/models/brand_model.dart';
import 'package:my_store/utils/models/category_model.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/routes/routes.dart';

class AppRoutes {
  static final pages = [
    GetPage(name: Routes.home, page: () => const HomeScreen()),
    GetPage(name: Routes.store, page: () => const StoreScreen()),
    GetPage(name: Routes.wishlist, page: () => const WishlistScreen()),
    GetPage(name: Routes.settings, page: () => const SettingsScreen()),
    GetPage(
        name: Routes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(name: Routes.order, page: () => const OrderScreen()),
    GetPage(name: Routes.checkout, page: () => const CheckoutScreen()),
    GetPage(name: Routes.cart, page: () => const CartScreen()),
    GetPage(name: Routes.userProfile, page: () => const ProfileScreen()),
    GetPage(name: Routes.userAddress, page: () => const AddressScreen()),
    GetPage(name: Routes.signUp, page: () => const SignUpScreen()),
    GetPage(name: Routes.verifyEmail, page: () => const VerifyEmailScreen()),
    GetPage(name: Routes.signIn, page: () => const LoginScreen()),
    GetPage(
        name: Routes.forgetPassword, page: () => const ForgetPasswordScreen()),
    GetPage(name: Routes.onBoarding, page: () => const OnBoardingScreen()),
    GetPage(
        name: Routes.subCategories,
        page: () => SubCategoryScreen(
              category: CategoryModel.empty(),
            )),
    GetPage(
        name: Routes.productDetails,
        page: () => ProductDetailScreen(
              product: ProductModel.empty(),
            )),
    GetPage(
        name: Routes.productReviews, page: () => const ProductReviewsScreen()),
    GetPage(
        name: Routes.brand,
        page: () => BrandScreen(
              brand: BrandModel.empty(),
            )),
    GetPage(
        name: Routes.allProducts,
        page: () => const AllProductsScreen(
              title: 'Popular Products',
            )),
  ];
}
