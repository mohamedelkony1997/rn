// employee_model.dart

class EmployeeResponse {
  String status;
  EmployeeData data;
  String message;

  EmployeeResponse({required this.status, required this.data, required this.message});

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      status: json['status'],
      data: EmployeeData.fromJson(json['data']),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.toJson(),
      'message': message,
    };
  }
}

class EmployeeData {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  EmployeeData({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory EmployeeData.fromJson(Map<String, dynamic> json) {
    return EmployeeData(
      id: json['id'],
      employeeName: json['employee_name'],
      employeeSalary: json['employee_salary'],
      employeeAge: json['employee_age'],
      profileImage: json['profile_image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'employee_name': employeeName,
      'employee_salary': employeeSalary,
      'employee_age': employeeAge,
      'profile_image': profileImage,
    };
  }
}
