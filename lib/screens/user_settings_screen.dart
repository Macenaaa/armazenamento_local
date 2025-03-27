import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  static const String userNameKey = 'username';
  static const String userAgeKey = 'user_age';
  static const String userCountryKey = 'user_country';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Configurações do Usuário")),
      body: _buildUserSettingsScreenBody(),
    );
  }

  void _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nameController.text = prefs.getString(userNameKey) ?? "";
      _ageController.text = prefs.getInt(userAgeKey)?.toString() ?? "";
      _countryController.text = prefs.getString(userCountryKey) ?? "";
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados Carregados!')),
    );
  }

  void _saveUserData() async {
    String username = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
    String country = _countryController.text;

    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt(userAgeKey, age);
    await preferences.setString(userNameKey, username);
    await preferences.setString(userCountryKey, country);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados Salvos com Sucesso!')),
    );
  }

  void _clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(userNameKey);
    await prefs.remove(userAgeKey);
    await prefs.remove(userCountryKey);

    setState(() {
      _nameController.clear();
      _ageController.clear();
      _countryController.clear();
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados Limpos!')),
    );
  }

  Widget _buildUserSettingsScreenBody() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _nameController,
            decoration: InputDecoration(labelText: 'Nome'),
          ),
          TextField(
            controller: _ageController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Idade'),
          ),
          TextField(
            controller: _countryController,
            decoration: InputDecoration(labelText: 'País Favorito'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: _saveUserData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                ),
                child: Text('Salvar'),
              ),
              ElevatedButton(
                onPressed: _loadUserData,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                ),
                child: Text('Carregar'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _clearUserData,
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFFFC4C4C),
              foregroundColor: Colors.white,
            ),
            child: Text('Limpar Dados'),
          ),
          SizedBox(height: 20),
          if (_countryController.text.isNotEmpty) ...[
           
          ],
        ],
      ),
    );
  }

  
  
  }

