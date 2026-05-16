type storage is list(int)

function gnome_sort(var lst: list(int)): list(int) is
    List.sort(lst, function(a: int, b: int): bool is a < b)

function main(const action: list(int); const store: storage): (list(operation) * storage) is
    ((nil: list(operation)), gnome_sort(action))
