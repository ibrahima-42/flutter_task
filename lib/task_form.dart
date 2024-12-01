import 'package:flutter/material.dart';

class TaskForm extends StatefulWidget {
  const TaskForm({super.key});

  @override
  State<TaskForm> createState() => _TaskFormState();
}

class _TaskFormState extends State<TaskForm> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _titreController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateDebutController = TextEditingController();
  final TextEditingController _dateFinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var espace = const SizedBox(
      height: 10.0,
    );
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
            key: _keyForm,
            child: Column(
              children: [
                const Text(
                  "Inscription",
                  style: TextStyle(fontSize: 25.0),
                ),
                espace,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "le champ titre est obligatoire";
                    }
                    return null;
                  },
                  controller: _titreController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text("titre"), border: OutlineInputBorder()),
                ),
                espace,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "le champ description est obligatoire";
                    }
                    return null;
                  },
                  controller: _descriptionController,
                  keyboardType: TextInputType.name,
                  decoration: const InputDecoration(
                      label: Text("Description"), border: OutlineInputBorder()),
                ),
                espace,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "le champ date debut est obligatoire";
                    }
                    return null;
                  },
                  controller: _dateDebutController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      label: Text("Date debut"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_month)),
                      readOnly: true,
                  onTap: () async {
                    DateTime? datechoice = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (datechoice != null) {
                      setState(() {
                        _dateDebutController.text =
                            "${datechoice.day}/${datechoice.month}/${datechoice.year}";
                      });
                    }
                  },
                ),
                espace,
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "le champ date fin est obligatoire";
                    }
                    return null;
                  },
                  controller: _dateFinController,
                  keyboardType: TextInputType.datetime,
                  decoration: const InputDecoration(
                      label: Text("Date fin"),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.calendar_month)),
                  readOnly: true,
                  onTap: () async {
                    DateTime? datechoice = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (datechoice != null) {
                      setState(() {
                        _dateFinController.text =
                            "${datechoice.day}/${datechoice.month}/${datechoice.year}";
                      });
                    }
                  },
                ),
                espace,
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0, vertical: 20.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      onPressed: () {
                        if (_keyForm.currentState!.validate()) {
                          print("Titre: $_titreController");
                          print("Description: $_descriptionController");
                          print("Date_Debut: $_dateDebutController");
                          print("Date_Fin: $_dateFinController");
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("inscription success"),
                            backgroundColor: Colors.green,
                          ));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                            content: Text("Erreur d'inscription"),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: const Text(
                        "S'inscrire",
                        style: TextStyle(color: Colors.white),
                      )),
                )
              ],
            )),
      ),
    );
  }
}
