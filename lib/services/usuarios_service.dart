import 'package:http/http.dart' as http;

import 'package:chatapp/models/usuario.dart';
import 'package:chatapp/models/usuarios_response.dart';
import 'package:chatapp/global/environment.dart';

import 'package:chatapp/services/auth_services.dart';

class UsuariosService {
  Future<List<Usuario>> getUsuarios() async {
    try {
      final resp = await http.get('${Environment.apiUrl}/usuarios', headers: {
        'Content-Type': 'application/json',
        'x-token': await AuthService.getToken()
      });

      final usuariosResponse = usuariosResponseFromJson(resp.body);

      return usuariosResponse.usuarios;

    } catch (e) {
      return [];
    }
  }
}
