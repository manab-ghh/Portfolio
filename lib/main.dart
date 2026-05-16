import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manabendra Mondal - Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: const PortfolioHomePage(),
    );
  }
}

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                'Manabendra Mondal',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              background: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.deepPurple.shade700,
                      Colors.purple.shade300,
                      Colors.indigo.shade500,
                    ],
                  ),
                ),
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundColor: Colors.white,
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/photo.png',
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Computer Science Engineer',
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(color: Colors.white70),
                      ),
                      const SizedBox(height: 6),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.white70,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Kolkata, West Bengal, India',
                            style: Theme.of(context).textTheme.bodySmall
                                ?.copyWith(color: Colors.white70),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Summary Section
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.article_outlined,
                                color: Theme.of(context).primaryColor,
                              ),
                              const SizedBox(width: 10),
                              Text(
                                'Summary',
                                style: Theme.of(context).textTheme.headlineSmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'I am Manabendra Mondal, a Computer Science Engineering student at Narula Institute of Technology. I have strong skills in C++, Data Structures and Algorithms (DSA), and Android & iOS Application development, with a keen interest in software development and competitive programming.',
                            style: Theme.of(context).textTheme.bodyLarge,
                            textAlign: TextAlign.justify,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Top Skills
                  _buildSectionHeader(Icons.star_rounded, 'Top Skills'),
                  const SizedBox(height: 12),
                  Wrap(
                    spacing: 12,
                    runSpacing: 12,
                    children: [
                      _buildSkillChip('Application Development'),
                      _buildSkillChip('Mobile Application Development'),
                      _buildSkillChip('Flutter'),
                      _buildSkillChip('Dart'),
                      _buildSkillChip('Python'),
                      _buildSkillChip('Django'),
                      _buildSkillChip('FastAPI'),
                      _buildSkillChip('C++'),
                      _buildSkillChip('Data Structures & Algorithms'),
                      _buildSkillChip('Object-Oriented Programming (OOP)'),
                      _buildSkillChip('Android Development'),
                      _buildSkillChip('iOS Development'),
                      _buildSkillChip('Problem Solving'),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Certifications
                  _buildSectionHeader(
                    Icons.verified_outlined,
                    'Certifications',
                  ),
                  const SizedBox(height: 12),

                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://unstop.com/certificate-preview/f124a940-5da4-4061-a50b-382239a8a831?utm_campaign=site-emails',
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: _buildCertificationCard(
                      'TATA Crucible Campus Quiz 2025',
                      'Certificate of Participation',
                      Icons.quiz_outlined,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://certificate.givemycertificate.com/c/036daef2-6cf0-469c-80e4-072913dec779',
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: _buildCertificationCard(
                      'Apertre 3.0',
                      'Certificate of Participation',
                      Icons.quiz_outlined,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://unstop.com/certificate-preview/c8a8aec4-cb1e-4ee2-abb8-3485ac896490?utm_campaign=site-emails',
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: _buildCertificationCard(
                      'The Filter - OutThinkX',
                      'Certificate of Participation',
                      Icons.quiz_outlined,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: () async {
                      final Uri url = Uri.parse(
                        'https://drive.google.com/drive/folders/1U2N2lFie59iWtDaqUxhpRCxZzQ7TbM7B?usp=drive_link',
                      );

                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      }
                    },

                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.zero,
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),

                    child: _buildCertificationCard(
                      'Others',
                      '',
                      Icons.quiz_outlined,
                    ),
                  ),

                  const SizedBox(height: 24),

                  // Education
                  _buildSectionHeader(Icons.school_outlined, 'Education'),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor
                                      // ignore: deprecated_member_use
                                      .withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.school,
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Narula Institute of Technology (NiT)',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                          ),
                                    ),
                                    Text(
                                      'Bachelor of Technology - BTech, Computer Science',
                                      style: Theme.of(
                                        context,
                                      ).textTheme.bodyMedium,
                                    ),
                                    Text(
                                      'August 2024 - August 2028',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(color: Colors.grey[600]),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Contact & Links
                  _buildSectionHeader(Icons.link_rounded, 'Connect with Me'),
                  const SizedBox(height: 12),
                  Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        children: [
                          _buildContactTile(
                            icon: Icons.phone_android,
                            label: 'Mobile',
                            value: '+91 6290445462',
                            onTap: () => _launchURL('tel:+916290445462'),
                            color: Colors.green,
                          ),
                          const Divider(),
                          _buildContactTile(
                            icon: Icons.email_outlined,
                            label: 'Email',
                            value: 'manabendra2006mondal@gmail.com',
                            onTap: () => _launchURL(
                              'mailto:manabendra2006mondal@gmail.com',
                            ),
                            color: Colors.red,
                          ),
                          const Divider(),
                          _buildContactTile(
                            icon: Icons.work_outline,
                            label: 'LinkedIn',
                            value: 'linkedin.com/in/manabendra-mondal',
                            onTap: () => _launchURL(
                              'https://www.linkedin.com/in/manabendra-mondal-22254434a',
                            ),
                            color: Colors.blue,
                          ),
                          const Divider(),
                          _buildContactTile(
                            icon: Icons.person_outline,
                            label: 'Personal Site',
                            value: 'manabendra-mondal.zvbvsxz.gamma.site',
                            onTap: () => _launchURL(
                              'https://manabendra-mondal-ah05x59.gamma.site',
                            ),
                            color: Colors.purple,
                          ),
                          const Divider(),
                          _buildContactTile(
                            icon: Icons.folder_open,
                            label: 'Drive Portfolio',
                            value: 'Google Drive Folder',
                            onTap: () => _launchURL(
                              'https://drive.google.com/drive/folders/1U2N2IFie59iWtDaqUxhprC',
                            ),
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: Colors.deepPurple, size: 28),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
      ],
    );
  }

  Widget _buildSkillChip(String skill) {
    return Chip(
      label: Text(skill),
      // ignore: deprecated_member_use
      backgroundColor: Colors.deepPurple.withOpacity(0.1),
      side: BorderSide.none,
      labelStyle: const TextStyle(fontWeight: FontWeight.w500),
      avatar: const Icon(Icons.code, size: 16, color: Colors.deepPurple),
    );
  }

  Widget _buildCertificationCard(String title, String subtitle, IconData icon) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: ListTile(
          leading: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.deepPurple.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: Colors.deepPurple),
          ),
          title: Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text(subtitle),
          trailing: const Icon(Icons.verified, color: Colors.green, size: 20),
        ),
      ),
    );
  }

  Widget _buildContactTile({
    required IconData icon,
    required String label,
    required String value,
    required VoidCallback onTap,
    required Color color,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Icon(Icons.open_in_new, size: 18, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
}
