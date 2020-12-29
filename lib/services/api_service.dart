import 'dart:io';


import 'package:semangat/models/login_data.dart';
import 'package:semangat/models/register_model.dart';
import 'package:semangat/models/company_unit.dart';

import 'package:async/async.dart';
import 'package:semangat/constans/const.dart';

import 'package:http/http.dart' as http;
import 'package:path/path.dart' as Path;

class ApiService {

  Future<ResponseRegister> register(
      String name,
      String email,
      String password,
      String position,
      String idCard,
      String company,
      String localImage,
      String unit,
      String phonenumber,
      File imageFile,
      ) async {
    try {
      final stream =
      http.ByteStream(DelegatingStream(imageFile.openRead()));
      final length = await imageFile.length();
      final multipartFile = http.MultipartFile('image', stream, length,
          filename: Path.basename(imageFile.path));
      final registerUrl = Uri.parse('${BASE_URL}users/register');
      print(registerUrl);
      final request = http.MultipartRequest('POST', registerUrl)
        ..fields['name'] = name
        ..fields['email'] = email
        ..fields['password'] = password
        ..fields['position'] = position
        ..fields['id_card'] = idCard
        ..fields['company'] = company
        ..fields['local_image'] = localImage
        ..fields['unit'] = unit
        ..fields['phone_number'] = phonenumber
        ..files.add(multipartFile);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      final userData = responseRegisterFromJson(response.body);
      print(userData);
      print('response register ${response.body}');
      return userData;
    } catch (e) {
      print('[Register] Error occurred $e');
      return null;
    }
  }

  Future<LoginData> newLogin(String email, String password) async {
    final client = http.Client();
    try {
      final loginUrl = '${BASE_URL}users/login';
      print('login URL $loginUrl');

      final response = await client.post(
        loginUrl,
        body: {
          'email': email,
          'password': password,
        },
      );
      print(response.body);
      final userData = loginDataFromJson(response.body);
      return userData;
    } catch (e) {
      print('[Login] error occurred $e');
      return null;
    }
  }

  Future<CompanyUnitData> getCompanyUnit(String companyCode) async {
    final client = http.Client();
    try {
      final reportUrl = '${BASE_URL}company/$companyCode/units?code=true';
      final response = await client.get(reportUrl);
      final companyUnitData = companyUnitDataFromJson(response.body);

      if (companyUnitData.code != 200) {
        return null;
      }
      return companyUnitData;
    } catch (e) {
      print('[getCompanyUnit] error occurred $e');
      return null;
    }
  }

}
