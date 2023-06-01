import 'package:flutter/material.dart';
import 'package:petshop/screens/theme.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class DetailScreen extends StatelessWidget {
  int id;
  String image;
  String name;
  String address;

  DetailScreen(this.id, this.image, this.name, this.address, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    launchUrl(String url) async {
      // ignore: deprecated_member_use
      if (await canLaunch(url)) {
        // ignore: deprecated_member_use
        await launch(url);
      }
    }

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              color: Colors.white,
            ),
            Positioned(
              top: 13,
              left: 0,
              right: 0,
              child: Transform.scale(
                scale: 1.2,
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Image.asset(
                      'assets/btn_back.png',
                      width: 45,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'assets/btn_share.png',
                      width: 45,
                    ),
                  ),
                ],
              ),
            ),
            ListView(
              children: [
                const SizedBox(
                  height: 264,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 30,
                          horizontal: 24,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              'assets/promo.png',
                              width: 60,
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              name,
                              style: poppinsTextStyle.copyWith(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Deskripsi Toko',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                'Kami menyediakan berbagai kebutuhan makanan snack, accesories, suplement vitamin serta perawatan salon untuk hewan kesayangan anda, percayakan semua kebutuhan dan perawatan hewan kesayangan anda hanya kepada kami. we are open every day at 08:00-21:00 WIB.',
                                style: poppinsTextStyle.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: greyColor,
                                ),
                                textAlign: TextAlign.justify,
                              ),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Text(
                              'Lokasi Happy Petshop & Grooming',
                              style: poppinsTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: blackColor,
                              ),
                            ),
                            const SizedBox(
                              height: 12,
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                    "https://goo.gl/maps/vDERRGt9WwtWMso87?coh=178571&entry=tt");
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/store.png',
                                    width: 50,
                                  ),
                                  const SizedBox(width: 18),
                                  Text(
                                    address,
                                    style: poppinsTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: greyColor,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: greyColor,
                                      size: 30,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
