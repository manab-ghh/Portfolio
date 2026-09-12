import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../app/theme.dart';
import '../data/portfolio_data.dart';
import '../utils/launcher.dart';
import '../utils/responsive.dart';
import '../widgets/app_icon.dart';
import '../widgets/section_title.dart';
import '../widgets/social_button.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  bool _isSent = false;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      final subject = _subjectController.text.trim().isNotEmpty
          ? _subjectController.text.trim()
          : 'Portfolio Inquiry from ${_nameController.text.trim()}';

      final body =
          'Name: ${_nameController.text.trim()}\nEmail: ${_emailController.text.trim()}\n\nMessage:\n${_messageController.text.trim()}';

      UrlHelper.sendEmail(
        PortfolioData.email,
        subject: subject,
        body: body,
      );

      setState(() => _isSent = true);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text(
            'Email client opened! You can also reach me directly at mondalmanabendra001@gmail.com',
            style: TextStyle(fontFamily: 'Inter'),
          ),
          backgroundColor: AppColors.primary,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.horizontalPadding(context),
        vertical: isMobile ? AppSpacing.sectionMobile : AppSpacing.section,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1140),
          child: Column(
            children: [
              const SectionTitle(
                tag: 'Contact',
                title: "Let's Build Something Together",
                subtitle:
                    'Have an opportunity, project collaboration, or just want to chat engineering? Reach out anytime!',
              ),
              if (isMobile) ...[
                _buildContactInfo(),
                const SizedBox(height: AppSpacing.xl),
                _buildContactForm(),
              ] else ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: _buildContactInfo(),
                    ),
                    const SizedBox(width: 48),
                    Expanded(
                      flex: 6,
                      child: _buildContactForm(),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Direct Information',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        const Text(
          'Feel free to connect directly via email or check out my profiles across the web.',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: AppColors.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: AppSpacing.lg),

        // Email row
        _buildInfoTile(
          icon: FontAwesomeIcons.envelope,
          title: 'Email',
          value: PortfolioData.email,
          onTap: () => UrlHelper.sendEmail(PortfolioData.email),
        ),

        // Location row
        _buildInfoTile(
          icon: FontAwesomeIcons.locationDot,
          title: 'Location',
          value: PortfolioData.location,
        ),

        // Availability row
        _buildInfoTile(
          icon: FontAwesomeIcons.briefcase,
          title: 'Opportunity Status',
          value: 'Open to internships & full-time developer roles',
        ),

        const SizedBox(height: AppSpacing.lg),
        const Text(
          'Connect on Social Platforms',
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        const Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            SocialButton(
              icon: FontAwesomeIcons.github,
              tooltip: 'GitHub',
              url: PortfolioData.githubUrl,
            ),
            SocialButton(
              icon: FontAwesomeIcons.linkedin,
              tooltip: 'LinkedIn',
              url: PortfolioData.linkedinUrl,
            ),
            SocialButton(
              icon: FontAwesomeIcons.code,
              tooltip: 'LeetCode',
              url: PortfolioData.leetcodeUrl,
            ),
            SocialButton(
              icon: FontAwesomeIcons.trophy,
              tooltip: 'Codeforces',
              url: PortfolioData.codeforcesUrl,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildInfoTile({
    required dynamic icon,
    required String title,
    required String value,
    VoidCallback? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.radiusMd,
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.surfaceElevated,
                borderRadius: AppRadius.radiusMd,
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: AppIcon(icon, size: 16, color: AppColors.primary),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      color: AppColors.textMuted,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    value,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xl),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.radiusLg,
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Send a Direct Message',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.lg),

            // Name
            _buildTextField(
              controller: _nameController,
              label: 'Your Name',
              hint: 'John Doe',
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter your name' : null,
            ),
            const SizedBox(height: AppSpacing.md),

            // Email
            _buildTextField(
              controller: _emailController,
              label: 'Your Email',
              hint: 'john@example.com',
              keyboardType: TextInputType.emailAddress,
              validator: (v) {
                if (v == null || v.trim().isEmpty) return 'Please enter your email';
                if (!v.contains('@') || !v.contains('.')) return 'Please enter a valid email';
                return null;
              },
            ),
            const SizedBox(height: AppSpacing.md),

            // Subject
            _buildTextField(
              controller: _subjectController,
              label: 'Subject',
              hint: 'Software Opportunity / Project Discussion',
            ),
            const SizedBox(height: AppSpacing.md),

            // Message
            _buildTextField(
              controller: _messageController,
              label: 'Message',
              hint: 'Hello Manabendra, I would love to talk about...',
              maxLines: 4,
              validator: (v) => (v == null || v.trim().isEmpty) ? 'Please enter your message' : null,
            ),
            const SizedBox(height: AppSpacing.lg),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: AppRadius.radiusMd,
                  ),
                  elevation: 4,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(_isSent ? Icons.check_circle_outline_rounded : Icons.send_rounded, size: 16),
                    const SizedBox(width: 8),
                    Text(
                      _isSent ? 'Message Prepared (Open Email)' : 'Send Message',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
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

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    int maxLines = 1,
    TextInputType? keyboardType,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: Color(0xFFCBD5E1),
          ),
        ),
        const SizedBox(height: 6),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          keyboardType: keyboardType,
          validator: validator,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 14,
            color: Colors.white,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 14,
              color: AppColors.textMuted,
            ),
            filled: true,
            fillColor: AppColors.surfaceElevated,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: AppRadius.radiusMd,
              borderSide: const BorderSide(color: AppColors.borderSubtle),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: AppRadius.radiusMd,
              borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: AppRadius.radiusMd,
              borderSide: const BorderSide(color: AppColors.rose),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: AppRadius.radiusMd,
              borderSide: const BorderSide(color: AppColors.rose, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
