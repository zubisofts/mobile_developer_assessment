class Api {
  Api._();

  static Map<String, dynamic> errorRexponse = {
    "statusCode": 400,
    "message": "An error occurred",
    "errors": [
      {
        "errorCode": "UNABLE_TO_READ",
        "message": "The table entry 'salary' does not exist"
      },
      {
        "errorCode": "UNABLE_TO_READ",
        "message": "The table entry 'name' does not exist"
      },
      {
        "errorCode": "DUPLICATE_ENTRY",
        "message": "The table entry 'designation' already exists"
      },
    ],
    "data": {}
  };

  static Map<String, dynamic> successResponse = {
    "statusCode": 200,
    "message": "Successful!",
    "errors": null,
    "data": [
      {
        "id": 66,
        "first_name": "Jonathan",
        "last_name": "Strange",
        "designation": "Custoner Relations",
        "level": 1,
        "productivity_score": 78.0,
        "current_salary": "100,000",
        "employment_status": 1
      },
      {
        "id": 1,
        "first_name": "Abigail",
        "last_name": "Abernathy",
        "designation": "Custoner Relations",
        "level": 0,
        "productivity_score": 45.0,
        "current_salary": "70,000",
        "employment_status": 1
      },
      {
        "id": 85,
        "first_name": "John",
        "last_name": "Doe",
        "designation": "Legal",
        "level": 3,
        "productivity_score": 70.0,
        "current_salary": "180,000",
        "employment_status": 1
      },
      {
        "id": 30,
        "first_name": "Rachel",
        "last_name": "Hives",
        "designation": "Tech",
        "level": 2,
        "productivity_score": 91.0,
        "current_salary": "120,000",
        "employment_status": 1
      },
      {
        "id": 4,
        "first_name": "Robert",
        "last_name": "Mann",
        "designation": "Custoner Relations",
        "level": 0,
        "productivity_score": 31.0,
        "current_salary": "70,000",
        "employment_status": 1
      },
      {
        "id": 17,
        "first_name": "Robert",
        "last_name": "Mannilow",
        "designation": "Human Resources",
        "level": 2,
        "productivity_score": 67.0,
        "current_salary": "120,000",
        "employment_status": 1
      },
      {
        "id": 114,
        "first_name": "Ben",
        "last_name": "Angel",
        "designation": "Human Resouces",
        "level": 1,
        "productivity_score": 69.0,
        "current_salary": "100,000",
        "employment_status": 1
      },
      {
        "id": 123,
        "first_name": "Ben",
        "last_name": "Franklin",
        "designation": "Legal",
        "level": 1,
        "productivity_score": 44.0,
        "current_salary": "100,000",
        "employment_status": 1
      },
      {
        "id": 14,
        "first_name": "Bob",
        "last_name": "Timson",
        "designation": "Tech",
        "level": 3,
        "productivity_score": 78.8,
        "current_salary": "180,000",
        "employment_status": 1
      },
      {
        "id": 18,
        "first_name": "Ben",
        "last_name": "Angel",
        "designation": "Customer Relations",
        "level": 0,
        "productivity_score": 89.0,
        "current_salary": "70,000",
        "employment_status": 1
      },
    ]
  };
}
