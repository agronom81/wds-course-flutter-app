dynamic getValue(data, key) {
  if (data is Map && data.containsKey(key)) {
    return data[key];
  }

  return null;
}
