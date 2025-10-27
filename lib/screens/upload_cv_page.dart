import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../theme/app_theme.dart';

class UploadCvPage extends StatefulWidget {
  const UploadCvPage({super.key});

  @override
  State<UploadCvPage> createState() => _UploadCvPageState();
}

class _UploadCvPageState extends State<UploadCvPage> {
  String? _fileName;
  bool _isUploading = false;

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc', 'docx'],
      );

      if (result != null) {
        setState(() {
          _fileName = result.files.single.name;
          _isUploading = true;
        });

        // Simulate upload
        await Future.delayed(const Duration(seconds: 2));

        setState(() {
          _isUploading = false;
        });

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('CV uploaded successfully!'),
              backgroundColor: AppTheme.accentGreen,
            ),
          );
        }
      }
    } catch (e) {
      setState(() {
        _isUploading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.center,
          radius: 1.2,
          colors: [
            AppTheme.shimmerGreen.withOpacity(0.25),
            AppTheme.primaryBg,
            AppTheme.secondaryBg,
          ],
          stops: const [0.0, 0.6, 1.0],
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Upload your CV',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontSize: 28,
                    ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Upload your resume to get personalized job matches',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 32),

              // Upload area
              GestureDetector(
                onTap: _isUploading ? null : _pickFile,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(40),
                  decoration: BoxDecoration(
                    color: AppTheme.cardBg,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.accentGreen.withOpacity(0.3),
                      width: 2,
                      style: BorderStyle.solid,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: AppTheme.accentGreen.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          _isUploading
                              ? Icons.hourglass_empty
                              : Icons.cloud_upload_outlined,
                          size: 60,
                          color: AppTheme.accentGreen,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        _isUploading
                            ? 'Uploading...'
                            : _fileName ?? 'Tap to upload your CV',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _fileName != null
                            ? 'File selected: $_fileName'
                            : 'Supports PDF, DOC, DOCX (Max 10MB)',
                        style: const TextStyle(
                          color: AppTheme.textSecondary,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Browse button
              if (!_isUploading && _fileName == null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _pickFile,
                    icon: const Icon(Icons.folder_open),
                    label: const Text('Browse files'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),

              const SizedBox(height: 32),

              // Tips section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppTheme.cardBg.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: const [
                        Icon(
                          Icons.tips_and_updates_outlined,
                          color: AppTheme.accentGreen,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          'Tips for best results',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimary,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildTip('Use a clear, professional format'),
                    _buildTip('Include relevant keywords'),
                    _buildTip('Keep it updated with recent experience'),
                    _buildTip('Highlight measurable achievements'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTip(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 6),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppTheme.accentGreen,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
