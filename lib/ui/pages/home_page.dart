import 'package:covid19/shared/theme.dart';
import 'package:covid19/ui/widgets/edu_card.dart';
import 'package:covid19/ui/widgets/info_card.dart.dart';
import 'package:covid19/ui/widgets/kasus_prov_card.dart';
import 'package:covid19/ui/widgets/status_card.dart';
import 'package:covid19/ui/widgets/subtittle_text.dart';
import 'package:covid19/ui/widgets/tittle_text.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget image() {
      return Container(
        width: double.infinity,
        height: 406,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/home_page_image.png'),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget apaItu() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: EduCard(
            onTap: () {
              launchUrl(Uri.parse('https://id.wikipedia.org/wiki/Koronavirus'),
                  mode: LaunchMode.externalApplication);
            },
            tittle: 'Apa itu virus corona ?',
            imageUrl: 'assets/icons/icon_corona.png',
            subTittle:
                'Coronavirus (istilah populer: virus korona,\nvirus corona, atau virus Corona) adalah'),
      );
    }

    Widget infoCard() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InformasiCard(
                onTap: () {
                  launchUrl(Uri.parse('https://www.detik.com/tag/virus-corona'),
                      mode: LaunchMode.externalApplication);
                },
                color: blueColor,
                imageUrl: 'assets/icons/icon_news.png',
                tittle: 'Berita',
              ),
              InformasiCard(
                onTap: () {
                  launchUrl(
                      Uri.parse(
                          'https://www.kompas.com/tag/rumah-sakit-corona'),
                      mode: LaunchMode.externalApplication);
                },
                color: yellowColor,
                imageUrl: 'assets/icons/icon_hospital.png',
                tittle: 'Rumah Sakit',
              ),
              InformasiCard(
                onTap: () {
                  launchUrl(Uri.parse('https://www.alodokter.com/virus-corona'),
                      mode: LaunchMode.externalApplication);
                },
                color: greenColor,
                imageUrl: 'assets/icons/icon_education.png',
                tittle: 'Pendidikan',
              ),
              InformasiCard(
                onTap: () {
                  launchUrl(Uri.parse('https://covid19.go.id/p/hoax-buster'),
                      mode: LaunchMode.externalApplication);
                },
                color: redColor,
                imageUrl: 'assets/icons/icon_hoax.png',
                tittle: 'Hoax',
              ),
            ],
          ),
        ),
      );
    }

    Widget kasusHari() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          children: [
            Row(
              children: const [
                TittleText(text: 'Update Kasus Hari Ini'),
                SizedBox(
                  width: 10,
                ),
                SubTittleText(text: '23 July 2021'),
              ],
            ),
            const SizedBox(
              height: 6,
            ),
            StatusCard(
              total: 6052100,
              color: yellowColor,
              kasus: 'Positif',
            ),
            StatusCard(
              total: 5891872,
              color: greenColor,
              kasus: 'Sembuh',
            ),
            StatusCard(
              total: 3715,
              color: blueColor,
              kasus: 'Dirawat',
            ),
            StatusCard(
              total: 156513,
              color: redColor,
              kasus: 'meninggal',
            ),
          ],
        ),
      );
    }

    Widget hotline() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: EduCard(
          onTap: () {
            launchUrl(
              Uri(
                scheme: 'tel',
                path: '119',
              ),
            );
          },
          tittle: 'Hotline',
          imageUrl: 'assets/icons/icon_hotline.png',
          subTittle: 'Hubungi pihak terkait untuk pelaporan',
        ),
      );
    }

    Widget kasusProvinsi() {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
          children: const [
            KasusProvCard(
                kota: 'DKI JAKARTA',
                positif: 1249253,
                sembuh: 1233220,
                dirawat: 752,
                meninggal: 15281),
            KasusProvCard(
                kota: 'JAWA BARAT',
                positif: 1249253,
                sembuh: 1233220,
                dirawat: 752,
                meninggal: 15281),
            KasusProvCard(
                kota: 'JAWA TIMUR',
                positif: 1249253,
                sembuh: 1233220,
                dirawat: 752,
                meninggal: 15281),
            KasusProvCard(
                kota: 'JAWA TENGAH',
                positif: 1249253,
                sembuh: 1233220,
                dirawat: 752,
                meninggal: 15281),
          ],
        ),
      );
    }

    Widget content() {
      return Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 304),
        padding: const EdgeInsets.symmetric(
          vertical: 50,
          horizontal: 24,
        ),
        decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30))),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            apaItu(),
            infoCard(),
            kasusHari(),
            hotline(),
            kasusProvinsi(),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: Stack(
        children: [
          image(),
          ListView(
            children: [
              content(),
            ],
          ),
        ],
      ),
    );
  }
}
