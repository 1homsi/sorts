permit(
    principal,
    action == Action::"sort",
    resource
)
when {
    resource.elements.size() > 0 &&
    resource.sorted == true
};

forbid(
    principal,
    action == Action::"sort",
    resource
)
unless {
    resource.sorted == true
};
