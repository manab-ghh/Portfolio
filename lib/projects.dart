import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const HackathonPortfolioApp());
}

class HackathonPortfolioApp extends StatelessWidget {
  const HackathonPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hackathon Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Inter',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const PortfolioHomePage(),
    );
  }
}

// ========================
// Data Models
// ========================

class Hackathon {
  final int id;
  final String title;
  final String event;
  final String description;
  final String imageUrl;
  final String certificateUrl;
  final String certificateLabel;
  final bool hasCert;
  final String memories;
  final String date;

  Hackathon({
    required this.id,
    required this.title,
    required this.event,
    required this.description,
    required this.imageUrl,
    required this.certificateUrl,
    required this.certificateLabel,
    required this.hasCert,
    required this.memories,
    required this.date,
  });
}

class MemoryPhoto {
  final int id;
  final String title;
  final String description;
  final String imageUrl;
  final String type;

  MemoryPhoto({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.type,
  });
}

class StatItem {
  final String icon;
  final String value;
  final String label;

  StatItem({required this.icon, required this.value, required this.label});
}

// ========================
// Mock Data
// ========================

final List<Hackathon> hackathons = [
  Hackathon(
    id: 1,
    title: "TRONIX 2K25",
    event: "The Neotia University . Diamond Harbour",
    description:
        "Developed an AI-powered accessibility tool for visually impaired people using real-time object detection. Won 'Best Social Impact Award'.",
    imageUrl: "assets/images/tronix.jpg",
    certificateUrl: "https://ibb.co/hF4jGtpx",
    certificateLabel: "View Certificate (PDF)",
    hasCert: true,
    memories: "Team photo after final pitch, intense coding session at 3am.",
    date: "Feb 2025",
  ),
  Hackathon(
    id: 2,
    title: "ADINOVA 2025",
    event: "ADAMAS UNIVERSITY · Kolkata",
    description:
        "Built a decentralized carbon credit marketplace on Polygon. Awarded 'Most Innovative dApp' & sponsored prize. Integrated zero-knowledge proofs.",
    imageUrl: "assets/images/adinova.png",
    certificateUrl:
        "https://drive.google.com/file/d/1wa6NX_X2aFrrTMbHe774CtbUYXPOpjAb/view?usp=sharing",
    certificateLabel: "Participation Certificate",
    hasCert: true,
    memories: "Workshop memories & winner ceremony with the team!",
    date: "March 2025",
  ),
  Hackathon(
    id: 3,
    title: "INNOVARE 2025",
    event: "IEM Salt Lake · Kolkata",
    description:
        "Created a collaborative study platform using real-time WebRTC and AI summarization. Reached finalists top 10. Received recognition from judges.",
    imageUrl: "assets/images/innovare.png",
    certificateUrl: "#",
    certificateLabel: "Finalist Certificate",
    hasCert: true,
    memories: "Group selfie at media lab, sleepless but epic coding.",
    date: "March 2025",
  ),
  Hackathon(
    id: 4,
    title: "AI UTKARSH 2026",
    event: "Narula Institute of Technology · Kolkata",
    description:
        "Winner! Developed a disaster management dashboard using satellite data & ML. Government award and 1 lakh prize money.",
    imageUrl: "assets/images/aiutkarsh.png",
    certificateUrl:
        "https://drive.google.com/file/d/1Y3oW0j9HXEj5BPK3qfm50opMWtPu8ujV/view?usp=sharing",
    certificateLabel: "Winner Certificate + Medal",
    hasCert: true,
    memories: "Stage photo with minister, team celebration shot.",
    date: "April 2026",
  ),
];

final List<MemoryPhoto> extraMemories = [
  MemoryPhoto(
    id: 101,
    title: "Midnight Pizza & Debugging",
    description:
        "Last hour debugging session before submission at ETHGlobal — pure chaos but we fixed the contract.",
    imageUrl: "https://picsum.photos/id/106/600/400",
    type: "memory",
  ),
  MemoryPhoto(
    id: 102,
    title: "After-hackathon group celebration",
    description:
        "Winning team photo at AI For Good, certificates in hand and big smiles!",
    imageUrl: "https://picsum.photos/id/77/600/400",
    type: "memory",
  ),
  MemoryPhoto(
    id: 103,
    title: "Workshop on Zero-Knowledge proofs",
    description:
        "Amazing learning moment with industry mentors. Captured this valuable memory.",
    imageUrl: "https://picsum.photos/id/96/600/400",
    type: "memory",
  ),
];

final List<StatItem> stats = [
  StatItem(icon: "🏆", value: "7", label: "Hackathons Attended"),
  StatItem(icon: "🥇", value: "4", label: "Wins & Podiums"),
  StatItem(icon: "📸", value: "32+", label: "Moments Captured"),
  StatItem(icon: "📜", value: "12", label: "Certificates"),
];

// ========================
// Main Page Widget
// ========================

class PortfolioHomePage extends StatelessWidget {
  const PortfolioHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Hero Header
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
              decoration: BoxDecoration(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.65),
                borderRadius: BorderRadius.circular(48),
                // ignore: deprecated_member_use
                border: Border.all(color: Colors.white.withOpacity(0.7)),
                boxShadow: [
                  BoxShadow(
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.02),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.code, size: 40, color: Colors.blue[600]),
                      const SizedBox(width: 12),
                      Text(
                        "Manabendra Mondal",
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: -0.5,
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: [Color(0xFF0F2B3D), Color(0xFF1E4A76)],
                            ).createShader(const Rect.fromLTWH(0, 0, 200, 50)),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.only(left: 18),
                    decoration: BoxDecoration(border: Border.all()),
                    child: Text(
                      "Full-Stack Developer & 4x Hackathon Winner — Building innovative solutions with AI, Web3 & love for code. Below are my hackathon journeys, certificates, and unforgettable memories!",
                      style: TextStyle(
                        fontSize: 16,
                        color: const Color(0xFF2C5A7A),
                        height: 1.4,
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  // Stats Row
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: stats.map((stat) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: const Color(0xFFE9F0F5)),
                          boxShadow: [
                            BoxShadow(
                              // ignore: deprecated_member_use
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 12,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Text(
                              stat.icon,
                              style: const TextStyle(fontSize: 32),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              stat.value,
                              style: const TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF0F2B3D),
                              ),
                            ),
                            Text(
                              stat.label,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF5B7E96),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
          // Achievements Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Row(
                children: [
                  const Icon(Icons.emoji_events, color: Color(0xFF3B82F6)),
                  const SizedBox(width: 12),
                  const Text(
                    "Hackathon Achievements & Awards",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2B3D),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Achievements Grid
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 380,
                mainAxisExtent: 520,
                crossAxisSpacing: 24,
                mainAxisSpacing: 28,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) => HackathonCard(hackathon: hackathons[index]),
                childCount: hackathons.length,
              ),
            ),
          ),
          // Memories Section Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 48, 20, 16),
              child: Row(
                children: [
                  const Icon(Icons.camera_alt, color: Color(0xFF3B82F6)),
                  const SizedBox(width: 12),
                  const Text(
                    "Hackathon Memories & Snapshots",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2B3D),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Memories Grid (Extra Memories + Behind the scenes)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 360,
                mainAxisExtent: 380,
                crossAxisSpacing: 24,
                mainAxisSpacing: 28,
              ),
              delegate: SliverChildBuilderDelegate((context, index) {
                if (index < extraMemories.length) {
                  return MemoryCard(memory: extraMemories[index]);
                } else {
                  final hackIndex = index - extraMemories.length;
                  if (hackIndex < hackathons.length) {
                    return BehindTheScenesCard(
                      hackathon: hackathons[hackIndex],
                    );
                  }
                  return const SizedBox.shrink();
                }
              }, childCount: extraMemories.length + hackathons.length),
            ),
          ),
          // Footer
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(24),
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(48),
              ),
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Color(0xFFEF4444), size: 18),
                      SizedBox(width: 8),
                      Text(
                        "Crafted with Flutter · All achievements, certificates and hackathon memories live here!",
                        style: TextStyle(color: Color(0xFF2C5A7A)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "⚡ ${hackathons.length} major hackathons · ${extraMemories.length + hackathons.length} unique memories",
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF5B7E96),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
      ),
    );
  }
}

// ========================
// Hackathon Card Widget (with Certificate)
// ========================

class HackathonCard extends StatelessWidget {
  final Hackathon hackathon;

  const HackathonCard({super.key, required this.hackathon});

  void _showCertificateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        title: Row(
          children: [
            const Icon(Icons.verified, color: Color(0xFF3B82F6)),
            const SizedBox(width: 8),
            Text(hackathon.certificateLabel),
          ],
        ),
        content: Text(
          "Certificate for ${hackathon.title}\n\n"
          "Click below to open the certificate image.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),

          ElevatedButton.icon(
            icon: const Icon(Icons.open_in_new),
            label: const Text("Open Certificate"),
            onPressed: () async {
              final Uri url = Uri.parse(hackathon.certificateUrl);

              if (await canLaunchUrl(url)) {
                await launchUrl(url, mode: LaunchMode.externalApplication);
              } else {
                // ignore: use_build_context_synchronously
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Could not open certificate")),
                );
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.black.withOpacity(0.04)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Image.network(
              hackathon.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 200,
                  color: const Color(0xFFE2E8F0),
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEEF2FF),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 12,
                            color: Color(0xFF2563EB),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "${hackathon.date} · ${hackathon.event}",
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF2563EB),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      hackathon.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF0F2B3D),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      hackathon.description,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Color(0xFF2C3E44),
                        height: 1.4,
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 12),
                    // Certificate Area
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF9FAFB),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: const Color(0xFFE2EDF5)),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.verified,
                            size: 18,
                            color: Colors.blue[600],
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              hackathon.hasCert
                                  ? "🏅 Verified Certificate:"
                                  : "Participation certificate avail.",
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF2D5F7E),
                              ),
                            ),
                          ),
                          if (hackathon.hasCert)
                            GestureDetector(
                              onTap: () => _showCertificateDialog(context),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E293B),
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.picture_as_pdf,
                                      size: 14,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      hackathon.certificateLabel.length > 15
                                          ? "${hackathon.certificateLabel.substring(0, 12)}..."
                                          : hackathon.certificateLabel,
                                      style: const TextStyle(
                                        fontSize: 10,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.image,
                          size: 14,
                          color: Color(0xFF5B7E96),
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            "Memory: ${hackathon.memories}",
                            style: const TextStyle(
                              fontSize: 11,
                              color: Color(0xFF5B7E96),
                              fontStyle: FontStyle.italic,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================
// Memory Card Widget
// ========================

class MemoryCard extends StatelessWidget {
  final MemoryPhoto memory;

  const MemoryCard({super.key, required this.memory});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              memory.imageUrl,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 180,
                  color: const Color(0xFFE2E8F0),
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.camera,
                        size: 18,
                        color: Color(0xFF3B82F6),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        memory.title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F2B3D),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    memory.description,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4A6272),
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.favorite_border,
                            size: 12,
                            color: Color(0xFF5B7E96),
                          ),
                          SizedBox(width: 4),
                          Text(
                            "hackathon moment",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.camera_alt,
                            size: 12,
                            color: Color(0xFF5B7E96),
                          ),
                          SizedBox(width: 4),
                          Text("snapshot", style: TextStyle(fontSize: 10)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ========================
// Behind The Scenes Card (extra memory from hackathons)
// ========================

class BehindTheScenesCard extends StatelessWidget {
  final Hackathon hackathon;

  const BehindTheScenesCard({super.key, required this.hackathon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.06),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              hackathon.imageUrl,
              height: 170,
              width: double.infinity,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Container(
                  height: 170,
                  color: const Color(0xFFE2E8F0),
                  child: const Center(child: CircularProgressIndicator()),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEEF2FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      hackathon.date,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2563EB),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "📸 ${hackathon.title} — Behind the Scenes",
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F2B3D),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    hackathon.memories,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Color(0xFF4A6272),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 12,
                        color: Colors.grey[500],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          hackathon.event,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Colors.grey,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
