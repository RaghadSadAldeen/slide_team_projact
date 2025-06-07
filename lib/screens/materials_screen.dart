import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../view_models/materials_view_model.dart';

class SubjectContentScreen extends StatefulWidget {
  final String materialTitle;

  const SubjectContentScreen({super.key, required this.materialTitle});

  @override
  State<SubjectContentScreen> createState() => _SubjectContentScreenState();
}

class _SubjectContentScreenState extends State<SubjectContentScreen> {
  @override
  void initState() {
    super.initState();
    final viewModel = Provider.of<MaterialsViewModel>(context, listen: false);
    viewModel.fetchMaterials();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<MaterialsViewModel>(context);

    return Scaffold(
      appBar: AppBar(title: Text(widget.materialTitle)),
      body: viewModel.materials.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.builder(
          itemCount: viewModel.materials.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
          ),
          itemBuilder: (context, index) {
            final material = viewModel.materials[index];
            return MaterialButton(
              color: Colors.green[200],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              onPressed: () async {
                final uri = Uri.tryParse(material.url.trim());
                if (uri != null && await canLaunchUrl(uri)) {
                  await launchUrl(uri,
                      mode: LaunchMode.externalApplication);
                } else {
                  debugPrint('Could not launch URL: ${material.url}');
                }
              },
              child: Center(
                child: Text(
                  material.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
