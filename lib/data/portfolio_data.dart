import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../models/project.dart';
import '../models/skill.dart';
import '../models/experience.dart';
import '../models/achievement.dart';

class PortfolioData {
  PortfolioData._();

  // Profile Info
  static const String name = 'Manabendra Mondal';
  static const String title = 'Full-Stack & AI Systems Developer';
  static const String headline = 'Building Scalable Backends, Flutter Apps & AI Systems';
  static const String location = 'Kolkata, West Bengal, India';
  static const String email = 'mondalmanabendra001@gmail.com';
  static const String resumeUrl = 'https://github.com/manab-ghh';
  static const String availabilityStatus = 'Available for internships & full-time roles';

  static const String shortBio =
      'I build scalable backend systems, cross-platform Flutter applications, and AI-powered solutions. '
      'I enjoy solving complex algorithmic problems with DSA and Competitive Programming while actively '
      'exploring Backend Engineering, Generative AI, and Distributed Systems.';

  static const String fullBio =
      'I am a Computer Science Engineering student passionate about engineering robust, user-centric software. '
      'With deep foundations in C++, Data Structures, and Algorithms, I combine computational rigor with modern '
      'full-stack engineering. Whether architecting asynchronous microservices, crafting pixel-perfect responsive Flutter '
      'interfaces, or integrating LLMs into practical workflows, I take pride in clean code, maintainability, and exceptional UI/UX.';

  // Social & Platform Links
  static const String githubUrl = 'https://github.com/manab-ghh';
  static const String linkedinUrl = 'https://www.linkedin.com/in/manabendra-mondal-22254434a';
  static const String leetcodeUrl = 'https://leetcode.com/u/manab__344/';
  static const String codeforcesUrl = 'https://codeforces.com/profile/manab.code';

  // Typing Roles for Hero Section
  static const List<String> heroRoles = [
    'Computer Science Engineering Student',
    'Backend Engineer | Scalable APIs & Microservices',
    'Flutter Developer | Cross-Platform Systems',
    'Competitive Programmer | C++ & DSA Specialist',
    'AI & LLM Enthusiast | Agentic Workflows',
  ];

  // Quick Stats
  static const List<Map<String, String>> stats = [
    {'value': '500+', 'label': 'DSA Problems Solved'},
    {'value': '6+', 'label': 'Featured Repositories'},
    {'value': '4+', 'label': 'Hackathon Recognitions'},
    {'value': '100%', 'label': 'Code Rigor & Passion'},
  ];

  // Skill Categories
  static const List<SkillCategory> skillCategories = [
    SkillCategory(
      title: 'Languages',
      subtitle: 'Core programming foundations',
      icon: FontAwesomeIcons.code,
      skills: [
        SkillItem(name: 'C++', icon: FontAwesomeIcons.terminal, color: Color(0xFF659AD2)),
        SkillItem(name: 'Dart', icon: FontAwesomeIcons.bullseye, color: Color(0xFF00B4AB)),
        SkillItem(name: 'JavaScript', icon: FontAwesomeIcons.js, color: Color(0xFFF7DF1E)),
        SkillItem(name: 'TypeScript', icon: FontAwesomeIcons.codeBranch, color: Color(0xFF3178C6)),
        SkillItem(name: 'Python', icon: FontAwesomeIcons.python, color: Color(0xFF3776AB)),
        SkillItem(name: 'C', icon: FontAwesomeIcons.microchip, color: Color(0xFFA8B9CC)),
        SkillItem(name: 'SQL', icon: FontAwesomeIcons.database, color: Color(0xFFE38C00)),
      ],
    ),
    SkillCategory(
      title: 'Backend & Cloud',
      subtitle: 'APIs, databases, and microservices',
      icon: FontAwesomeIcons.server,
      skills: [
        SkillItem(name: 'Node.js', icon: FontAwesomeIcons.nodeJs, color: Color(0xFF68A063)),
        SkillItem(name: 'Express.js', icon: FontAwesomeIcons.networkWired, color: Color(0xFFE0E0E0)),
        SkillItem(name: 'REST APIs', icon: FontAwesomeIcons.arrowsSplitUpAndLeft, color: Color(0xFF38BDF8)),
        SkillItem(name: 'PostgreSQL', icon: FontAwesomeIcons.database, color: Color(0xFF336791)),
        SkillItem(name: 'MongoDB', icon: FontAwesomeIcons.leaf, color: Color(0xFF47A248)),
        SkillItem(name: 'Firebase', icon: FontAwesomeIcons.fire, color: Color(0xFFFFCA28)),
        SkillItem(name: 'Docker', icon: FontAwesomeIcons.docker, color: Color(0xFF2496ED)),
      ],
    ),
    SkillCategory(
      title: 'Mobile & Frontend',
      subtitle: 'Cross-platform apps & interfaces',
      icon: FontAwesomeIcons.mobileScreen,
      skills: [
        SkillItem(name: 'Flutter', icon: FontAwesomeIcons.flutter, color: Color(0xFF02569B)),
        SkillItem(name: 'Responsive Web', icon: FontAwesomeIcons.globe, color: Color(0xFF818CF8)),
        SkillItem(name: 'State Management (Riverpod/Bloc)', icon: FontAwesomeIcons.cubes, color: Color(0xFFA78BFA)),
        SkillItem(name: 'Clean Architecture', icon: FontAwesomeIcons.layerGroup, color: Color(0xFF34D399)),
        SkillItem(name: 'HTML5 & CSS3', icon: FontAwesomeIcons.html5, color: Color(0xFFE34F26)),
      ],
    ),
    SkillCategory(
      title: 'AI & Machine Learning',
      subtitle: 'Intelligent systems & GenAI',
      icon: FontAwesomeIcons.brain,
      skills: [
        SkillItem(name: 'LLM Integration', icon: FontAwesomeIcons.robot, color: Color(0xFFC084FC)),
        SkillItem(name: 'Prompt Engineering', icon: FontAwesomeIcons.wandMagicSparkles, color: Color(0xFFFBBF24)),
        SkillItem(name: 'RAG & Vector DBs', icon: FontAwesomeIcons.diagramProject, color: Color(0xFF22D3EE)),
        SkillItem(name: 'LangChain & Agents', icon: FontAwesomeIcons.link, color: Color(0xFF34D399)),
      ],
    ),
    SkillCategory(
      title: 'Tools & CS Fundamentals',
      subtitle: 'Engineering practices and theory',
      icon: FontAwesomeIcons.gears,
      skills: [
        SkillItem(name: 'Data Structures & Algorithms', icon: FontAwesomeIcons.sitemap, color: Color(0xFF818CF8)),
        SkillItem(name: 'Git & GitHub', icon: FontAwesomeIcons.github, color: Color(0xFFF05032)),
        SkillItem(name: 'Object Oriented Programming', icon: FontAwesomeIcons.cube, color: Color(0xFF38BDF8)),
        SkillItem(name: 'Operating Systems & Linux', icon: FontAwesomeIcons.linux, color: Color(0xFFFCC624)),
        SkillItem(name: 'DBMS & Query Optimization', icon: FontAwesomeIcons.database, color: Color(0xFF10B981)),
        SkillItem(name: 'Postman', icon: FontAwesomeIcons.paperPlane, color: Color(0xFFFF6C37)),
      ],
    ),
  ];

  // All Real GitHub Projects
  static const List<ProjectModel> projects = [
    ProjectModel(
      title: 'SIH-2026 — AI Artisan Business Manager',
      repoName: 'SIH-2026',
      category: 'AI & Full Stack',
      description:
          'AI-powered digital business management platform built for Smart India Hackathon empowering traditional artisans to digitize, price, market, and scale their handcrafted products globally.',
      technologies: ['Python', 'Generative AI', 'Flutter', 'Jupyter', 'Machine Learning', 'REST API'],
      highlights: [
        'Automated multilingual cataloging and voice assistant for vernacular artisan onboarding',
        'AI-driven fair price estimation model calculating raw material costs and craft time',
        'Intuitive digital storefront and inventory management system designed for scale',
      ],
      githubUrl: 'https://github.com/manab-ghh/SIH-2026',
      isFeatured: true,
    ),
    ProjectModel(
      title: 'Node.js & Backend Architecture Suite',
      repoName: 'NODE-JS-PROJECTS',
      category: 'Backend & Systems',
      description:
          'Extensive production-grade collection of Node.js and Express backend implementations ranging from REST APIs, JWT authentication, and MongoDB CRUD to real-time WebSockets.',
      technologies: ['Node.js', 'Express.js', 'MongoDB', 'JWT', 'Socket.IO', 'MySQL', 'REST APIs'],
      highlights: [
        'Secure authentication flows with JWT token refresh, bcrypt hashing, and role-based permissions',
        'Bidirectional event-driven real-time communication pipelines powered by Socket.IO',
        'Clean layered MVC architecture with modular routers, controllers, and validation middleware',
      ],
      githubUrl: 'https://github.com/manab-ghh/NODE-JS-PROJECTS',
      isFeatured: true,
    ),
    ProjectModel(
      title: 'PulseChat — Real-Time Flutter App',
      repoName: 'basic-chat-app',
      category: 'Flutter & Mobile',
      description:
          'Cross-platform real-time messaging application engineered with Flutter, featuring instant stream updates, clean architectural boundaries, and responsive mobile layouts.',
      technologies: ['Flutter', 'Dart', 'Firebase', 'State Management', 'Reactive Streams'],
      highlights: [
        'Instant message synchronization with low-latency stream listeners',
        'Decoupled presentation, domain, and data layers for maintainability and testing',
        'Polished dark mode interface with typing indicators and online presence tracking',
      ],
      githubUrl: 'https://github.com/manab-ghh/basic-chat-app',
      isFeatured: true,
    ),
    ProjectModel(
      title: '120 Best C++ & DSA Interview Masterclass',
      repoName: '120-BEST-CPP-INTERVIEW-QNA',
      category: 'C++ & Algorithms',
      description:
          'Carefully curated repository of 120 essential C++ interview questions and algorithmic challenges with verified code implementations and in-depth conceptual explanations.',
      technologies: ['C++', 'Data Structures', 'Algorithms', 'STL Internals', 'Memory Management'],
      highlights: [
        'Deep-dive coverage into raw pointers, smart pointers, RAII, move semantics, and vtable mechanics',
        'Templates and solutions for graph traversals, dynamic programming, and binary search trees',
        'Concurrency fundamentals including std::thread, mutex locks, and condition variables',
      ],
      githubUrl: 'https://github.com/manab-ghh/120-BEST-CPP-INTERVIEW-QNA',
      isFeatured: true,
    ),
    ProjectModel(
      title: 'Memori — Agent-Native Memory Layer',
      repoName: 'Memori',
      category: 'AI & Autonomous Agents',
      description:
          'Agent-native memory infrastructure and LLM-agnostic layer turning autonomous agent execution, reasoning steps, and multi-turn conversations into structured persistent state.',
      technologies: ['Python', 'LLMs', 'Vector Databases', 'LangChain', 'Agent Workflows'],
      highlights: [
        'Structured persistent memory stores for multi-agent collaboration and long-horizon context',
        'Episodic compression and semantic similarity vector search across agent trajectories',
        'Fault-tolerant state resumption ensuring production reliability for AI agents',
      ],
      githubUrl: 'https://github.com/manab-ghh/Memori',
      liveUrl: 'https://memorilabs.ai',
      isFeatured: true,
    ),
    ProjectModel(
      title: 'Modern Flutter Web Portfolio',
      repoName: 'Portfolio',
      category: 'Flutter Web',
      description:
          'Fast, responsive developer portfolio engineered with Flutter Web, modern glassmorphism, zero external image dependencies, and direct GitHub synchronization.',
      technologies: ['Flutter Web', 'Dart', 'Responsive Design', 'Clean Architecture', 'CSS/Web'],
      highlights: [
        'Pure code-driven UI with vector icons and canvas styling without bulky image assets',
        'Adaptive layouts for mobile, tablet, and widescreen desktops with sticky blurred navbar',
        'Centralized data layer separating portfolio content from Flutter widget hierarchy',
      ],
      githubUrl: 'https://github.com/manab-ghh',
      isFeatured: false,
    ),
  ];

  // Experience / Journey
  static const List<ExperienceItem> experiences = [
    ExperienceItem(
      role: 'Full-Stack & Backend Engineering Explorer',
      organization: 'Self-Directed & Project Building',
      period: '2024 — Present',
      location: 'Kolkata, India',
      description:
          'Architecting backend microservices and full-stack solutions focusing on scalability, clean APIs, and asynchronous message processing.',
      keyPoints: [
        'Built production-ready RESTful APIs in Node.js/Express with robust authentication and validation.',
        'Integrated PostgreSQL and MongoDB with indexing strategies for fast query execution.',
        'Adopted containerization with Docker for consistent development and deployment flows.',
      ],
      technologies: ['Node.js', 'Express', 'MongoDB', 'PostgreSQL', 'Docker', 'REST'],
    ),
    ExperienceItem(
      role: 'Cross-Platform Flutter Developer',
      organization: 'Independent Development & Open Source',
      period: '2023 — Present',
      location: 'Kolkata, India',
      description:
          'Engineering modern, fluid Flutter applications across mobile, web, and desktop with strong adherence to design systems and state architecture.',
      keyPoints: [
        'Implemented Riverpod and Bloc state patterns with separated domain, data, and UI layers.',
        'Constructed custom animations, canvas painters, and responsive breakpoints.',
        'Optimized web build size and rendering performance across devices.',
      ],
      technologies: ['Flutter', 'Dart', 'Riverpod', 'Firebase', 'Responsive UI'],
    ),
    ExperienceItem(
      role: 'Competitive Programmer & Algorithmic Problem Solver',
      organization: 'LeetCode & Codeforces',
      period: '2023 — Present',
      location: 'Online',
      description:
          'Consistent practice in advanced data structures, graph theory, dynamic programming, and greedy heuristics.',
      keyPoints: [
        'Solved 500+ problems across LeetCode, Codeforces, and GeeksforGeeks.',
        'Participated regularly in weekly and bi-weekly global coding contests.',
        'Honed rapid problem dissection, time/space complexity optimization, and edge-case handling.',
      ],
      technologies: ['C++', 'Data Structures', 'Algorithms', 'STL', 'Dynamic Programming'],
    ),
  ];

  // Education
  static const Map<String, dynamic> education = {
    'degree': 'Bachelor of Technology in Computer Science & Engineering',
    'institution': 'Maulana Abul Kalam Azad University of Technology / Affiliated Institute',
    'period': '2022 — 2026',
    'location': 'West Bengal, India',
    'description':
      'Focusing on Computer Science core fundamentals: Algorithms, Operating Systems, Database Systems, Computer Architecture, and Artificial Intelligence.',
    'courses': [
      'Data Structures & Algorithms',
      'Operating Systems',
      'Database Management Systems',
      'Computer Networks',
      'Object Oriented Programming',
      'Software Engineering',
      'Theory of Computation',
      'Compiler Design',
    ],
  };

  // Achievements & Competitions (100% Image-Free)
  static const List<AchievementItem> achievements = [
    AchievementItem(
      title: 'National Finalist & Distinction',
      organizer: 'TATA Crucible Campus Quiz / Tech Competition',
      date: '2024',
      badge: 'National Finalist',
      description:
          'Demonstrated deep strategic acumen and technological insight competing against top university teams nationally.',
      credentialUrl: 'https://github.com/manab-ghh',
    ),
    AchievementItem(
      title: 'Best Innovation & AI Prototype',
      organizer: 'AI Utkarsh National Hackathon',
      date: '2024',
      badge: '1st Runner Up',
      description:
          'Engineered an AI-driven digital solution addressing grassroots handicraft and artisan challenges using LLMs.',
      credentialUrl: 'https://github.com/manab-ghh/SIH-2026',
    ),
    AchievementItem(
      title: 'Top Performer — Web3 & Distributed Systems',
      organizer: 'INNOVARE Hackathon Series',
      date: '2024',
      badge: 'Top 5 Finalist',
      description:
          'Collaborated with a cross-functional squad to ship a functional proof of concept in an intense 36-hour sprint.',
      credentialUrl: 'https://github.com/manab-ghh',
    ),
    AchievementItem(
      title: 'Excellence in Hardware & Systems',
      organizer: 'TRONIX Tech Symposium',
      date: '2023',
      badge: 'Special Mention',
      description:
          'Presented an embedded algorithmic controller project with real-time sensor processing and telemetry.',
      credentialUrl: 'https://github.com/manab-ghh',
    ),
  ];

  // Coding Profiles
  static const List<Map<String, dynamic>> codingProfiles = [
    {
      'platform': 'LeetCode',
      'username': 'manab__344',
      'url': leetcodeUrl,
      'stats': '500+ Solved',
      'subtext': 'Algorithms & Data Structures',
      'color': Color(0xFFFFA116),
      'icon': FontAwesomeIcons.code,
    },
    {
      'platform': 'Codeforces',
      'username': 'manab.code',
      'url': codeforcesUrl,
      'stats': 'Active Competitor',
      'subtext': 'Contest Problem Solving',
      'color': Color(0xFF1F8ACB),
      'icon': FontAwesomeIcons.trophy,
    },
    {
      'platform': 'GitHub',
      'username': 'manab-ghh',
      'url': githubUrl,
      'stats': 'All Repositories',
      'subtext': 'Open Source & Projects',
      'color': Color(0xFFF0F6FC),
      'icon': FontAwesomeIcons.github,
    },
    {
      'platform': 'LinkedIn',
      'username': 'manabendra-mondal',
      'url': linkedinUrl,
      'stats': 'Professional Network',
      'subtext': 'Engineering & Industry Updates',
      'color': Color(0xFF0A66C2),
      'icon': FontAwesomeIcons.linkedin,
    },
  ];
}
