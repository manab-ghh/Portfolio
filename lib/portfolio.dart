import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyPortfolio());
}

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({super.key});

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
        fontFamily: 'Roboto',
      ),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
        fontFamily: 'Roboto',
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
          const SliverAppBar(
            title: Text('Manabendra Mondal'),
            centerTitle: false,
            pinned: true,
            expandedHeight: 120.0,
            flexibleSpace: FlexibleSpaceBar(
              background: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [Colors.deepPurple, Colors.indigo],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero section
                  Card(
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.deepPurple.shade100,
                            child: Text(
                              'MM',
                              style: TextStyle(
                                fontSize: 48,
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurple.shade800,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Manabendra Mondal',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Computer Science Engineering Student',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Passionate Computer Science Engineering student with a strong foundation in programming and digital technologies.',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // About Me section
                  _buildSectionTitle('About Me'),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        "I'm a driven Computer Science Engineering student with hands-on experience in C, C++, Java, Python, Django, FastAPI, Rest APIs, MongoDB, MySQL, Flutter, and Dart. My solid understanding of digital marketing strategies allows for a well-rounded, analytical approach to problems. I'm eager to apply my knowledge to real-world projects and continuously grow in tech and digital domains.",
                        style: TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Project Experience
                  _buildSectionTitle('Project Experience'),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Smart Garbage Cleaner – Prototype',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            'Developed a manually controlled garbage collection system using robotics and IoT to enhance cleanliness in public spaces. The prototype features a robotic arm on a motorized car, detecting, collecting, and categorizing waste.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Project Details:',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _buildBulletPoint(
                            'Presented at multiple inter-college project competitions',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'Recognized for innovation in smart automation and sustainability',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'Integrated hardware and software for a fully functional prototype',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'Programmed ESP32 and Arduino Nano to control the system',
                          ),
                          const SizedBox(height: 4),
                          _buildBulletPoint(
                            'Designed and assembled the mobile platform and robotic arm, integrating sensors for detection and classification',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Technologies
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Technologies & Components Used',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildTechChip('ESP32 & Arduino Nano'),
                          _buildTechChip('Servo & DC Motors'),
                          _buildTechChip('Sensors (Soil moisture, Ultrasonic)'),
                          _buildTechChip('Battery Pack'),
                          _buildTechChip('Embedded C/C++ & IoT'),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Achievements
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Achievements',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildBulletPoint(
                            'Successfully developed and demonstrated the Smart Garbage Cleaner prototype',
                          ),
                          _buildBulletPoint(
                            'Presented at reputed inter-college competitions: NIOTIA, Adamas, IEM, and NIT Colleges',
                          ),
                          _buildBulletPoint(
                            'Recognized for innovation and sustainability-focused engineering in multiple academic forums',
                          ),
                          _buildBulletPoint(
                            'Gained hands-on experience in embedded systems, sensor integration, and automated waste management',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Skills - Hard & Soft
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Hard Skills'),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSkillChip(
                                      'Programming',
                                      'C, C++, Python, HTML, SQL',
                                    ),
                                    const SizedBox(height: 8),
                                    _buildSkillChip(
                                      'Data',
                                      'Data mining and analysis',
                                    ),
                                    const SizedBox(height: 8),
                                    _buildSkillChip(
                                      'Management',
                                      'Project management',
                                    ),
                                    const SizedBox(height: 8),
                                    _buildSkillChip('Marketing', 'Copywriting'),
                                    const SizedBox(height: 8),
                                    _buildSkillChip('Tools', 'Microsoft Excel'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildSectionTitle('Soft Skills'),
                            Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    _buildSimpleChip('Observation'),
                                    const SizedBox(height: 6),
                                    _buildSimpleChip('Decision Making'),
                                    const SizedBox(height: 6),
                                    _buildSimpleChip('Communication'),
                                    const SizedBox(height: 6),
                                    _buildSimpleChip('Multi-tasking'),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Education
                  _buildSectionTitle('Education Background'),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildEducationItem(
                            'Masjidbati Parbati High School',
                            'First schooling completed in 2022.',
                          ),
                          const Divider(),
                          _buildEducationItem(
                            'Debnagar Mokshada Dinda H.S School',
                            'Second schooling completed in 2024.',
                          ),
                          const Divider(),
                          _buildEducationItem(
                            'Narula Institute of Technology',
                            'Currently pursuing B.Tech in Computer Science, started in 2024.',
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Contact
                  _buildSectionTitle('Contact Me'),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          _buildContactTile(
                            Icons.phone,
                            '+91 6290445462',
                            'tel:+916290445462',
                          ),
                          const Divider(),
                          _buildContactTile(
                            Icons.location_on,
                            'Rajpur Sonarpur, Kolkata',
                            null,
                          ),
                          const Divider(),
                          _buildContactTile(
                            Icons.link,
                            'LinkedIn Profile',
                            'https://www.linkedin.com/in/manabendramondal-22254434a',
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

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildBulletPoint(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '• ',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 15))),
        ],
      ),
    );
  }

  Widget _buildTechChip(String label) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.deepPurple.shade50,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.deepPurple.shade200),
      ),
      child: Text(label, style: TextStyle(color: Colors.deepPurple.shade800)),
    );
  }

  Widget _buildSkillChip(String category, String details) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          category,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(details, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildSimpleChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label),
    );
  }

  Widget _buildEducationItem(String institution, String period) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          institution,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(period, style: const TextStyle(fontSize: 14, color: Colors.grey)),
      ],
    );
  }

  Widget _buildContactTile(IconData icon, String text, String? url) {
    if (url != null) {
      return InkWell(
        onTap: () => _launchUrl(url),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Icon(icon, size: 24, color: Colors.deepPurple),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const Icon(Icons.open_in_new, size: 16),
            ],
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.deepPurple),
          const SizedBox(width: 16),
          Expanded(child: Text(text, style: const TextStyle(fontSize: 16))),
        ],
      ),
    );
  }

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}
