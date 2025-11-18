import 'package:flutter/material.dart';
import 'package:football_store/models/products_entry.dart';

class ProductsEntryCard extends StatelessWidget {
  final ProductsEntry productsEntry;
  final VoidCallback onTap;

  const ProductsEntryCard({
    super.key,
    required this.productsEntry,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final String? thumb = productsEntry.thumbnail;
    final bool hasThumb = thumb != null && thumb.isNotEmpty;
    final String? proxiedUrl = hasThumb
        ? 'http://localhost:8000/proxy-image/?url=${Uri.encodeComponent(thumb)}'
        : null;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
            side: BorderSide(color: Colors.grey.shade300),
          ),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail
                ClipRRect(
                  borderRadius: BorderRadius.circular(6),
                  child: proxiedUrl != null
                      ? Image.network(
                          proxiedUrl,
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            height: 150,
                            color: Colors.grey[300],
                            child: const Center(child: Icon(Icons.broken_image)),
                          ),
                        )
                      : Container(
                          height: 150,
                          width: double.infinity,
                          color: Colors.grey[300],
                          child: const Center(child: Icon(Icons.broken_image)),
                        ),
                ),
                const SizedBox(height: 8),

                // Name
                Text(
                  productsEntry.name,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Price
                Text(
                  '\$${productsEntry.price}',
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),

                // Category
                Text('Category: ${productsEntry.category}'),
                const SizedBox(height: 6),

                // Content preview
                Text(
                  productsEntry.description.length > 100
                      ? '${productsEntry.description.substring(0, 100)}...'
                      : productsEntry.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.black54),
                ),
                const SizedBox(height: 6),

                // Featured indicator
                if (productsEntry.isFeatured)
                  const Text(
                    'Featured',
                    style: TextStyle(
                      color: Colors.amber,
                      fontWeight: FontWeight.bold
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}