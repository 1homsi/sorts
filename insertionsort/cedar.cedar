permit (
    principal,
    action == Action::"Sort",
    resource
)
when {
    resource has values &&
    resource.values.size() > 0
};

forbid (
    principal,
    action == Action::"Access",
    resource
)
unless {
    resource has priority &&
    resource.priority >= 1 &&
    resource.priority <= 5
};
