(class Node is NSObject
    (ivar (id) val (id) left (id) right)
    (- (id) initWithVal:(id) v is
        (set @val v)
        (set @left nil)
        (set @right nil)
        self)
    (- (id) insert:(id) v is
        (if (< v @val)
            (then (if @left
                       (then (@left insert:v))
                       (else (set @left ((Node alloc) initWithVal:v)))))
            (else (if @right
                       (then (@right insert:v))
                       (else (set @right ((Node alloc) initWithVal:v)))))))
    (- (void) inorder:(id) result is
        (if @left (then (@left inorder:result)))
        (result addObject:@val)
        (if @right (then (@right inorder:result)))))

(set arr (array 5 3 7 1 4 6 8))
(set root nil)
(arr each:(do (v)
    (if root
        (then (root insert:v))
        (else (set root ((Node alloc) initWithVal:v))))))
(set result (NSMutableArray array))
(root inorder:result)
(puts result)
