import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/double_to_gap.dart';
import 'package:portfolio/utils/int_to_gap.dart';
import 'package:portfolio/widgets/shared/hablities_section.dart';
import 'package:http/http.dart' as http;

import '../../constants/constants.dart';

class AboutMe extends StatefulWidget {
  const AboutMe({
    super.key,
  });

  @override
  State<AboutMe> createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  final List<String> links = [
    "https://flutter.dev",
    "https://www.uv.mx/coatza/admon/nosotros/pre-rec/",
    "https://www.uv.mx/coatza/admon/general/xvii-expo-nac-empren-anfeca-23/",
    "https://www.uv.mx/coatza/general/innovacion-y-desarrollo-en-el-sur-de-veracruz/",
    "https://www.uv.mx/prensa/general/uv-region-coatzacoalcos-destaco-en-xvi-maraton-de-conocimientos-anfeca/",
  ];

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 1000,
        minHeight: MediaQuery.of(context).size.height * 0.5,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSpacing.cardPadding),
            child: Column(
              spacing: AppSpacing.small,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  'Sobre mi',
                  minFontSize: 22,
                  maxFontSize: 26,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(
                  Constants.kAboutMeText,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                30.toVerticalGap,
                AutoSizeText(
                  'Programación competitiva',
                  minFontSize: 22,
                  maxFontSize: 26,
                  maxLines: 1,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                ProfileSection(),
                AppSpacing.sectionSpacing.toVerticalGap,
                HabilitiesSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Fetch data from Codewars API
Future<Map<String, dynamic>> fetchCodewarsProfile(String username) async {
  final url = Uri.parse('https://www.codewars.com/api/v1/users/$username');
  try {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      debugPrint('Failed to load Codewars profile: ${response.statusCode}');
      throw Exception('Failed to load Codewars profile');
    }
  } catch (e) {
    debugPrint(e.toString());
    return {};
  }
}

// Método para obtener los datos de perfil de OmegaUp desde el Worker de Cloudflare
Future<Map<String, dynamic>> fetchOmegaUpProfile(String username) async {
  final url = Uri.parse(
      'https://proxy-omegaup-portfolio.emmanu20021.workers.dev/?username=$username'); // Reemplaza con la URL de tu Worker

  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // Si la respuesta es exitosa, decodificamos los datos JSON
      final Map<String, dynamic> data = json.decode(response.body);
      return data;
    } else {
      // Si el código de estado no es 200, mostramos el error
      return {
        'error': 'Failed to fetch data. Status code: ${response.statusCode}'
      };
    }
  } catch (e) {
    // Si ocurre un error en la solicitud
    return {'error': 'Error fetching data: $e'};
  }
}

// UI: Profile Card
class ProfileCard extends StatelessWidget {
  final String platform;
  final String username;
  final int score;
  final String rank;

  const ProfileCard({
    required this.platform,
    required this.username,
    required this.score,
    required this.rank,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              platform,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Username: $username'),
            Text('Score: $score'),
            Text('Rank: $rank'),
          ],
        ),
      ),
    );
  }
}

// UI: Profile Section
class ProfileSection extends StatelessWidget {
  final String codewarsUsername = 'EMMANUELLE20021';
  final String omegaupUsername = 'EMMANUELL20021';

  const ProfileSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        FutureBuilder<Map<String, dynamic>>(
          future: fetchCodewarsProfile(codewarsUsername),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return Text('Fallo al cargar el perfil de Codewars.');
            }
            final data = snapshot.data!;
            return ProfileCard(
              platform: 'Codewars',
              username: data['username'],
              score: data['honor'],
              rank: data['ranks']['overall']['name'],
            );
          },
        ),
        SizedBox(height: 16),
        FutureBuilder<Map<String, dynamic>>(
          future: fetchOmegaUpProfile(omegaupUsername),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data!.isEmpty) {
              return Text('Fallo al cargar el perfil de OmegaUp.');
            }
            final data = snapshot.data!;
            return ProfileCard(
              platform: 'OmegaUp',
              username: data['username'] ?? 'emma',
              score: data['rankinfo']['problems_solved'] ?? 0,
              rank: data['rankinfo']['rank']?.toString() ??
                  'N/A', // OmegaUp does not provide rank.
            );
          },
        ),
      ],
    );
  }
}
