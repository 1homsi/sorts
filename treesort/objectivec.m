#import <Foundation/Foundation.h>

@interface BSTNode : NSObject
@property int val;
@property BSTNode *left, *right;
- (id)initWithVal:(int)v;
@end

@implementation BSTNode
- (id)initWithVal:(int)v {
    self = [super init];
    self.val = v;
    return self;
}
@end

BSTNode* insert(BSTNode* node, int val) {
    if (!node) return [[BSTNode alloc] initWithVal:val];
    if (val < node.val) node.left = insert(node.left, val);
    else node.right = insert(node.right, val);
    return node;
}

void inorder(BSTNode* node, NSMutableArray* result) {
    if (!node) return;
    inorder(node.left, result);
    [result addObject:@(node.val)];
    inorder(node.right, result);
}

NSArray* treesort(NSArray* arr) {
    BSTNode* root = nil;
    for (NSNumber* n in arr) root = insert(root, n.intValue);
    NSMutableArray* result = [NSMutableArray array];
    inorder(root, result);
    return result;
}

int main() {
    @autoreleasepool {
        NSArray* sorted = treesort(@[@5, @3, @7, @1, @4, @6, @8]);
        NSLog(@"%@", sorted);
    }
    return 0;
}
