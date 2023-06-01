import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:petshop/screens/theme.dart';
import 'package:petshop/widgets/petshop_card.dart';
import 'package:petshop/models/menu.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  //const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference products = firestore.collection('products');
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 32,
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo..',
                style: poppinsTextStyle.copyWith(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: blackColor,
                ),
              ),
              Text(
                'Selamat Datang Di Petshop App',
                style: poppinsTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: greyColor,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Recommended Petshop',
                style: poppinsTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: yellowColor,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              StreamBuilder<QuerySnapshot>(
                  stream: products.orderBy('id', descending: false).snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasData) {
                      return Column(
                        // ignore: unnecessary_cast
                        children: (snapshot.data! as QuerySnapshot)
                            .docs
                            .map(
                              (e) => PetshopCard(
                                Menu(
                                  id: e['id'],
                                  image: e['image'],
                                  name: e['name'],
                                  address: e['address'],
                                ),
                              ),
                            )
                            .toList(),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
