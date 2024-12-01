import 'package:flutter/material.dart';
import 'package:taskmanagement/task_details.dart';
import 'package:taskmanagement/task_form.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {
  var task = [
    {
      "titre": "Football",
      "description": "Sport",
      "date_debut": "2024-06-10",
      "date_fin": "2024-06-10"
    },
    {
      "titre": "Réunion d'équipe",
      "description": "Planification des projets",
      "date_debut": "2024-07-01",
      "date_fin": "2024-07-01"
    },
    {
      "titre": "Lecture",
      "description": "Lire un livre sur la gestion du temps",
      "date_debut": "2024-08-15",
      "date_fin": "2024-08-16"
    },
    {
      "titre": "Cours de cuisine",
      "description": "Apprendre à faire des sushis",
      "date_debut": "2024-09-10",
      "date_fin": "2024-09-10"
    },
    {
      "titre": "Voyage",
      "description": "Visiter Paris",
      "date_debut": "2024-10-05",
      "date_fin": "2024-10-10"
    },
    {
      "titre": "Conférence",
      "description": "Participer à une conférence sur la technologie",
      "date_debut": "2024-11-20",
      "date_fin": "2024-11-22"
    },
    {
      "titre": "Anniversaire",
      "description": "Organiser une fête d'anniversaire",
      "date_debut": "2024-12-15",
      "date_fin": "2024-12-15"
    },
    {
      "titre": "Exercice physique",
      "description": "Faire du jogging",
      "date_debut": "2024-01-10",
      "date_fin": "2024-01-10"
    },
    {
      "titre": "photographie",
      "description": "Apprendre les bases de la photographie",
      "date_debut": "2024-02-05",
      "date_fin": "2024-02-07"
    },
    {
      "titre": "Projet de groupe",
      "description": "Terminer un projet universitaire",
      "date_debut": "2024-03-20",
      "date_fin": "2024-03-25"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TaskList",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) => ListTile(
          leading: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add_task,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          title: Text("${task[index]["titre"]}",style: TextStyle(fontWeight: FontWeight.bold),),
          subtitle: Text("${task[index]["description"]}"),
          trailing: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => TaskDetail(task: task[index])));
              },
              icon: const Icon(Icons.arrow_circle_right)),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 92, 90, 90),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const TaskForm()));
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
