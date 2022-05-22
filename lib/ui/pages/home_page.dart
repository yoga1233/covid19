import 'package:covid19/cubit/indo_cubit.dart';
import 'package:covid19/cubit/prov_cubit.dart';
import 'package:covid19/model/prov_model.dart';
import 'package:covid19/shared/theme.dart';
import 'package:covid19/ui/widgets/edu_card.dart';
import 'package:covid19/ui/widgets/info_card.dart.dart';
import 'package:covid19/ui/widgets/kasus_harian.dart';
import 'package:covid19/ui/widgets/kasus_prov_card.dart';
import 'package:covid19/ui/widgets/shimer_kasus.dart';
import 'package:covid19/ui/widgets/source_data.dart';
import 'package:covid19/ui/widgets/subtittle_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isVisible = true;
  @override
  void initState() {
    context.read<IndoCubit>().fetchData();
    context.read<ProvCubit>().getProv();
    super.initState();
  }

  void showToast() {
    setState(() {
      isVisible = !isVisible;
    });
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
              return const ShimerKasus();
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

    Widget kasusProvinsi(List<ProvModel> prov) {
      return Container(
        margin: const EdgeInsets.only(
          bottom: 30,
        ),
        child: Column(
            children: prov.map((ProvModel prov) {
          return KasusProvCard(prov);
        }).toList()),
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
            BlocBuilder<ProvCubit, ProvState>(
              builder: (context, state) {
                if (state is ProvSuccess) {
                  return kasusProvinsi(state.prov);
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      );
    }

    Widget settingButton() {
      return Align(
          alignment: Alignment.topRight,
          child: Container(
            margin: const EdgeInsets.only(top: 10, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 3),
                    child: Image.asset(
                      'assets/icons/icon_bantuan.png',
                      color: isVisible ? greyColor : blackColor,
                      width: 24,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Visibility(
                  visible: isVisible ? false : true,
                  child: Container(
                    width: 210,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 24),
                    decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aplikasi Covid-19\nDibuat oleh\nYoga Pamungkas',
                          style: greyTextStyle.copyWith(),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SubTittleText(text: 'Source Data'),
                        const SizedBox(
                          height: 10,
                        ),
                        const SourceData(
                            tittle: 'Api', subTittle: 'Reynadi531'),
                        const SourceData(tittle: 'Image', subTittle: 'Freepik'),
                        const SourceData(tittle: 'Icon', subTittle: 'Flaticon'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ));
    }

    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Stack(
          children: [
            image(),
            ListView(
              children: [
                content(),
              ],
            ),
            settingButton(),
          ],
        ),
      ),
    );
  }
}
