allow(user, "sort", array) if
    is_list(array) and
    user.role = "admin";

allow(_, "view_sorted", _);

sorted_array(arr, sorted) if
    sorted = sort(arr);
