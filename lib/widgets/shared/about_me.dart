import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/utils/double_to_gap.dart';
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

class CodeWarsCard extends StatelessWidget {
  final String username;
  final int score;
  final String rank;

  const CodeWarsCard({
    super.key,
    required this.username,
    required this.score,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: const Color.fromARGB(255, 16, 27, 35),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.red,
            ),
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            width: double.infinity,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.all(Radius.circular(500)),
              child: Image.network(
                'https://avatars.githubusercontent.com/u/95460842?v=4&size=64',
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: Colors.white,
                      ),
                ),
                Text(
                  'Perfil de Codewars',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.red,
                    ),
                    Text(
                      'Puntuación: $score',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.code,
                      color: Colors.red,
                    ),
                    Text(
                      'Rango: $rank',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OmegaUpCard extends StatelessWidget {
  final String username;
  final int problemsSolved;
  final String rank;

  const OmegaUpCard({
    super.key,
    required this.username,
    required this.problemsSolved,
    required this.rank,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      color: Colors.white,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              color: Colors.blue,
            ),
            constraints: BoxConstraints(
              maxWidth: 300,
            ),
            width: double.infinity,
            child: ClipRRect(
              clipBehavior: Clip.antiAlias,
              borderRadius: BorderRadius.all(Radius.circular(500)),
              child: Image.network(
                'https://secure.gravatar.com/avatar/abb2c02c8624944d28f160418cc4771e?s=92',
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  username,
                  style: textTheme.displaySmall!.copyWith(
                    color: AppColors.background,
                  ),
                ),
                Text(
                  'Perfil de OmegaUp',
                  style: textTheme.headlineMedium!.copyWith(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSpacing.small,
                  children: [
                    Icon(
                      Icons.code,
                      color: Colors.blue,
                    ),
                    Text(
                      'Problemas resueltos: $problemsSolved',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.surface,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  spacing: AppSpacing.small,
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.blue,
                    ),
                    Text(
                      'Ranking: $rank',
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.surface,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
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
            return CodeWarsCard(
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
            return OmegaUpCard(
              username: data['username'] ?? 'emma',
              problemsSolved: data['rankinfo']['problems_solved'] ?? 0,
              rank: data['rankinfo']['rank']?.toString() ??
                  'N/A', // OmegaUp does not provide rank.
            );
          },
        ),
      ],
    );
  }
}
