import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingsScreen extends StatefulWidget {
  const UserSettingsScreen({super.key});

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

<<<<<<< HEAD
class _UserSettingsScreenState extends State<UserSettingsScreen> {  
  static const String userNameKey = 'username';
  static const String userAgeKey = 'user_age';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
=======
class _UserSettingsScreenState extends State<UserSettingsScreen> {
  static const String userNameKey = 'username';
  static const String userAgeKey = 'user_age';
  static const String userCountryKey = 'user_country';

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
>>>>>>> 88768a6 (atualização 02)

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
<<<<<<< HEAD
=======
      _countryController.text = prefs.getString(userCountryKey) ?? "";
>>>>>>> 88768a6 (atualização 02)
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados Carregados!')),
    );
  }

  void _saveUserData() async {
    String username = _nameController.text;
    int age = int.tryParse(_ageController.text) ?? 0;
<<<<<<< HEAD
=======
    String country = _countryController.text;
>>>>>>> 88768a6 (atualização 02)

    final preferences = await SharedPreferences.getInstance();

    await preferences.setInt(userAgeKey, age);
    await preferences.setString(userNameKey, username);
<<<<<<< HEAD
=======
    await preferences.setString(userCountryKey, country);
>>>>>>> 88768a6 (atualização 02)

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Dados Salvos com Sucesso!')),
    );
  }

<<<<<<< HEAD
  _buildUserSettingsScreenBody() {
=======
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
>>>>>>> 88768a6 (atualização 02)
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
<<<<<<< HEAD
=======
          TextField(
            controller: _countryController,
            decoration: InputDecoration(labelText: 'País Favorito'),
          ),
>>>>>>> 88768a6 (atualização 02)
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
<<<<<<< HEAD
                onPressed: _saveUserData, // Corrigido para chamar a função de salvar
=======
                onPressed: _saveUserData,
>>>>>>> 88768a6 (atualização 02)
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                ),
                child: Text('Salvar'),
              ),
              ElevatedButton(
<<<<<<< HEAD
                onPressed: _loadUserData, // Continua chamando a função de carregar
=======
                onPressed: _loadUserData,
>>>>>>> 88768a6 (atualização 02)
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF1877F2),
                  foregroundColor: Colors.white,
                ),
                child: Text('Carregar'),
              ),
            ],
          ),
<<<<<<< HEAD
=======
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
>>>>>>> 88768a6 (atualização 02)
        ],
      ),
    );
  }
}
