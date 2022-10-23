num roundToIncrement({
  required num increment,
  required num numberToRound,
}) {
  return (numberToRound / increment).ceil() * increment;
}
