import 'package:flutter/material.dart';
import '../model/activity.dart';

class ActivityFormPage extends StatefulWidget {
  final Activity? activity;
  final int? index;
  final Function onSave;

  ActivityFormPage({
    this.activity,
    this.index,
    required this.onSave,
  });

  @override
  ActivityFormPageState createState() => ActivityFormPageState();
}

class ActivityFormPageState extends State<ActivityFormPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.activity != null) {
      nameController.text = widget.activity!.name;
      durationController.text = widget.activity!.duration;
      notesController.text = widget.activity!.notes;
    }
  }

  void saveData() {
    Activity activity = Activity(
      name: nameController.text,
      duration: durationController.text,
      notes: notesController.text,
    );

    if (widget.activity == null) {
      widget.onSave(activity);
    } else {
      widget.onSave(widget.index, activity);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.activity == null
            ? 'Tambah Aktivitas'
            : 'Edit Aktivitas'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Nama Aktivitas',
                prefixIcon: Icon(Icons.sports),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: durationController,
              decoration: InputDecoration(
                labelText: 'Durasi',
                prefixIcon: Icon(Icons.timer),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              controller: notesController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Catatan',
                prefixIcon: Icon(Icons.note),
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: saveData,
              child: Text(widget.activity == null
                  ? 'Simpan Aktivitas'
                  : 'Update Aktivitas'),
            ),
          ],
        ),
      ),
    );
  }
}