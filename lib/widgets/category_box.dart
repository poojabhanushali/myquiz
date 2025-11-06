
import 'package:flutter/material.dart';

class CategoryBox extends StatelessWidget {
  final String title;
  final String image;
  final VoidCallback onTap;
  const CategoryBox({required this.title, required this.image, required this.onTap, super.key});

  @override Widget build(BuildContext context){
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black12, blurRadius:6)]),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (image.isNotEmpty) Image.asset(image, width: 80, height: 80, fit: BoxFit.cover) else const Icon(Icons.category, size:64),
          const SizedBox(height:8),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
        ]),
      ),
    );
  }
}
