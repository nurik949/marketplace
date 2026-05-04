import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:marketplace/feature/main/presentation/products_more.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../model/Products_model.dart';
import '../model/brands_model.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {

  String? selectedBrandId;
  String? searchText;
  Timer? _debounce;

  late Future<List<BrandsModel>> brands;

  void logout() async {
    try {
      await Supabase.instance.client.auth.signOut();

      if (!mounted) return;

      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<List<BrandsModel>> fetchBrands() async {
    final response = await Supabase.instance.client
        .from('brands')
        .select()
        .order('title');

    return (response as List)
        .map((brand) => BrandsModel.fromJson(brand))
        .toList();
  }

  Future<List<ProductsModel>> fetchProducts({
    String? brandId,
    String? searchText,
  }) async {
    var query = Supabase.instance.client.from('products').select();

    if (brandId != null) {
      query = query.eq('brand_id', brandId);
    }

    if(searchText != null) {
      query = query.ilike('text', '%$searchText%');
    }
    final response = await query;

    return (response as List)
        .map((product) => ProductsModel.fromJson(product))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B262C),
      drawer: CustomAppDrawer(),
      appBar: AppBar(
        backgroundColor: Color(0xFF1B262C),
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  borderRadius: BorderRadius.circular(30),
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const CircleAvatar(
                    backgroundColor: Color(0xFF222E34),
                    backgroundImage: AssetImage(
                      'assets/image/menu.png',
                    ),
                  ),
                ),
              );
            }),
      ),
      body: CustomScrollView(
        slivers: [
          SearchBody(
            onChanged: (value) {
              if (_debounce?.isActive ?? false) _debounce!.cancel();

              _debounce = Timer(const Duration(milliseconds: 500), () {
                setState(() {
                  searchText = value
                      .trim();
                });
              });
            },
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('Choose Brand',style: TextStyle(color: Colors.white,fontSize: 23),),
                  Text('View All',style: TextStyle(color: Color(0xFF8F959E),fontSize: 20),)
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          CategoryBody(
            brands: fetchBrands(),
            selectedBrandId: selectedBrandId,
            onTap: (brandId) {
              setState(() {
                selectedBrandId = (selectedBrandId == brandId)
                    ? null
                    : brandId;
              });
            },
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text('New Arraival',
                    style: TextStyle(color: Colors.white, fontSize: 23),),
                  Text('View All',
                    style: TextStyle(color: Color(0xFF8F959E), fontSize: 20),),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 15,),
          ),
          ProductBody(
              products: fetchProducts(
                brandId: selectedBrandId,
                searchText: searchText,
              ),
          ),
        ],
      ),
    );
  }
}

class CustomAppDrawer extends StatefulWidget {
  const CustomAppDrawer({super.key});

  @override
  State<CustomAppDrawer> createState() => _CustomAppDrawerState();
}

class _CustomAppDrawerState extends State<CustomAppDrawer> {
  bool isDarkMode = false;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF1B262C),
      surfaceTintColor: Colors.transparent,
      child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Column(
            crossAxisAlignment: .start,
            children: [
              const SizedBox(height: 10,),
              MenuCloseButton(),
              const SizedBox(height: 30,),
              UserProfileSection(),
              const SizedBox(height: 40,),
              Expanded(
                  child:SingleChildScrollView(
                    child: Column(
                      spacing: 10,
                      children: [
                        DrawerTile(
                          icon: CupertinoIcons.sun_max,
                          title: 'Dark Mode',
                          trailing: CupertinoSwitch(
                            value: isDarkMode,
                            onChanged: (v) => setState(()=> isDarkMode =v),
                          ),
                        ),
                        DrawerTile(icon: CupertinoIcons.info, title: 'Account Information',onTap: (){},),
                        DrawerTile(icon: CupertinoIcons.lock, title: 'Password',onTap: (){},),
                        DrawerTile(icon: CupertinoIcons.bag, title: 'Order',onTap: (){},),
                        DrawerTile(icon: Icons.account_balance_wallet_outlined, title: 'My Cards',onTap: (){},),
                        DrawerTile(icon: Icons.favorite_border, title: 'Wishlist',onTap: (){},),
                        DrawerTile(icon: CupertinoIcons.settings, title: 'Setting',onTap: (){},),
                        ],
                    ),
                  )
              ),
              LogoutButton(onTap:(){}),
              const SizedBox(height: 20,)
           ],
          ),
          ),
      ),
    );
  }
}

class DrawerTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget? trailing;
  final VoidCallback? onTap;

  const DrawerTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.onTap

  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon,color: Color(0xFFF5F8FB)),
            const SizedBox(width: 16,),
            Expanded(child: Text(title,style: TextStyle(fontSize: 16,color: Color(0xFFF5F8FB)))),
            if (trailing != null) trailing!,
          ],
        ),
      ),
    );
  }
}

class MenuCloseButton extends StatelessWidget {
  const MenuCloseButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: ()=> Scaffold.of(context).closeDrawer(),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Color(0xFF222E34),
          shape: BoxShape.circle,
        ),
        child: const Icon(Icons.sort,color: Color(0xFFF5F8FB),),
      ),
    );
  }
}

class UserProfileSection extends StatelessWidget {
  const UserProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(radius: 26,backgroundImage: AssetImage('assets/images/menus.png'),),
        const SizedBox(width: 12,),
        Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: const[
                Text('Mrj Raju',style: TextStyle(fontSize: 18,fontWeight: .w600,color: Color(0xFFF5F8FB))),
                SizedBox(height: 4,),
                Text('Verified Profile',style: TextStyle(color: Color(0xFFF5F8FB)),),
              ],
            )
        ),
        Container(
          width: 66,
          height: 32,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(0xFF222E34),
            borderRadius: BorderRadius.circular(5)
          ),
          child: Text('3 Orders',style: TextStyle(
            color: Color(0xFF8F959E),
            fontSize: 11,
            fontWeight: .w500,
          ),),
        ),
      ],
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key, required Null Function() onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){},
      child: Row(
        children: [
          Icon(Icons.logout,color: Colors.redAccent,),
          SizedBox(width: 16,),
          Text('logout',style: TextStyle(fontSize: 16,color: Colors.redAccent)),
        ],
      ),
    );
  }
}

class SearchBody extends StatelessWidget {
  final Function(String)? onChanged;
  const SearchBody({super.key, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            SizedBox(height: 20,),
            Text('Hello',style: TextStyle(fontSize: 28,fontWeight: .w600,color: Colors.white),),
            Text('Welcome To Laza.',style: TextStyle(fontSize: 15,fontWeight: .w400,color: Color(0xFF8F959E)),),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  SizedBox(
                    height: 50,
                    width: 290,
                    child: TextFormField(
                      onChanged: onChanged,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hint: Row(
                            children: [
                              Icon(CupertinoIcons.search,color: Color(0xFF8F959E),size: 20,),
                              SizedBox(width: 10,),
                              Text('Search...',style: TextStyle(fontSize: 15,fontWeight: .w400,color: Color(0xFF8F959E)),)
                            ],
                          ),
                          fillColor: Color(0xFFF5F6FA),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFFF5F6FA)),
                            borderRadius: BorderRadius.circular(10),
                          )
                      ),
                    ),
                  ),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Color(0xFF9775FA),
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(CupertinoIcons.mic,color: Color(0xFFFEFEFE),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryBody extends StatelessWidget {
  final Future<List<BrandsModel>> brands;
  final String? selectedBrandId;
  final ValueChanged<String> onTap;

  const CategoryBody({super.key, required this.brands, this.selectedBrandId, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 50,
        child: FutureBuilder<List<BrandsModel>>(
            future: brands,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Text("Ошибка: ${snapshot.error}");
              }
              final brands = snapshot.data ?? [];
              if (brands.isEmpty) {
                return const Text("Бренды не найдены",style: TextStyle(color: Colors.white),);
              }

              return SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: brands.length,
                    itemBuilder: (context, index) {
                      final brand = brands[index];
                      final isSelected = brand.id == selectedBrandId;
                      return GestureDetector(
                        onTap: () => onTap(brand.id),
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              color: Color(0xFF222E34),
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: isSelected
                                  ? Colors.deepPurpleAccent
                                  : Colors.transparent, width: 3)
                          ),
                          alignment: Alignment.center,
                          child: Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF29363D),
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child: Image.network(brand.image),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                brand.title,
                                style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}

class ProductBody extends StatelessWidget {
  final Future<List<ProductsModel>> products;
  const ProductBody({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Expanded(
        child: FutureBuilder<List<ProductsModel>>(
          future: products,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }

              if (snapshot.hasError) {
                return Text("Ошибка: ${snapshot.error}");
              }

              final productsData = snapshot.data ?? [];

              if (productsData.isEmpty) {
                return const Text("Продукты не найдены");
              }

              return GridView.builder(
                itemCount: productsData.length,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.54,
                ),
                itemBuilder: (context, index) {
                  final product = productsData[index];

                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              Products_more(productsModel: product)
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        crossAxisAlignment: .start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade100,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Image.network(
                              product.imageUrl,
                              fit: BoxFit.fill,
                              height: 240,
                              width: 230,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            product.text,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            '\$${product.price}',
                            style: const TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
        ),
      ),
    );
  }
}
