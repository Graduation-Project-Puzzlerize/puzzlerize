List<Map<String, String>> usedEmails = [
  {'name': 'John', 'email': 'john@example.com', 'password': 'password1'},
  {'name': 'Jane', 'email': 'jane@example.com', 'password': 'password2'},
];

// Extract the names from the usedEmails list and store them in usedNames
List<String> usedNames = usedEmails.map((user) => user['name']!).toList();
