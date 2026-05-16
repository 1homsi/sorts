permit (
  principal == User::"admin",
  action == Action::"sort",
  resource == GnomeSort::"array"
)
when {
  resource.length > 0 &&
  context.sorted == false
};

permit (
  principal,
  action == Action::"read",
  resource == GnomeSort::"array"
)
when {
  context.sorted == true
};
