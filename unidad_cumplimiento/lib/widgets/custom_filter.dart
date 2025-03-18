import 'package:flutter/material.dart';

class CustomFilter extends StatefulWidget {
  final Map<String, bool> group1;
  final Map<String, bool> group2;
  final ValueChanged<Map<String, bool>> onGroup1Changed;
  final ValueChanged<Map<String, bool>> onGroup2Changed;

  const CustomFilter({
    Key? key,
    required this.group1,
    required this.group2,
    required this.onGroup1Changed,
    required this.onGroup2Changed,
  }) : super(key: key);

  @override
  _CustomFilterState createState() => _CustomFilterState();
}

class _CustomFilterState extends State<CustomFilter> {
  late Map<String, bool> group1;
  late Map<String, bool> group2;

  @override
  void initState() {
    super.initState();
    group1 = Map.from(widget.group1);
    group2 = Map.from(widget.group2);
  }

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: Icon(Icons.filter_list),
      title: Text('Filtros'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTile(
                title: Text('Por tipo de tarea', style: TextStyle(fontWeight: FontWeight.bold)),
                children: group1.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: group1[key],
                    onChanged: (bool? value) {
                      setState(() {
                        group1[key] = value!;
                      });
                      widget.onGroup1Changed(group1);
                    },
                  );
                }).toList(),
              ),
              ExpansionTile(
                title: Text('Por estado de tarea', style: TextStyle(fontWeight: FontWeight.bold)),
                children: group2.keys.map((String key) {
                  return CheckboxListTile(
                    title: Text(key),
                    value: group2[key],
                    onChanged: (bool? value) {
                      setState(() {
                        group2[key] = value!;
                      });
                      widget.onGroup2Changed(group2);
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}