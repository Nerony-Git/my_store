import 'package:get/get.dart';
import 'package:my_store/features/product/controllers/variation_controller.dart';
import 'package:my_store/utils/constants/enums.dart';
import 'package:my_store/utils/models/cart_item_model.dart';
import 'package:my_store/utils/models/product_model.dart';
import 'package:my_store/utils/popups/loaders.dart';
import 'package:my_store/utils/storage/local_storage.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  /// Variables
  RxInt totalCartItems = 0.obs;
  RxDouble totalCartAmount = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  /// Constructor
  CartController() {
    loadCartItems();
  }

  /// Function to add items to cart
  void addToCart(ProductModel product) {
    // Check quantity of product  is less than 1
    if (productQuantityInCart.value < 1) {
      SnackBars.customToast(message: 'Select Quantity');
      return;
    }

    // Check is product has variation and variation not selected
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      SnackBars.customToast(message: 'Select Variation');
      return;
    }

    // Check if product has variation
    if (product.productType == ProductType.variable.toString()) {
      // Check if product is out of stock
      if (variationController.selectedVariation.value.stock < 1) {
        SnackBars.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected variation is out of stock.');
        return;
      }
    } else {
      // Check if product is out of stock
      if (product.stock < 1) {
        SnackBars.warningSnackBar(
            title: 'Oh Snap!', message: 'Selected product is out of stock.');
        return;
      }
    }

    /// Convert product to cart item.
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);

    // Check if product is already added to cart
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productID == selectedCartItem.productID &&
        cartItem.variationID == selectedCartItem.variationID);
    if (index >= 0) {
      cartItems[index].quantity = selectedCartItem.quantity;
    } else {
      cartItems.add(selectedCartItem);
    }

    // Update cart
    updateCart();
    SnackBars.customToast(message: 'Product added to your cart.');
  }

  /// Function to increase quantity of cart item by one
  void increaseByOne(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productID == item.productID &&
        cartItem.variationID == item.variationID);
    if (index >= 0) {
      cartItems[index].quantity += 1;
    } else {
      cartItems.add(item);
    }

    // update cart
    updateCart();
  }

  /// Function to decrease quantity of cart item by one
  void decreaseByOne(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem) =>
        cartItem.productID == item.productID &&
        cartItem.variationID == item.variationID);
    if (index >= 0) {
      // Check if quantity is greater than 1
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity -= 1;
      } else {
        // Show dialog before completely removing item
        cartItems[index].quantity == 1
            ? removeFromCartDialog(index)
            : cartItems.removeAt(index);
      }
    }

    // update cart
    updateCart();
  }

  /// Dialog to
  void removeFromCartDialog(int index) {
    Get.defaultDialog(
      title: 'Remove Product',
      middleText: 'Are you sure you want to remove this product',
      onConfirm: () {
        // Remove the item form the cart
        cartItems.removeAt(index);
        updateCart();
        SnackBars.customToast(message: 'Product removed from your cart.');
        Get.back();
      },
      onCancel: () => () => Get.back(),
    );
  }

  /// Function to update already added item's quantity in cart
  void updateProductCount(ProductModel product) {
    // If product has no variation
    if (product.productType == ProductType.single.toString()) {
      // Calculate quantity in cart and display total quantity
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    } else {
      // Make default quantity to 0 and show quantity when variation is selected
      final variationID = variationController.selectedVariation.value.id;
      if (variationID.isNotEmpty) {
        productQuantityInCart.value =
            getVariationQuantityInCart(product.id, variationID);
      } else {
        productQuantityInCart.value = 0;
      }
    }
  }

  /// Function to convert a product model to a cart item model
  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    // Check if product type is not a variation
    if (product.productType == ProductType.single.toString()) {
      // Reset variation
      variationController.resetSelectedAttributes();
    }

    // Get product variation
    final variation = variationController.selectedVariation.value;

    // Check if variation is not empty
    final isVariation = variation.id.isNotEmpty;

    // Get the price ans check for discount price
    final price = isVariation
        ? variation.salePrice > 0.0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0.0
            ? product.salePrice
            : product.price;

    // return cart item model
    return CartItemModel(
      productID: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationID: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }

  /// Function to update cart
  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  /// Function to update cart totals
  void updateCartTotal() {
    // Variables
    double calculatedTotalPrice = 0.0;
    int calculatedTotalItems = 0;

    // Loop through each cart item
    for (var item in cartItems) {
      calculatedTotalPrice += (item.price) * item.quantity.toDouble();
      calculatedTotalItems += item.quantity;
    }

    // Assign values
    totalCartAmount.value = calculatedTotalPrice;
    totalCartItems.value = calculatedTotalItems;
  }

  /// Function to save cart items to storage
  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    MyLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  /// Function to load cart items from local storage
  void loadCartItems() {
    final cartItemStrings =
        MyLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  /// Function to get quantity of products in cart
  int getProductQuantityInCart(String productID) {
    final foundItem = cartItems
        .where((item) => item.productID == productID)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  /// Function to  get variation quantity
  int getVariationQuantityInCart(String productID, String variationID) {
    final foundItem = cartItems.firstWhere(
      (item) => item.productID == productID && item.variationID == variationID,
      orElse: () => CartItemModel.empty(),
    );
    return foundItem.quantity;
  }

  /// Function to clear cart
  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }
}
