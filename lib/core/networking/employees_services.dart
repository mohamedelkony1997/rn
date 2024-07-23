// employee_service.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rn/core/base_url.dart';
import 'package:rn/features/Employees/data/employesata.dart';

class EmployeeService {
  final String url = "${BaseUrl}employees";

  Future<EmployeeResponse> fetchEmployees() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      // If the server returns an OK response, parse the JSON.
      return EmployeeResponse.fromJson(jsonDecode(response.body));
    } else {
      // If the response was not OK, throw an error.
      throw Exception('Failed to load employees');
    }
  }

  Future<Employee> createEmployee(Map<String, dynamic> employeeData) async {
    final response = await http.post(
      Uri.parse(BaseUrl + "create"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(employeeData),
    );

    if (response.statusCode == 200) {
      return Employee.fromJson(jsonDecode(response.body)['data']);
    } else {
      throw Exception('Failed to create employee');
    }
  }

  Future<void> updateEmployee(int id, Map<String, dynamic> employeeData) async {
    final response = await http.put(
      Uri.parse('${BaseUrl}update/$id'),
      body: json.encode(employeeData),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to update employee');
    }
  }

  Future<void> deleteEmployee(int id) async {
    final response = await http.delete(Uri.parse('$BaseUrl/delete/$id'));

    if (response.statusCode != 200) {
      throw Exception('Failed to delete employee');
    }
  }
}
