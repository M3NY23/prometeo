String getTimeStamp([String prefix = ""]) {
  String now = DateTime.now().toString();
  return prefix +
      now
          .replaceAll("-", "_")
          .replaceAll(" ", "_")
          .replaceAll(":", "_")
          .replaceAll(".", "_");
}
