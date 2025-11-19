import 'package:flutter/material.dart';
import 'package:football_store/models/products_entry.dart';
import 'package:football_store/widgets/left_drawer.dart';
import 'package:football_store/screens/products_detail.dart';
import 'package:football_store/widgets/products_entry_card.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class ProductsEntryListPage extends StatefulWidget {
  const ProductsEntryListPage({super.key, required this.filterByUser});
  final bool filterByUser; // false untuk semua produk, true untuk produk user saja

  @override
  State<ProductsEntryListPage> createState() => _ProductsEntryListPageState();
}

class _ProductsEntryListPageState extends State<ProductsEntryListPage> {
  Future<List<ProductsEntry>> fetchProducts(CookieRequest request) async {
    String urlEndpoint = widget.filterByUser
        ? 'http://localhost:8000/json-by-user/' // Endpoint User
        : 'http://localhost:8000/json/';        // Endpoint Semua
    // TODO: Replace the URL with your app's URL and don't forget to add a trailing slash (/)!
    // To connect Android emulator with Django on localhost, use URL http://10.0.2.2/
    // If you using chrome,  use URL http://localhost:8000
    
    final response = await request.get(urlEndpoint);
    
    // Decode response to json format
    var data = response;
    
    // Convert json data to ProductsEntry objects
    List<ProductsEntry> listProducts = [];
    for (var d in data) {
      if (d != null) {
        listProducts.add(ProductsEntry.fromJson(d));
      }
    }
    return listProducts;
  }

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products Entry List'),
      ),
      drawer: const LeftDrawer(),
      body: FutureBuilder(
        future: fetchProducts(request),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return const Column(
                children: [
                  Text(
                    'There are no products in the store yet.',
                    style: TextStyle(fontSize: 20, color: Color(0xff59A5D8)),
                  ),
                  SizedBox(height: 8),
                ],
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => ProductsEntryCard(
                  productsEntry: snapshot.data![index],
                  onTap: () {
                    // Navigate to products detail page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductsDetailPage(
                          products: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                ),
              );
            }
          }
        },
      ),
    );
  }
}