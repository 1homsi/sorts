permit (
  principal == User::"alice",
  action == Action::"sort",
  resource == Array::"numbers"
)
when {
  context.array.length > 0 and
  context.array.length <= 100
};
