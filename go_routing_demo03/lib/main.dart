import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main()=>runApp(const MyApp());
final _router=GoRouter(
    routes:[
      GoRoute(path: '/',
          builder: (_, _)=> const HomeScreen()),
      GoRoute(
          path:'/details',
          name: 'details',
          builder: (_, _)=> const DetailsScreen()
      ),
    ]
);
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return MaterialApp.router(
      title: 'go_router Lesson 1',
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: ElevatedButton(
            onPressed: ()=>context.goNamed('details'),
            child: Text('Go to details')),
      ),
    );
  }
}

class DetailsScreen extends StatelessWidget{
  const DetailsScreen({super.key});
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: const Center(child: Text('This is the details screen!')),
    );
  }
}