import 'package:flutter/material.dart';

class TaskDetail extends StatefulWidget {
  final Map<String, String> task;
  const TaskDetail({super.key, required this.task});

  @override
  State<TaskDetail> createState() => _TaskDetailState();
}

class _TaskDetailState extends State<TaskDetail> {
  @override
  Widget build(BuildContext context) {
    var espace = const SizedBox(
      height: 5.0,
    );
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: true,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          "Detail Task",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 40.0),
          child: Column(
            children: [
              const CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(
                  Icons.add_task,
                  color: Colors.white,
                ),
              ),
              espace,
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: "Titre: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "${widget.task["titre"]}",
                      style: const TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              espace,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Description :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.task["description"]}")
              ])),
              espace,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Date_debut :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.task["date_debut"]}"),
              ])),
              espace,
              Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Date_fin :",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "${widget.task["date_fin"]}"),
              ])),

              espace,
              espace,
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(onPressed: (){},
                    icon: Icon(Icons.delete,color: Colors.red,size: 20.0,),
                    label: Text("Supprimer",style: TextStyle(color: Colors.red),))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
