// employee_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rn/core/base_url.dart';
import 'package:rn/features/EmployeesDetails/data/employedetailsdata.dart';

class EmployeeDetailsServices {
  Future<EmployeeResponse> fetchEmployee(int id) async {
    final response = await http.get(Uri.parse(BaseUrl + "employee/$id"));
    print(response.statusCode);
    if (response.statusCode == 200) {
      return EmployeeResponse.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load employee');
    }
  }
}
