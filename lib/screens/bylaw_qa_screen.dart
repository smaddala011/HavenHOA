import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../services/bylaw_service.dart';
import '../services/auth_service.dart';

class BylawQAScreen extends StatefulWidget {
  const BylawQAScreen({super.key});

  @override
  State<BylawQAScreen> createState() => _BylawQAScreenState();
}

class _BylawQAScreenState extends State<BylawQAScreen> {
  final _svc = BylawService();
  final _qCtrl = TextEditingController();
  bool _loading = false;
  String? _answer;
  List<Map<String, dynamic>> _citations = const [];

  @override
  void initState() {
    super.initState();
    AuthService.instance.debugPrintConfig();
  }

  Future<void> _ask() async {
    final q = _qCtrl.text.trim();
    if (q.isEmpty) return;
    setState(() => _loading = true);
    try {
      final data = await _svc.ask(query: q);
      setState(() {
        _answer = data['answer'] as String?;
        final raw = (data['citations'] as List?) ?? [];
        _citations =
            raw.map((e) => Map<String, dynamic>.from(e as Map)).toList();
      });
    } catch (e) {
      setState(() {
        _answer = 'Error: $e';
        _citations = const [];
      });
    } finally {
      setState(() => _loading = false);
    }
  }

  Future<void> _ingest() async {
    final res = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf', 'txt', 'md']);
    if (res == null || res.files.single.path == null) return;
    setState(() => _loading = true);
    try {
      final out = await _svc.ingest(file: File(res.files.single.path!));
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Ingested ${out['chunks']} chunks')));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Ingest failed: $e')));
      }
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isBoard = AuthService.instance.isBoard;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bylaw Q&A'),
        actions: [
          if (isBoard)
            IconButton(
              icon: const Icon(Icons.file_upload_outlined),
              tooltip: 'Upload bylaws',
              onPressed: _loading ? null : _ingest,
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Community: ${AuthService.communityId}',
              style: Theme.of(context).textTheme.labelMedium),
          const SizedBox(height: 8),
          TextField(
            controller: _qCtrl,
            decoration: InputDecoration(
              labelText: 'Ask a question about bylaws',
              hintText: 'Can I install solar panels?',
              suffixIcon: IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _loading ? null : _ask),
            ),
            onSubmitted: (_) => _ask(),
          ),
          const SizedBox(height: 16),
          if (_loading) const LinearProgressIndicator(),
          const SizedBox(height: 12),
          if (_answer != null) ...[
            Text('Answer', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: Text(_answer!),
            ),
            const SizedBox(height: 12),
            Text('Citations', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: _citations.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, i) {
                  final c = _citations[i];
                  return ListTile(
                    dense: true,
                    title: Text((c['section'] ?? 'Section').toString()),
                    subtitle: Text((c['snippet'] ?? '').toString()),
                    trailing: Text('p.${c['page'] ?? '?'}'),
                  );
                },
              ),
            ),
          ] else
            const Expanded(
                child: Center(
                    child:
                        Text('Ask a question to see answers with citations.'))),
        ]),
      ),
    );
  }
}
