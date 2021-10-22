import 'dart:io';

class Document {
  late String path;
  late Directory? directory;
  late File file;

  Document(this.path, {this.directory}) {
    if (this.directory != null) {
      this.path = "${directory!.path}/$path";
    }

    this.file = File(path);
  }

  //exists
  Future<bool> exists() {
    return file.exists();
  }

  //write
  Future<File> writeString(String content) async {
    return file.writeAsString(content);
  }

  Future<File> writeBytes(List<int> content) async {
    return file.writeAsBytes(content);
  }

//read
  Future<String> readString() {
    return file.readAsString();
  }

//delete
  Future delete() async {
    if (await this.exists()) {
      await file.delete();
    }
  }
}
