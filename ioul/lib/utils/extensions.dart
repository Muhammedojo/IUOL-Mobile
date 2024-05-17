extension StringModifier on String {
  capitalWords() => replaceAll("-", " ")
      .split(' ')
      .map((word) => word[0].toUpperCase() + word.substring(1))
      .join(' ');
}
