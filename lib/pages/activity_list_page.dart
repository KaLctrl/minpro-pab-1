import 'package:flutter/material.dart';
import '../model/activity.dart';
import 'activity_form_page.dart';

class ActivityListPage extends StatefulWidget {
  @override
  _ActivityListPageState createState() => _ActivityListPageState();
}

class _ActivityListPageState extends State<ActivityListPage> {
  List<Activity> activities = [];

  void addActivity(Activity activity) {
    setState(() {
      activities.add(activity);
    });
  }

  void updateActivity(int index, Activity activity) {
    setState(() {
      activities[index] = activity;
    });
  }

  void deleteActivity(int index) {
    setState(() {
      activities.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Log Aktivitas Olahraga'),
      ),
      body: activities.isEmpty
          ? Center(child: Text('Belum ada aktivitas'))
          : ListView.builder(
              itemCount: activities.length,
              itemBuilder: (context, index) {
                return Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade100,
                child: Icon(Icons.fitness_center, color: Colors.green),
              ),
              title: Text(
                activities[index].name,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  '${activities[index].duration}\n${activities[index].notes}',
                ),
              ),
              isThreeLine: true,
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => deleteActivity(index),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ActivityFormPage(
                      activity: activities[index],
                      index: index,
                      onSave: updateActivity,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ActivityFormPage(
                onSave: (activity) => addActivity(activity),
              ),
            ),
          );
        },
      ),
    );
  }
}