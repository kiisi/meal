import 'package:flutter/material.dart';
import 'package:meal/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  final Function(Map<String, bool>) saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.saveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _gluten = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactose = false;

  @override
  initState() {
    super.initState();

    _gluten = widget.currentFilters['gluten']!;
    _vegetarian = widget.currentFilters['vegetarian']!;
    _vegan = widget.currentFilters['vegan']!;
    _lactose = widget.currentFilters['lactose']!;
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function(bool)? updateValue) {
    return SwitchListTile.adaptive(
      activeColor: Theme.of(context).colorScheme.secondary,
      title: Text(title),
      value: currentValue,
      onChanged: updateValue,
      subtitle: Text(description),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _gluten,
                'lactose': _lactose,
                'vegan': _vegan,
                'vegetarian': _vegetarian
              };
              widget.saveFilters(selectedFilters);
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text('Adjust your meal selection',
                style: Theme.of(context).textTheme.titleMedium),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildSwitchListTile(
                    'Glutten-free', 'Only include gluten-free meals', _gluten,
                    (newValue) {
                  setState(() {
                    _gluten = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'Vegan', 'Only include vegan meals', _vegan, (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwitchListTile(
                    'LactoseFree', 'Only include LactoseFree meals', _lactose,
                    (newValue) {
                  setState(() {
                    _lactose = newValue;
                  });
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
