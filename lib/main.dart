import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Product {
  String name;
  String category;
  double price;
  String imageUrl;

  Product({
    required this.name,
    required this.category,
    required this.price,
    required this.imageUrl,
  });
}

class StoreProfile {
  String storeName;
  String storeImage;
  int followers;

  StoreProfile({
    required this.storeName,
    required this.storeImage,
    required this.followers,
  });
}

class MyApp extends StatelessWidget {
  final StoreProfile storeProfile = StoreProfile(
    storeName: 'Goject Mantap',
    storeImage: 'https://static-00.iconduck.com/assets.00/gojek-icon-512x512-dyy6mlv4.png',
    followers: 1000,
  );

  final List<Product> products = [
    Product(
      name: 'Smartphone',
      category: 'Elektronik',
      price: 599.99,
      imageUrl: 'https://cdn.eraspace.com/media/catalog/product/a/p/apple_iphone_11_green_1_2_1_1_1_1.jpg',
    ),
    Product(
      name: 'Laptop',
      category: 'Elektronik',
      price: 1299.99,
      imageUrl: 'https://www.asus.com/media/Odin/Websites/global/ProductLine/20200824120842.jpg',
    ),
    Product(
      name: 'T-shirt',
      category: 'Baju',
      price: 19.99,
      imageUrl: 'https://images.tokopedia.net/img/cache/500-square/VqbcmM/2022/8/5/be9f8a83-27a3-4196-8ce3-c0eefbe336c1.jpg',
    ),
    Product(
      name: 'Soda',
      category: 'Beverages',
      price: 1.99,
      imageUrl: 'https://s1.bukalapak.com/img/60691481992/s-463-463/a2613c07_b637_4a4b_88e6_d1b22bb2b5b3.jpg.webp',
    ),
    Product(
      name: 'Ciki',
      category: 'Beverages',
      price: 1.99,
      imageUrl: 'https://lzd-img-global.slatic.net/g/ff/kf/S4b109cfbbf454f0a9fb25eeeebc96bebL.jpg_720x720q80.jpg',
    ),
    // Add more products as needed
  ];
  
  final List<String> categories = [
    'Terlaris',
    'Elektronik',
    'Baju',
    'Minuman',
    'Makanan',
  ];

  @override
Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Alfamart Online'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildStoreProfile(),
            _buildCategoriesBar(),
            Expanded(
              child: ListView.builder(
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return _buildProductItem(context, index);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
Widget _buildStoreProfile() {
    return Container(
      padding: EdgeInsets.all(16.0),
      color: Colors.blue,
      child: Row(
        children: [
          CircleAvatar(
            radius: 40.0,
            backgroundImage: NetworkImage(storeProfile.storeImage),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                storeProfile.storeName,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${storeProfile.followers} Followers',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoriesBar() {
    return Container(
      height: 40.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Center(
              child: Text(categories[index]),
            ),
          );
        },
      ),
    );
  }
  Widget _buildProductItem(BuildContext context, int index) {
    Product product = products[index];

    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(
          product.imageUrl,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        title: Text(product.name),
        subtitle: Text('${product.category} - \$${product.price}'),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            // Implement logic to add product to shopping cart
            // You can use a state management solution like Provider or Riverpod
            // or navigate to a new screen for cart management
          },
        ),
      ),
    );
  }
}
