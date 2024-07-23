class EmployeeResponse {
  String status;
  List<Employee> data;
  String message;

  EmployeeResponse({required this.status, required this.data, required this.message});

  factory EmployeeResponse.fromJson(Map<String, dynamic> json) {
    return EmployeeResponse(
      status: json['status'],
      data: List<Employee>.from(json['data'].map((employee) => Employee.fromJson(employee))),
      message: json['message'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'data': data.map((employee) => employee.toJson()).toList(),
      'message': message,
    };
  }
}

class Employee {
  int id;
  String employeeName;
  int employeeSalary;
  int employeeAge;
  String profileImage;

  Employee({
    required this.id,
    required this.employeeName,
    required this.employeeSalary,
    required this.employeeAge,
    required this.profileImage,
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
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
