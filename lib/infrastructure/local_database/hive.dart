import 'package:hive/hive.dart';

part 'hive.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  late String name;

  @HiveField(1)
  late String contact;
}

void saveContact(Contact student) {
  final box = Hive.box<Contact>('contacts');
  box.add(student);
}

// Retrieve all contacts
List<Contact> getAllContacts() {
  final box = Hive.box<Contact>('contacts');
  return box.values.toList();
}

// Update a student
void updateContact(int index, Contact updatedContact) {
  final box = Hive.box<Contact>('contacts');
  box.putAt(index, updatedContact);
}

// Delete a student
void deleteContact(int index) {
  final box = Hive.box<Contact>('contacts');
  box.deleteAt(index);
}