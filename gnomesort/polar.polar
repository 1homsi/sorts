allow(user, "sort", resource) if
    user.role = "admin";

allow(user, "read_sorted", resource) if
    user.role = "viewer" and
    resource.type = "sorted_array";

resource GnomeSort {
    permissions = ["sort", "read_sorted"];
    roles = {
        admin: { permissions: ["sort", "read_sorted"] },
        viewer: { permissions: ["read_sorted"] }
    };
}
