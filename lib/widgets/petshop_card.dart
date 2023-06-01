import 'package:flutter/material.dart';
import 'package:petshop/screens/detail_screen.dart';
import 'package:petshop/screens/theme.dart';
import 'package:petshop/models/menu.dart';

class PetshopCard extends StatelessWidget {
  final Menu menu;
  const PetshopCard(this.menu, {super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(
                      menu.id,
                      menu.image,
                      menu.name,
                      menu.address,
                    )));
      },
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                // ignore: sized_box_for_whitespace
                child: Container(
                  width: 130,
                  height: 110,
                  child: Image.network(
                    menu.image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      // ignore: unnecessary_string_interpolations
                      '${menu.name}',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      // ignore: unnecessary_string_interpolations
                      '${menu.address}',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: greyColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Best Service',
                      style: poppinsTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w300,
                        color: yellowColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
