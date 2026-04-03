import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main()=>runApp(const MyApp());
final _router=GoRouter(
    routes:[
      GoRoute(path: '/',
          name: 'home',
          builder: (_, _)=> const HomeScreen()),
      GoRoute(
          path:'/details',
          name: 'details',
          builder: (_, _)=> const DetailsScreen()
      ),
      GoRoute(
          path: '/product/:id',
          builder: (context,state){
            final id=state.pathParameters['id']!;
            final filter = state.uri.queryParameters['filter'] ?? 'all';
            return ProductDetailScreen(id: id, filter:filter);
          },
      )
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

class ProductDetailScreen extends StatelessWidget{
  final String id;
  final String filter;
  const ProductDetailScreen({
    super.key,
    required this.id,
    required this.filter,
});
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('Product $id')),
      body: Center(child: Text('Showing product $id\nFilter: $filter')),
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