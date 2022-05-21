import 'package:covid19/cubit/indo_cubit.dart';
import 'package:covid19/shared/theme.dart';
import 'package:covid19/ui/widgets/edu_card.dart';
import 'package:covid19/ui/widgets/info_card.dart.dart';
import 'package:covid19/ui/widgets/kasus_harian.dart';
import 'package:covid19/ui/widgets/kasus_prov_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    context.read<IndoCubit>().fetchData();
    super.initState();
  }

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
            tittle: 'Virus corona ?',
            imageUrl: 'assets/icons/icon_corona.png',
            subTittle: 'Virus Corona adalah'),
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
          child: BlocBuilder<IndoCubit, IndoState>(
            builder: (context, state) {
              if (state is IndoSuccess) {
                return KasusHarian(state.indo);
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ));
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
          subTittle: 'Laporkan Kasus',
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
