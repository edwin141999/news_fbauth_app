import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_fbauth_app/components/card_news.dart';
import 'package:news_fbauth_app/services/api_endpoint.dart';
import 'package:news_fbauth_app/styles/colors/colors_view.dart';
import 'package:news_fbauth_app/viewModel/news_list_view_model.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  final api = NewsListViewModel();
  final service = Newservice();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, String> mapCategories = {
      'Negocio': 'business',
      'Entretenimiento': 'entertainment',
      'Salud': 'health',
      'Ciencias': 'science',
      'Deportes': 'sports',
      'Tecnología': 'technology',
    };
    String dropdownCategories = mapCategories.values.first;

    Map<String, String> itemCountries = {
      'Argentina': 'ar',
      'Australia': 'au',
      'Austria': 'at',
      'Alemania': 'de',
      'Belgica': 'be',
      'Brasil': 'br',
      'Bulgaria': 'bg',
      'Canada': 'ca',
      'China': 'cn',
      'Colombia': 'co',
      'Corea del sur': 'kr',
      'Cuba': 'cu',
      'EAU': 'ae',
      'Egipto': 'eg',
      'Eslovaquia': 'sk',
      'Eslovenia': 'si',
      'Estados Unidos': 'us',
      'Francia': 'fr',
      'Filipinas': 'ph',
      'Grecia': 'gr',
      'Hong Kong': 'hk',
      'Hungria': 'hu',
      'India': 'in',
      'Indonesia': 'id',
      'Irlanda': 'ie',
      'Israel': 'il',
      'Italia': 'it',
      'Japon': 'jp',
      'Letonia': 'lv',
      'Lituania': 'lt',
      'Malasia': 'my',
      'Mexico': 'mx',
      'Marruecos': 'ma',
      'Nueva Zelanda': 'nz',
      'Nigeria': 'ng',
      'Noruega': 'no',
      'Paises Bajos': 'nl',
      'Polonia': 'pl',
      'Portugal': 'pt',
      'Reino Unido': 'gb',
      'Republica Checa': 'cz',
      'Rumania': 'ro',
      'Rusia': 'ru',
      'Arabia Saudita': 'sa',
      'Serbia': 'rs',
      'Singapur': 'sg',
      'Sudafrica': 'za',
      'Suecia': 'se',
      'Suiza': 'ch',
      'Taiwan': 'tw',
      'Tailandia': 'th',
      'Turquia': 'tr',
      'Ucrania': 'ua',
      'Venezuela': 've',
    };

    String dropdownCountries = itemCountries.values.first;

    return Scaffold(
      backgroundColor: ColorSelect.ksecondaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Hola Edwin',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        FirebaseAuth.instance.signOut();
                      },
                      child: Image.asset(
                        'assets/images/user.png',
                        height: 24,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'País',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: DropdownButtonFormField(
                            value: dropdownCountries,
                            onChanged: (value) {
                              setState(() {
                                api.country =
                                    dropdownCountries = value.toString();
                              });
                            },
                            items: itemCountries.keys.map((e) {
                              return DropdownMenuItem(
                                  value: itemCountries[e],
                                  child: Center(child: Text(e)));
                            }).toList(),
                            dropdownColor: Colors.white,
                            icon: const SizedBox(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Categoría',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.33,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: DropdownButtonFormField(
                            value: dropdownCategories,
                            onChanged: (value) {
                              setState(() {
                                api.category =
                                    dropdownCategories = value.toString();
                              });
                            },
                            items: mapCategories.keys.map((e) {
                              return DropdownMenuItem(
                                value: mapCategories[e],
                                child: Center(child: Text(e)),
                              );
                            }).toList(),
                            dropdownColor: Colors.white,
                            icon: const SizedBox(),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.75,
                width: MediaQuery.of(context).size.width,
                child: FutureBuilder(
                  future: api.fetchNews(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return ListView.builder(
                        itemCount: api.news.length,
                        itemBuilder: (context, index) {
                          return CardNews(
                            title: api.news[index].article.title,
                            urlToImage: api.news[index].article.urlToImage,
                            author: api.news[index].author,
                            publishedAt: api.news[index].publishedAt
                                .toString()
                                .substring(0, 10),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
