class Node {
    read_write_slot: 'val
    read_write_slot: 'left
    read_write_slot: 'right

    def initialize: v {
        @val = v
        @left = nil
        @right = nil
    }

    def insert: v {
        v < @val
            if_true: {
                @left nil? if_true: {
                    @left = Node new: v
                } if_false: {
                    @left insert: v
                }
            } if_false: {
                @right nil? if_true: {
                    @right = Node new: v
                } if_false: {
                    @right insert: v
                }
            }
    }

    def inorder: result {
        @left nil? if_false: { @left inorder: result }
        result push: @val
        @right nil? if_false: { @right inorder: result }
    }
}

def treesort: arr {
    root = nil
    arr each: |v| {
        root nil? if_true: {
            root = Node new: v
        } if_false: {
            root insert: v
        }
    }
    result = []
    root nil? if_false: { root inorder: result }
    result
}

treesort: [5, 3, 7, 1, 4, 6, 8] . println
