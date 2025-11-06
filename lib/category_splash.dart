
import 'package:flutter/material.dart';

class CategorySplash extends StatefulWidget {
  final Widget child;
  final String title;
  const CategorySplash({required this.child, required this.title, super.key});
  @override State<CategorySplash> createState() => _CategorySplashState();
}

class _CategorySplashState extends State<CategorySplash> {
  bool show = true;
  @override void initState(){ super.initState(); Future.delayed(const Duration(milliseconds:600), ()=> setState(()=> show=false)); }
  @override Widget build(BuildContext context){
    return AnimatedSwitcher(duration: const Duration(milliseconds:300), child: show ? Scaffold(backgroundColor: const Color(0xFFdfdbd3), body: Center(child: Text(widget.title, style: const TextStyle(fontSize:28,fontWeight: FontWeight.bold)))) : widget.child);
  }
}
