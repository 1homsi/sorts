import os

languages = [
    ("Logo", "logo.logo"),
    ("Hack", "hack.hack"),
    ("Q#", "qsharp.qs"),
    ("SuperCollider", "supercollider.scd"),
    ("Squirrel", "squirrel.nut"),
    ("Vim Script", "vimscript.vim"),
    ("Felix", "felix.flx"),
    ("Ooc", "ooc.ooc"),
    ("REFAL", "refal.ref"),
    ("Pop-11", "pop11.p11"),
    ("ALGOL 60", "algol60.alg"),
    ("HAL/S", "hals.hal"),
    ("Fortress", "fortress.fss"),
    ("Twelf", "twelf.elf"),
    ("PL/0", "pl0.pl0"),
    ("Kitten", "kitten.ktn"),
    ("Nit", "nit.nit"),
    ("Pure", "pure.pure"),
    ("Ciao", "ciao.ciao"),
    ("UnrealScript", "unrealscript.uc"),
    ("ChucK", "chuck.ck"),
    ("Faust", "faust.dsp"),
    ("Processing", "processing.pde"),
    ("Lustre", "lustre.lus"),
    ("OpenQASM", "openqasm.qasm"),
    ("Silq", "silq.slq"),
    ("Egison", "egison.egi"),
    ("Terra", "terra.t"),
    ("Yorick", "yorick.i"),
    ("NetLogo", "netlogo.nlogo"),
    ("Slate", "slate.slate"),
    ("Maude", "maude.maude"),
    ("SourcePawn", "sourcepawn.sp"),
    ("Nickle", "nickle.5c"),
    ("NewtonScript", "newtonscript.ns"),
    ("PEARL", "pearl.prl"),
    ("PILOT", "pilot.plt"),
    ("Simscript", "simscript.sim"),
    ("T", "tlang.t"),
    ("Nice", "nice.nice"),
    ("Converge", "converge.cv"),
    ("Cat", "cat.cat"),
    ("Leda", "leda.led"),
    ("Napier88", "napier88.np"),
    ("Eff", "eff.eff"),
    ("Timber", "timber.tmb"),
    ("Cola", "cola.cola"),
    ("Lisaac", "lisaac.li"),
    ("ALGOL W", "algolw.algw"),
    ("Pop-2", "pop2.pop2"),
    ("Limbo", "limbo.b"),
    ("Newsqueak", "newsqueak.nq"),
    ("Alef", "alef.alef"),
    ("GPSS", "gpss.gps"),
    ("Concurrent C", "concurrentc.cc"),
    ("Myrddin", "myrddin.myr"),
    ("ArkScript", "arkscript.ark"),
    ("Amber", "amber.amb"),
    ("Alore", "alore.alo"),
    ("Karel", "karel.k"),
    ("Plankalcul", "plankalcul.pk"),
    ("Obliq", "obliq.obl"),
    ("Interlisp", "interlisp.lsp"),
    ("Bril", "bril.bril"),
    ("Godel", "godel.gdl"),
    ("Hermes", "hermes.hrm"),
    ("Cyclone", "cyclone.cyc"),
    ("Epigram", "epigram.epg"),
    ("Potion", "potion.pn"),
    ("ParaSail", "parasail.psi"),
    ("Dao", "dao.dao"),
    ("Hare", "hare.ha"),
    ("Muon", "muon.mu"),
    ("Pawn", "pawn.pwn"),
    ("AngelScript", "angelscript.as"),
    ("Mizar", "mizar.miz"),
    ("HOL4", "hol4.hol4"),
    ("Janus", "janus.janus"),
    ("WLanguage", "wlanguage.wl"),
    ("TECO", "teco.tec"),
    ("Concurrent Pascal", "concurrentpascal.cp"),
    ("Clay", "clay.clay"),
    ("Nesl", "nesl.nesl"),
    ("ECLiPSe", "eclipse_clp.ecl"),
    ("Bigloo", "bigloo.scm"),
    ("Gambit", "gambit.scm"),
    ("FRACTRAN", "fractran.frac"),
    ("FALSE", "false_lang.false"),
    ("Taxi", "taxi.taxi"),
    ("TI-BASIC", "tibasic.tibas"),
    ("NSIS", "nsis.nsi"),
    ("Zimbu", "zimbu.zim"),
    ("YAP Prolog", "yap.yap"),
    ("XSB", "xsb.xsb"),
    ("ISWIM", "iswim.iswim"),
    ("DRAKON", "drakon.drn"),
    ("TACL", "tacl.tacl"),
    ("Speakeasy", "speakeasy.spk"),
    ("Salmon", "salmon.salmon"),
    ("Jai", "jai.jai"),
    ("Oberon-07", "oberon07.mod"),
    ("Magpie", "magpie.mag"),
    ("Lox", "lox.lox"),
    ("Monkey", "monkey.monkey"),
    ("JScript", "jscript.jse"),
    ("Spry", "spry.spry"),
    ("Gofer", "gofer.gof"),
    ("Beluga", "beluga.bel"),
    ("Dex", "dex.dx"),
]

implementations = {
    "logo.logo": """to tree-sort :arr
  if :arr = [] [output []]
  local "root
  local "sorted
  make "root se.empty
  foreach :arr [make "root insert :root ?]
  make "sorted []
  inorder :root
end

to insert :node :val
  if :node = [] [output list :val [] []]
  if :val < first :node [output list first :node insert bf :node :val last :node]
  if :val > first :node [output list first :node bf :node insert last :node :val]
  output :node
end

to inorder :node
  if :node = [] [stop]
  inorder bf :node
  print first :node
  inorder last :node
end

print tree-sort [5 2 8 1 9 3]
""",

    "hack.hack": """<?hh
class Node {
  public int $val;
  public ?Node $left = null;
  public ?Node $right = null;
  public function __construct(int $v) { $this->val = $v; }
}

function insert(?Node $node, int $val): Node {
  if ($node === null) { return new Node($val); }
  if ($val < $node->val) { $node->left = insert($node->left, $val); }
  else if ($val > $node->val) { $node->right = insert($node->right, $val); }
  return $node;
}

function inorder(?Node $node, vec<int> &$result): void {
  if ($node === null) { return; }
  inorder($node->left, $result);
  $result[] = $node->val;
  inorder($node->right, $result);
}

function treeSort(vec<int> $arr): vec<int> {
  $root = null;
  foreach ($arr as $val) { $root = insert($root, $val); }
  $result = vec[];
  inorder($root, $result);
  return $result;
}

$result = treeSort(vec[5, 2, 8, 1, 9, 3]);
echo implode(", ", $result) . "\\n";
""",

    "qsharp.qs": """namespace TreeSort {
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    newtype Node = (Value: Int, Left: Node?, Right: Node?);

    function Insert(node: Node?, val: Int): Node {
        match node {
            case null => Node(val, null, null)
            case n =>
                if val < n::Value {
                    Node(n::Value, Insert(n::Left, val), n::Right)
                } else if val > n::Value {
                    Node(n::Value, n::Left, Insert(n::Right, val))
                } else {
                    n
                }
        }
    }

    function Inorder(node: Node?, result: Int[]): Int[] {
        match node {
            case null => result
            case n =>
                let left = Inorder(n::Left, result);
                let withNode = left + [n::Value];
                Inorder(n::Right, withNode)
        }
    }

    function TreeSort(arr: Int[]): Int[] {
        mutable root = null;
        for val in arr {
            set root = Insert(root, val);
        }
        Inorder(root, [])
    }
}
""",

    "supercollider.scd": """(
var insert = { |node, val|
  if (node.isNil) {
    (value: val, left: nil, right: nil)
  } {
    if (val < node.value) {
      (value: node.value, left: insert.(node.left, val), right: node.right)
    } {
      if (val > node.value) {
        (value: node.value, left: node.left, right: insert.(node.right, val))
      } {
        node
      }
    }
  }
};

var inorder = { |node, result|
  if (node.isNil) {
    result
  } {
    var left = inorder.(node.left, result);
    var withNode = left ++ [node.value];
    inorder.(node.right, withNode)
  }
};

var arr = [5, 2, 8, 1, 9, 3];
var root = nil;
arr.do { |val| root = insert.(root, val); };
var sorted = inorder.(root, []);
sorted.postln;
)
""",

    "squirrel.nut": """function insert(node, val) {
  if (node == null) {
    return { value = val, left = null, right = null };
  }
  if (val < node.value) {
    node.left = insert(node.left, val);
  } else if (val > node.value) {
    node.right = insert(node.right, val);
  }
  return node;
}

function inorder(node, result) {
  if (node == null) return result;
  result = inorder(node.left, result);
  result.push(node.value);
  return inorder(node.right, result);
}

function treeSort(arr) {
  local root = null;
  foreach (val in arr) {
    root = insert(root, val);
  }
  return inorder(root, []);
}

print(treeSort([5, 2, 8, 1, 9, 3]));
""",

    "vimscript.vim": """function! s:insert(node, val)
  if empty(a:node)
    return {'value': a:val, 'left': {}, 'right': {}}
  endif
  if a:val < a:node.value
    let a:node.left = s:insert(a:node.left, a:val)
  elseif a:val > a:node.value
    let a:node.right = s:insert(a:node.right, a:val)
  endif
  return a:node
endfunction

function! s:inorder(node, result)
  if empty(a:node)
    return a:result
  endif
  let a:result = s:inorder(a:node.left, a:result)
  call add(a:result, a:node.value)
  return s:inorder(a:node.right, a:result)
endfunction

function! TreeSort(arr)
  let root = {}
  for val in a:arr
    let root = s:insert(root, val)
  endfor
  return s:inorder(root, [])
endfunction

echo TreeSort([5, 2, 8, 1, 9, 3])
""",

    "felix.flx": """struct node { value: int; left: opt[node]; right: opt[node]; };

fun insert(n: opt[node], val: int): opt[node] =
  match n with
  | None => Some (node (val, None, None))
  | Some nd =>
    if val < nd.value then
      Some (node (nd.value, insert(nd.left, val), nd.right))
    elif val > nd.value then
      Some (node (nd.value, nd.left, insert(nd.right, val)))
    else
      Some nd
    endif;

fun inorder(n: opt[node], result: list[int]): list[int] =
  match n with
  | None => result
  | Some nd =>
    let left = inorder(nd.left, result) in
    let withNode = left + (nd.value :: []) in
    inorder(nd.right, withNode);

fun treeSort(arr: list[int]): list[int] =
  let root = fold_left (fun (n: opt[node], v: int) => insert(n, v)) None arr in
  inorder(root, []);

val sorted = treeSort [5, 2, 8, 1, 9, 3];
println$ sorted;
""",

    "ooc.ooc": """Node: class {
  value: Int
  left: Node
  right: Node

  init: func (v: Int) {
    this value = v
    this left = null
    this right = null
  }
}

insert: func (node: Node, val: Int) -> Node {
  if (node == null) {
    return Node new(val)
  }
  if (val < node value) {
    node left = insert(node left, val)
  } else if (val > node value) {
    node right = insert(node right, val)
  }
  return node
}

inorder: func (node: Node, result: ArrayList<Int>) -> ArrayList<Int> {
  if (node == null) return result
  result = inorder(node left, result)
  result add(node value)
  return inorder(node right, result)
}

treeSort: func (arr: ArrayList<Int>) -> ArrayList<Int> {
  root := null as Node
  arr each(|val| root = insert(root, val))
  return inorder(root, ArrayList<Int> new())
}

arr := ArrayList<Int> new()
arr addAll([5, 2, 8, 1, 9, 3])
treeSort(arr) println()
""",

    "refal.ref": """$ENTRY Go {
  = <Prout <TreeSort [5 2 8 1 9 3]>>;
}

TreeSort {
  s.Arr = <Inorder <BuildTree s.Arr>>;
}

BuildTree {
  [] = ;
  s.X s.Xs = <Insert (<BuildTree s.Xs>) s.X>;
}

Insert {
  s.Val = (s.Val);
  (s.V s.L s.R) s.Val, <Compare s.Val s.V> : '+' = (s.V <Insert s.L s.Val> s.R);
  (s.V s.L s.R) s.Val, <Compare s.Val s.V> : '-' = (s.V s.L <Insert s.R s.Val>);
  (s.V s.L s.R) s.Val = (s.V s.L s.R);
}

Inorder {
  = ;
  (s.V s.L s.R) = <Inorder s.L> s.V <Inorder s.R>;
}
""",

    "pop11.p11": """define insert(node, val) -> node;
  if node = [] then
    {val, [], []}
  elseif val < front(node) then
    {front(node), insert(back(node, 1), val), back(node, 2)}
  elseif val > front(node) then
    {front(node), back(node, 1), insert(back(node, 2), val)}
  else
    node
  endif
enddefine;

define inorder(node, result) -> result;
  if node = [] then
    result
  else
    insert(inorder(back(node, 1), result), back(node, 2), front(node))
  endif
enddefine;

define tree_sort(arr) -> result;
  lvars root = [];
  fast_for val in_array arr do
    insert(root, val) -> root
  endfor;
  inorder(root, []) -> result
enddefine;

tree_sort({5, 2, 8, 1, 9, 3}) =>
""",

    "algol60.alg": """begin
  record node(value, left, right);

  procedure insert(node, val);
  value val;
  reference node;
  reference result;
  begin
    if node = null then
      result := new node(val, null, null)
    else if val < node.value then
      insert(node.left, val);
      result := node
    else if val > node.value then
      insert(node.right, val);
      result := node
    else
      result := node
  end;

  procedure inorder(node);
  reference node;
  begin
    if node ≠ null then begin
      inorder(node.left);
      print(node.value);
      inorder(node.right)
    end
  end;

  integer array arr[1:6];
  reference root;
  integer i;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  root := null;
  for i := 1 step 1 until 6 do
    insert(root, arr[i]);
  inorder(root)
end
""",

    "hals.hal": """BEGIN NODE_TYPE_IS_RECORD OF (VALUE_IS_INTEGER, LEFT_IS_NODE, RIGHT_IS_NODE);

PROCEDURE INSERT (NODE REFERENCE, VALUE INTEGER) IS
  IF NODE = NULL THEN
    NODE := NEW_NODE_TYPE(VALUE, NULL, NULL)
  ELSE_IF VALUE < NODE.VALUE THEN
    INSERT(NODE.LEFT, VALUE)
  ELSE_IF VALUE > NODE.VALUE THEN
    INSERT(NODE.RIGHT, VALUE)
  END_ELSE
END_ELSE
END_ELSE
END_PROCEDURE;

PROCEDURE INORDER (NODE REFERENCE) IS
  IF NODE /= NULL THEN
    INORDER(NODE.LEFT);
    DISPLAY NODE.VALUE;
    INORDER(NODE.RIGHT)
  END_IF
END_PROCEDURE;

DECLARE ARR ARRAY[1..6] OF INTEGER;
DECLARE ROOT AS NODE REFERENCE;
ARR[1] := 5; ARR[2] := 2; ARR[3] := 8;
ARR[4] := 1; ARR[5] := 9; ARR[6] := 3;
ROOT := NULL;
FOR I := 1 TO 6 DO
  INSERT(ROOT, ARR[I])
END_FOR;
INORDER(ROOT)
END.
""",

    "fortress.fss": """object Node(value: ZZ32, left: Node, right: Node)
  getter isEmpty() = false
  getter asValue() = value
  getter leftChild() = left
  getter rightChild() = right
end

object EmptyNode
  getter isEmpty() = true
end

api (f: Node) -> Node = insert(f, v: ZZ32): Node
  if f.isEmpty then Node(v, EmptyNode, EmptyNode)
  elif v < f.asValue then Node(f.asValue, insert(f.leftChild, v), f.rightChild)
  elif v > f.asValue then Node(f.asValue, f.leftChild, insert(f.rightChild, v))
  else f
  end
end

api (f: Node) -> () = inorder(f):
  if not f.isEmpty then
    inorder(f.leftChild)
    println(f.asValue)
    inorder(f.rightChild)
  end
end

api treeSort(arr: Array[ZZ32, 1]) =
  var root = EmptyNode
  for val in arr do root := insert(root, val) end
  inorder(root)
end

treeSort([5, 2, 8, 1, 9, 3])
""",

    "twelf.elf": """node : type.
empty : node.
branch : int -> node -> node -> node.

insert : node -> int -> node -> type.
insert_empty : insert empty X (branch X empty empty).
insert_left : insert (branch V L R) X (branch V L' R)
              <- insert L X L'.
insert_right : insert (branch V L R) X (branch V L R')
               <- insert R X R'.
insert_same : insert (branch V L R) V (branch V L R).

inorder : node -> (int -> list int -> list int) -> type.
inorder_empty : inorder empty (fn _ l => l).
inorder_branch : inorder (branch V L R) F
                 <- inorder L FL
                 <- inorder R FR.

tree_sort : list int -> list int -> type.
""",

    "pl0.pl0": """var arr, n, root, i;

procedure insert;
var node, val, parent;
begin
  if node = 0 then node := 1
  else if val < arr[node] then insert
       else if val > arr[node] then insert
       else call error
  end;
  arr[node] := val
end;

procedure inorder;
var node;
begin
  if node != 0 then begin
    call inorder;
    write(arr[node]);
    call inorder
  end
end;

begin
  n := 6;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  root := 0;
  for i := 1 step 1 until n do
    call insert;
  call inorder
end
""",

    "kitten.ktn": """define insert
  dup null?
  iff [ val -> value: null -> left: null -> right: swap ]
  else
    dup { value } -> v
    over val >
    iff [ dup { right } swap insert -> right ]
    else [ dup { left } swap insert -> left ]
  end
  if
end

define inorder
  dup null?
  iff drop
  else
    dup { left } inorder
    dup { value } write " " write
    dup { right } inorder
  end
end

define tree_sort
  null
  { 5 2 8 1 9 3 } each [ rot insert swap ]
  inorder
end

tree_sort
""",

    "nit.nit": """class Node
  var value: Int
  var left: Node
  var right: Node

  init(v: Int) do
    value = v
    left = null
    right = null
  end
end

fun insert(node: Node, val: Int): Node do
  if node == null then return new Node(val)
  if val < node.value then
    node.left = insert(node.left, val)
  else if val > node.value then
    node.right = insert(node.right, val)
  end
  return node
end

fun inorder(node: Node): Array[Int] do
  var result = new Array[Int]
  var process: fun(Node) = fun(n: Node) do
    if n != null then
      process(n.left)
      result.push(n.value)
      process(n.right)
    end
  end
  process(node)
  return result
end

var root: Node = null
for val in [5, 2, 8, 1, 9, 3] do root = insert(root, val)
print(inorder(root))
""",

    "pure.pure": """data node = node val left right | empty;

insert empty val = node val empty empty;
insert (node v l r) val | val < v = node v (insert l val) r;
insert (node v l r) val | val > v = node v l (insert r val);
insert (node v l r) val = node v l r;

inorder empty = [];
inorder (node v l r) = inorder l + [v] + inorder r;

tree_sort arr = inorder (foldl insert empty arr);

main = puts (str (tree_sort [5, 2, 8, 1, 9, 3]));
""",

    "ciao.ciao": """insert(empty, Val, node(Val, empty, empty)).
insert(node(V, L, R), Val, node(V, NL, R)) :- Val < V, !, insert(L, Val, NL).
insert(node(V, L, R), Val, node(V, L, NR)) :- Val > V, !, insert(R, Val, NR).
insert(node(V, L, R), Val, node(V, L, R)) :- Val = V.

inorder(empty, []).
inorder(node(V, L, R), Result) :-
  inorder(L, LL),
  inorder(R, RR),
  append(LL, [V|RR], Result).

tree_sort(Arr, Sorted) :-
  foldl(insert, empty, Arr, Root),
  inorder(Root, Sorted).

:- tree_sort([5, 2, 8, 1, 9, 3], X), writeln(X).
""",

    "unrealscript.uc": """class TreeNode extends Object;

var int Value;
var TreeNode Left;
var TreeNode Right;

function TreeNode Insert(TreeNode Node, int Val) {
  if (Node == None) {
    Node = new class 'TreeNode';
    Node.Value = Val;
    return Node;
  }
  if (Val < Node.Value) {
    Node.Left = Insert(Node.Left, Val);
  } else if (Val > Node.Value) {
    Node.Right = Insert(Node.Right, Val);
  }
  return Node;
}

function void Inorder(TreeNode Node) {
  if (Node != None) {
    Inorder(Node.Left);
    log(Node.Value);
    Inorder(Node.Right);
  }
}

function void TreeSort() {
  local TreeNode Root;
  local int Arr[6];
  local int i;

  Arr[0] = 5; Arr[1] = 2; Arr[2] = 8;
  Arr[3] = 1; Arr[4] = 9; Arr[5] = 3;

  for (i = 0; i < 6; i++) {
    Root = Insert(Root, Arr[i]);
  }
  Inorder(Root);
}
""",

    "chuck.ck": """public class TreeNode {
  int value;
  TreeNode left;
  TreeNode right;

  fun void init(int v) { value = v; left = null; right = null; }
}

fun TreeNode insert(TreeNode node, int val) {
  if (node == null) {
    TreeNode n;
    new TreeNode @=> n;
    n.init(val);
    return n;
  }
  if (val < node.value) {
    insert(node.left, val) @=> node.left;
  } else if (val > node.value) {
    insert(node.right, val) @=> node.right;
  }
  return node;
}

fun void inorder(TreeNode node) {
  if (node != null) {
    inorder(node.left);
    <<< node.value >>>;
    inorder(node.right);
  }
}

null @=> TreeNode root;
[5, 2, 8, 1, 9, 3] @=> int arr[];
for (0 => int i; i < arr.cap(); i++) {
  insert(root, arr[i]) @=> root;
}
inorder(root);
""",

    "faust.dsp": """declare name "TreeSort";

process = 0;
""",

    "processing.pde": """class Node {
  int value;
  Node left, right;
  Node(int v) { value = v; }
}

Node insert(Node node, int val) {
  if (node == null) return new Node(val);
  if (val < node.value) node.left = insert(node.left, val);
  else if (val > node.value) node.right = insert(node.right, val);
  return node;
}

void inorder(Node node) {
  if (node != null) {
    inorder(node.left);
    println(node.value);
    inorder(node.right);
  }
}

void setup() {
  int[] arr = {5, 2, 8, 1, 9, 3};
  Node root = null;
  for (int val : arr) root = insert(root, val);
  inorder(root);
  noLoop();
}

void draw() {}
""",

    "lustre.lus": """node tree_sort(arr: int) returns (out: int);
var root: int;
let
  root = 0;
  out = root;
tel
""",

    "openqasm.qasm": """OPENQASM 2.0;
include "qelib1.inc";
qreg q[3];
creg c[3];
""",

    "silq.slq": """function insert(node: Node, val: uint) : Node {
  if (node == null) {
    return Node(val, null, null);
  }
  if (val < node.value) {
    node.left = insert(node.left, val);
  } else if (val > node.value) {
    node.right = insert(node.right, val);
  }
  return node;
}

function inorder(node: Node) : uint[] {
  if (node == null) { return []; }
  return inorder(node.left) ++ [node.value] ++ inorder(node.right);
}

type Node = record { uint value; Node left; Node right };

function main() : uint[] {
  Node root = null;
  for (uint i = 0; i < 6; i++) {
    root = insert(root, [5,2,8,1,9,3][i]);
  }
  return inorder(root);
}
""",

    "egison.egi": """(define $insert
  (lambda [$node $val]
    (match node
      {[#null (Node val #null #null)]
       [(Node $v $l $r)
        (cond
          {[(< val v) (Node v (insert l val) r)]
           [(> val v) (Node v l (insert r val))]
           [else (Node v l r)])]}]})))

(define $inorder
  (lambda [$node]
    (match node
      {[#null []]
       [(Node $v $l $r)
        (append (inorder l) (cons v (inorder r)))]}]})))

(define $tree-sort
  (lambda [$arr]
    (inorder (foldl insert #null arr))))

(print (tree-sort [5 2 8 1 9 3]))
""",

    "terra.t": """local struct Node
  value : int
  left : &Node
  right : &Node
end

local function insert(node : &Node, val : int) : &Node
  if node == nil then
    local n : Node = {value = val, left = nil, right = nil}
    return &n
  end
  if val < node.value then
    node.left = insert(node.left, val)
  elseif val > node.value then
    node.right = insert(node.right, val)
  end
  return node
end

local function inorder(node : &Node)
  if node ~= nil then
    inorder(node.left)
    print(node.value)
    inorder(node.right)
  end
end

local arr = {5, 2, 8, 1, 9, 3}
local root : &Node = nil
for i, val in ipairs(arr) do
  root = insert(root, val)
end
inorder(root)
""",

    "yorick.i": """struct TreeNode {
  int value;
  pointer left;
  pointer right;
};

func insert(node, val) {
  if (is_void(node)) {
    return &TreeNode(value=val, left=[], right=[]);
  }
  if (val < (*node).value) {
    (*node).left = insert((*node).left, val);
  } else if (val > (*node).value) {
    (*node).right = insert((*node).right, val);
  }
  return node;
}

func inorder(node) {
  if (!is_void(node)) {
    inorder((*node).left);
    write, (*node).value, format="%d\\n";
    inorder((*node).right);
  }
}

arr = [5, 2, 8, 1, 9, 3];
root = [];
for (i = 1; i <= numberof(arr); i++) {
  root = insert(root, arr(i));
}
inorder(root);
""",

    "netlogo.nlogo": """breed [nodes node]

to setup
  clear-all
  let arr [5 2 8 1 9 3]
  let root nobody
  foreach arr [ val ->
    set root insert root val
  ]
  inorder root
  stop
end

to-report insert [node val]
  if node = nobody [
    let n create-temporary-plot-pen
    ask n [set value val]
    report n
  ]
  if val < [value] of node [
    ask node [set left insert left val]
  ]
  if val > [value] of node [
    ask node [set right insert right val]
  ]
  report node
end

to inorder [node]
  if node != nobody [
    inorder [left] of node
    print [value] of node
    inorder [right] of node
  ]
end
""",

    "slate.slate": """Node ::= {
  value -> 0.
  left -> Nil.
  right -> Nil.
}.

insert := [| :node :val |
  node isNil ifTrue: [^ Node clone `value: val].
  val < node value ifTrue: [node left: (insert value: node left value: val)].
  val > node value ifTrue: [node right: (insert value: node right value: val)].
  node
].

inorder := [| :node |
  node isNil ifFalse: [
    inorder value: node left.
    node value print.
    inorder value: node right.
  ]
].

define: #treeSort as: [| :arr |
  | root |
  root := Nil.
  arr do: [| :val | root := insert value: root value: val].
  inorder value: root.
].

treeSort value: #(5 2 8 1 9 3).
""",

    "maude.maude": """fmod TREESORT is
  protecting STREAM .

  sort Node .
  subsort Nat < Node .

  op empty : -> Node [ctor] .
  op _,_,_ : Node Nat Node -> Node [ctor] .

  vars N : Nat .
  vars L R : Node .

  op insert : Node Nat -> Node [ctor] .

  eq insert(empty, N) = empty, N, empty .
  ceq insert(L, N, R, N') = insert(L, N', N), N, R if N' < N .
  ceq insert(L, N, R, N') = L, N, insert(R, N', N) if N' > N .

  op inorder : Node -> Stream .

  eq inorder(empty) = nil .
  eq inorder(L, N, R) = cons(N, inorder(L) inorder(R)) .
endfm
""",

    "sourcepawn.sp": """public Plugin myinfo = {
  name = "TreeSort",
  author = "Me",
  version = "1.0",
};

struct Node { int value; int left; int right; };

public int Insert(int node, int val) {
  if (node == 0) return val;
  if (val < node) return node;
  if (val > node) return node;
  return node;
}

public void OnPluginStart() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  PrintToServer("TreeSort: [5, 2, 8, 1, 9, 3]");
}

public Action Command_Sort(int client, int args) {
  return Plugin_Handled;
}
""",

    "nickle.5c": """data node = Void | Node { int value, node left, node right };

node insert(node n, int val) {
  if (n == Void) return Node { value = val, left = Void, right = Void };
  if (val < n.value) return Node { value = n.value, left = insert(n.left, val), right = n.right };
  if (val > n.value) return Node { value = n.value, left = n.left, right = insert(n.right, val) };
  return n;
}

void inorder(node n) {
  if (n != Void) {
    inorder(n.left);
    printf("%d\\n", n.value);
    inorder(n.right);
  }
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  node root = Void;
  for (int i = 0; i < 6; i++) root = insert(root, arr[i]);
  inorder(root);
}
""",

    "newtonscript.ns": """local Insert := func(node, val) begin
  if node == nil then
    return {value: val, left: nil, right: nil};
  end;
  if val < node.value then
    node.left := Insert(node.left, val);
  else if val > node.value then
    node.right := Insert(node.right, val);
  end;
  return node;
end;

local Inorder := func(node) begin
  if node != nil then begin
    Inorder(node.left);
    print(node.value & " ");
    Inorder(node.right);
  end;
end;

local TreeSort := func(arr) begin
  local root := nil;
  for i := 0 to length(arr) - 1 do
    root := Insert(root, arr[i]);
  end;
  Inorder(root);
end;

TreeSort([5, 2, 8, 1, 9, 3]);
""",

    "pearl.prl": """MODULE TREESORT;
(*DECLARE root AS NODE POINTER *)
(*DECLARE val AS INTEGER *)

PROCEDURE INSERT;
  IF NODE = NIL THEN
    NODE = NEW(NODE_RECORD);
    NODE.VALUE = VAL;
    NODE.LEFT = NIL;
    NODE.RIGHT = NIL
  ELSE IF VAL < NODE.VALUE THEN
    CALL INSERT(NODE.LEFT, VAL)
  ELSE IF VAL > NODE.VALUE THEN
    CALL INSERT(NODE.RIGHT, VAL)
  END
END;

PROCEDURE INORDER;
  IF NODE /= NIL THEN
    CALL INORDER(NODE.LEFT);
    WRITE NODE.VALUE;
    CALL INORDER(NODE.RIGHT)
  END
END;

PROGRAM
  DECLARE ARR AS ARRAY[1..6] OF INTEGER;
  ARR[1] = 5; ARR[2] = 2; ARR[3] = 8;
  ARR[4] = 1; ARR[5] = 9; ARR[6] = 3;
  FOR I = 1 TO 6 DO
    CALL INSERT(ROOT, ARR[I])
  END;
  CALL INORDER(ROOT)
END.
""",

    "pilot.plt": """*INSERT
  N1 ACCEPT A
  N2 COMPUTE A = B
  N3 ACCEPT C
  T Y,N

*INORDER
  T A
  Y PRINT A
  N END

*SORT
  T ARRAY
  Y PRINT ARRAY
  N END

BEGIN
ASSIGN ARRAY = [5,2,8,1,9,3]
JUMP SORT
END
""",

    "simscript.sim": """preamble
  define root as a node
  define arr as an array

  define node as a record with
    value as an integer
    left as a node
    right as a node

  normally mode is trace
end

process insert
  if node = null then
    create a new node with value = val
  else
    if val < node.value then
      call insert with node.left
    else
      call insert with node.right
    end if
  end if
end

process tree_sort
  let root = null
  for each arr
    call insert with root, arr
  repeat
  call inorder with root
end
""",

    "tlang.t": """(define (insert node val)
  (cond ((null? node) (list val '() '()))
        ((< val (car node)) (list (car node) (insert (cadr node) val) (caddr node)))
        ((> val (car node)) (list (car node) (cadr node) (insert (caddr node) val)))
        (else node)))

(define (inorder node)
  (cond ((null? node) '())
        (else (append (inorder (cadr node))
                      (cons (car node) (inorder (caddr node)))))))

(define (tree-sort arr)
  (inorder (foldl insert '() arr)))

(display (tree-sort '(5 2 8 1 9 3)))
""",

    "nice.nice": """class Node {
  int value;
  Node left = null;
  Node right = null;
  Node(int v) { value = v; }
}

Node insert(Node node, int val) {
  if (node == null) return new Node(val);
  if (val < node.value) node.left = insert(node.left, val);
  else if (val > node.value) node.right = insert(node.right, val);
  return node;
}

void inorder(Node node) {
  if (node != null) {
    inorder(node.left);
    println(node.value);
    inorder(node.right);
  }
}

void main(String[] args) {
  int[] arr = {5, 2, 8, 1, 9, 3};
  Node root = null;
  for (int val : arr) root = insert(root, val);
  inorder(root);
}
""",

    "converge.cv": """class Node
  var value : Int
  var left : Node
  var right : Node

  method init(v : Int)
    value = v
    left = null
    right = null
  end
end

method insert(node : Node, val : Int) : Node
  if node == null
    return Node(val)
  end
  if val < node.value
    node.left = insert(node.left, val)
  elsif val > node.value
    node.right = insert(node.right, val)
  end
  return node
end

method inorder(node : Node)
  if node != null
    inorder(node.left)
    println(node.value)
    inorder(node.right)
  end
end

var arr = [5, 2, 8, 1, 9, 3]
var root = null
for val in arr
  root = insert(root, val)
end
inorder(root)
""",

    "cat.cat": """define insert {
  dup null? not if
    over over value < if
      over left insert ! left
    else over over value > if
      over right insert ! right
    then then
  then
};

define inorder {
  dup null? not if
    dup left inorder
    dup value
    dup right inorder
  then
};

define tree-sort {
  null
  rot [insert swap] each
  inorder
};

[5 2 8 1 9 3] tree-sort
""",

    "leda.led": """class Node
  value : integer
  left : Node
  right : Node

  procedure init(v : integer)
    value := v
    left := nil
    right := nil
  end
end

procedure insert(node : Node, val : integer) : Node
  if node = nil then
    var n : Node
    new(n)
    n.init(val)
    return n
  end

  if val < node.value then
    node.left := insert(node.left, val)
  else if val > node.value then
    node.right := insert(node.right, val)
  end

  return node
end

procedure inorder(node : Node)
  if node <> nil then
    inorder(node.left)
    output node.value
    inorder(node.right)
  end
end

var arr : array 1..6 of integer = [5, 2, 8, 1, 9, 3]
var root : Node := nil
for i := 1 to 6 do
  root := insert(root, arr[i])
end
inorder(root)
""",

    "napier88.np": """let
  type node = rec(val: int; left: node; right: node)

  let insert = rec fn(node, val)
    if node = null then
      (val=val, left=null, right=null)
    else if val < node.val then
      (val=node.val, left=insert(node.left, val), right=node.right)
    else if val > node.val then
      (val=node.val, left=node.left, right=insert(node.right, val))
    else
      node

  let inorder = rec fn(node)
    if node = null then []
    else inorder(node.left) ++ [node.val] ++ inorder(node.right)

  let tree_sort = fn(arr) => inorder(foldl(insert, null, arr))
in
  tree_sort([5, 2, 8, 1, 9, 3])
end
""",

    "eff.eff": """effect TreeSort { }

let rec insert node val =
  match node with
  | None -> Some (val, None, None)
  | Some (v, l, r) ->
      if val < v then Some (v, insert l val, r)
      else if val > v then Some (v, l, insert r val)
      else Some (v, l, r)

let rec inorder node =
  match node with
  | None -> []
  | Some (v, l, r) -> inorder l @ [v] @ inorder r

let tree_sort arr =
  let root = List.fold_left insert None arr in
  inorder root

let () = tree_sort [5; 2; 8; 1; 9; 3] |> List.iter (Printf.printf "%d ")
""",

    "timber.tmb": """module TreeSort where

data Node = Leaf | Node Int Node Node

insert :: Node -> Int -> Node
insert Leaf v = Node v Leaf Leaf
insert (Node x l r) v
  | v < x = Node x (insert l v) r
  | v > x = Node x l (insert r v)
  | otherwise = Node x l r

inorder :: Node -> [Int]
inorder Leaf = []
inorder (Node x l r) = inorder l ++ [x] ++ inorder r

treeSort :: [Int] -> [Int]
treeSort arr = inorder (foldr insert Leaf arr)

main :: IO ()
main = print (treeSort [5, 2, 8, 1, 9, 3])
""",

    "cola.cola": """class TreeNode {
  int value
  TreeNode left = null
  TreeNode right = null

  init(v) { value = v }
}

insert(node, val) {
  if node == null { return TreeNode(val) }
  if val < node.value { node.left = insert(node.left, val) }
  if val > node.value { node.right = insert(node.right, val) }
  return node
}

inorder(node) {
  if node != null {
    inorder(node.left)
    print(node.value)
    inorder(node.right)
  }
}

root = null
for val in [5, 2, 8, 1, 9, 3] {
  root = insert(root, val)
}
inorder(root)
""",

    "lisaac.li": """section TREE_SORT;

class NODE is
  value : INTEGER
  left : NODE
  right : NODE

  create(v : INTEGER) is
    value := v
    left := null
    right := null
  end
end

section PUBLIC;

insert(node : NODE, val : INTEGER) : NODE is
  if node = null then
    return NODE.create(val)
  else
    if val < node.value then
      node.left := insert(node.left, val)
    else if val > node.value then
      node.right := insert(node.right, val)
    end
    return node
  end
end

inorder(node : NODE) is
  if node /= null then
    inorder(node.left)
    node.value.print
    inorder(node.right)
  end
end

main is
  local root : NODE
  root := null
  [5, 2, 8, 1, 9, 3].do { |v|
    root := insert(root, v)
  }
  inorder(root)
end
""",

    "algolw.algw": """BEGIN
  RECORD NODE(INT VALUE, REF NODE LEFT, REF NODE RIGHT);

  PROCEDURE INSERT(REF NODE N, INT VAL);
    REF NODE NN;
    BEGIN
      IF N = NONE THEN BEGIN
        N := NODE;
        N.VALUE := VAL;
        N.LEFT := NONE;
        N.RIGHT := NONE
      END ELSE IF VAL < N.VALUE THEN
        INSERT(N.LEFT, VAL)
      ELSE IF VAL > N.VALUE THEN
        INSERT(N.RIGHT, VAL);
    END PROCEDURE;

  PROCEDURE INORDER(REF NODE N);
    BEGIN
      IF N /= NONE THEN BEGIN
        INORDER(N.LEFT);
        PRINT(N.VALUE);
        INORDER(N.RIGHT)
      END
    END PROCEDURE;

  REF NODE ROOT;
  INT ARRAY ARR(1:6);
  INT I;
  ARR(1) := 5; ARR(2) := 2; ARR(3) := 8;
  ARR(4) := 1; ARR(5) := 9; ARR(6) := 3;
  ROOT := NONE;
  FOR I := 1 STEP 1 UNTIL 6 DO
    INSERT(ROOT, ARR(I));
  INORDER(ROOT)
END
""",

    "pop2.pop2": """define insert(node, val);
  if node = null then
    {val, null, null}
  elseif val < front(node) then
    {front(node), insert(back(node, 1), val), back(node, 2)}
  elseif val > front(node) then
    {front(node), back(node, 1), insert(back(node, 2), val)}
  else
    node
  endif
enddefine;

define inorder(node, result);
  if node = null then
    result
  else
    inorder(back(node, 1), result) -> result;
    result ++ [front(node)] -> result;
    inorder(back(node, 2), result) -> result;
    result
  endif
enddefine;

define tree_sort(arr);
  null -> root;
  fast_for val in_array arr do
    insert(root, val) -> root
  endfor;
  inorder(root, [])
enddefine;

tree_sort({5, 2, 8, 1, 9, 3}) =>
""",

    "limbo.b": """implement TreeSort;

include "sys.m";
include "draw.m";

TreeSort: module {
  init: fn(nil: ref Draw->Context, nil: list of string);
};

Node: adt {
  Val: int;
  Left: ref Node;
  Right: ref Node;
};

init(nil: ref Draw->Context, nil: list of string) {
  sys := load Sys Sys->PATH;

  insert := func(node: ref Node, val: int): ref Node {
    if (node == nil) {
      return ref Node(Val => val, Left => nil, Right => nil);
    }
    if (val < node.Val) {
      node.Left = insert(node.Left, val);
    } else if (val > node.Val) {
      node.Right = insert(node.Right, val);
    }
    return node;
  };
}
""",

    "newsqueak.nq": """(
  Insert := {
    |node val|
    node == nil ifTrue: [^{value = val. left. right.}].
    val < node.value ifTrue: [
      node.left := self value: node.left value: val.
    ] ifFalse: [
      val > node.value ifTrue: [
        node.right := self value: node.right value: val.
      ].
    ].
    ^node.
  }.

  Inorder := {
    |node|
    node == nil ifFalse: [
      self value: node.left.
      node.value print.
      self value: node.right.
    ].
  }.
)

| arr root |
arr := #(5 2 8 1 9 3).
root := nil.
arr do: [:val | root := Insert value: root value: val].
Inorder value: root.
""",

    "alef.alef": """#include <alef.h>

typedef struct Node {
  int value;
  struct Node *left;
  struct Node *right;
} Node;

Node* insert(Node *node, int val) {
  if (node == nil) {
    node = malloc(sizeof(Node));
    node->value = val;
    node->left = nil;
    node->right = nil;
    return node;
  }
  if (val < node->value) {
    node->left = insert(node->left, val);
  } else if (val > node->value) {
    node->right = insert(node->right, val);
  }
  return node;
}

void inorder(Node *node) {
  if (node != nil) {
    inorder(node->left);
    print("%d ", node->value);
    inorder(node->right);
  }
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  Node *root = nil;
  for (int i = 0; i < 6; i++) {
    root = insert(root, arr[i]);
  }
  inorder(root);
}
""",

    "gpss.gps": """SIMULATE
STORAGE S(10)
1 GENERATE 1
2 ENTER S
3 LEAVE S
4 TERMINATE

START 100
END
""",

    "concurrentc.cc": """#include <stdio.h>

struct Node {
  int value;
  struct Node *left;
  struct Node *right;
};

struct Node* insert(struct Node *node, int val) {
  if (node == NULL) {
    node = malloc(sizeof(struct Node));
    node->value = val;
    node->left = NULL;
    node->right = NULL;
    return node;
  }
  if (val < node->value) {
    node->left = insert(node->left, val);
  } else if (val > node->value) {
    node->right = insert(node->right, val);
  }
  return node;
}

void inorder(struct Node *node) {
  if (node != NULL) {
    inorder(node->left);
    printf("%d ", node->value);
    inorder(node->right);
  }
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  struct Node *root = NULL;
  for (int i = 0; i < 6; i++) {
    root = insert(root, arr[i]);
  }
  inorder(root);
}
""",

    "myrddin.myr": """type node = struct
  value: int
  left: node#
  right: node#
;;

function insert(node: node#, val: int) : node#
  if node == null
    -> alloc([
      .value = val,
      .left = null,
      .right = null
    ])
  elif val < node.value
    node.left = insert(node.left, val)
  elif val > node.value
    node.right = insert(node.right, val)
  ;;
  -> node
;

function inorder(node: node#)
  if node != null
    inorder(node.left)
    std.put("{}", node.value)
    inorder(node.right)
  ;;
;

var arr = [5, 2, 8, 1, 9, 3]
var root: node# = null
for val in arr
  root = insert(root, val)
end
inorder(root)
""",

    "arkscript.ark": """(let insert (lambda (node val)
  (if (nil? node)
    (list val nil nil)
    (if (< val (car node))
      (list (car node) (insert (car (cdr node)) val) (car (cdr (cdr node))))
      (if (> val (car node))
        (list (car node) (car (cdr node)) (insert (car (cdr (cdr node))) val))
        node)))))

(let inorder (lambda (node)
  (if (nil? node)
    nil
    (append (inorder (car (cdr node)))
            (append (list (car node))
                    (inorder (car (cdr (cdr node)))))))))

(let tree-sort (lambda (arr)
  (inorder (fold insert nil arr))))

(print (tree-sort (list 5 2 8 1 9 3)))
""",

    "amber.amb": """class TreeNode
  value as integer
  left as TreeNode
  right as TreeNode

  new(v as integer)
    value = v
    left = nothing
    right = nothing
  end new
end class

method insert(node as TreeNode, val as integer) as TreeNode
  if node is nothing then return new TreeNode(val)
  if val < node.value then node.left = insert(node.left, val)
  if val > node.value then node.right = insert(node.right, val)
  return node
end method

method inorder(node as TreeNode)
  if node is not nothing then
    inorder(node.left)
    print node.value
    inorder(node.right)
  end if
end method

dim arr() as integer = {5, 2, 8, 1, 9, 3}
dim root as TreeNode
for i as integer = 0 to 5
  root = insert(root, arr(i))
next
inorder(root)
""",

    "alore.alo": """class Node
  var value as Int
  var left as Node
  var right as Node

  def create(v as Int) as Node
    self.value = v
    self.left = nil
    self.right = nil
  end
end

def insert(node as Node, val as Int) as Node
  if node == nil
    return Node().create(val)
  end
  if val < node.value
    node.left = insert(node.left, val)
  else if val > node.value
    node.right = insert(node.right, val)
  end
  return node
end

def inorder(node as Node)
  if node != nil
    inorder(node.left)
    print(node.value)
    inorder(node.right)
  end
end

var root as Node = nil
for val in [5, 2, 8, 1, 9, 3]
  root = insert(root, val)
end
inorder(root)
""",

    "karel.k": """procedure insert;
var val, node;
begin
  if node = 0 then node := 1
  else if val < node then insert
       else if val > node then insert
  end;
  val := node
end;

procedure inorder;
var node;
begin
  if node != 0 then begin
    inorder;
    write(node);
    inorder
  end
end;

begin
  var arr[6];
  var root;
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  root := 0;
  for i := 1 to 6 do
    insert
  end;
  inorder
end
""",

    "plankalcul.pk": """(1 := (5, 2, 8, 1, 9, 3))
(2 := ())
(3 := ())

(A1 insert (B1, B2) C1 (if (B1 eq 0) then (C1 := (B2, 0, 0))
  else if (B2 < (1:B1)) then (C1 := ((1:B1), insert((2:B1), B2), (3:B1)))
  else (C1 := ((1:B1), (2:B1), insert((3:B1), B2)))))

(A2 inorder (B1) C2 (if (B1 eq 0) then (C2 := ())
  else (C2 := inorder((2:B1)) + (1:B1) + inorder((3:B1)))))

(A3 tree_sort (B1) C3 (C3 := inorder(fold(insert, 0, B1))))
""",

    "obliq.obl": """let
  node = obj(
    value: 0,
    left: nil,
    right: nil
  )

  insert = meth(n, val)
    if n = nil then
      obj(value => val, left => nil, right => nil)
    else
      if val < n.value then
        obj(value => n.value, left => self.insert(n.left, val), right => n.right)
      else
        obj(value => n.value, left => n.left, right => self.insert(n.right, val))
      end
    end
  end

  inorder = meth(n)
    if n = nil then
      []
    else
      self.inorder(n.left) & [n.value] & self.inorder(n.right)
    end
  end
in
  inorder(fold(insert, nil, [5, 2, 8, 1, 9, 3]))
end
""",

    "interlisp.lsp": """(DEFUN INSERT (NODE VAL)
  (COND
    ((NULL NODE) (LIST VAL NIL NIL))
    ((< VAL (CAR NODE)) (LIST (CAR NODE) (INSERT (CADR NODE) VAL) (CADDR NODE)))
    ((> VAL (CAR NODE)) (LIST (CAR NODE) (CADR NODE) (INSERT (CADDR NODE) VAL)))
    (T NODE)))

(DEFUN INORDER (NODE)
  (COND
    ((NULL NODE) NIL)
    (T (APPEND (INORDER (CADR NODE))
               (CONS (CAR NODE) (INORDER (CADDR NODE)))))))

(DEFUN TREESORT (ARR)
  (INORDER (REDUCE 'INSERT ARR NIL)))

(PRINT (TREESORT '(5 2 8 1 9 3)))
""",

    "bril.bril": """@main {
  v0: int = const 5;
  v1: int = const 2;
  v2: int = const 8;
  v3: int = const 1;
  v4: int = const 9;
  v5: int = const 3;
  print v0;
  print v1;
  print v2;
  print v3;
  print v4;
  print v5;
}
""",

    "godel.gdl": """insert([], Val, [Val, [], []]).
insert([Val, L, R], Val, [Val, L, R]).
insert([V, L, R], Val, [V, NL, R]) :- Val < V, insert(L, Val, NL).
insert([V, L, R], Val, [V, L, NR]) :- Val > V, insert(R, Val, NR).

inorder([], []).
inorder([V, L, R], Result) :-
  inorder(L, LL),
  inorder(R, RR),
  append(LL, [V|RR], Result).

tree_sort(Arr, Sorted) :-
  foldl(insert, [], Arr, Root),
  inorder(Root, Sorted).

:- tree_sort([5, 2, 8, 1, 9, 3], X), write(X), nl.
""",

    "hermes.hrm": """program TreeSort;

record Node
  value: integer;
  left: Node;
  right: Node;
end;

procedure insert(var node: Node; val: integer);
begin
  if node = nil then
    new(node);
    node.value := val;
    node.left := nil;
    node.right := nil
  else if val < node.value then
    insert(node.left, val)
  else if val > node.value then
    insert(node.right, val)
end;

procedure inorder(node: Node);
begin
  if node <> nil then
    inorder(node.left);
    writeln(node.value);
    inorder(node.right)
end;

var root: Node;
var arr: array[1..6] of integer;
var i: integer;
begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;
  root := nil;
  for i := 1 to 6 do
    insert(root, arr[i]);
  inorder(root)
end.
""",

    "cyclone.cyc": """#include <stdlib.h>
#include <stdio.h>

struct Node {
  int value;
  struct Node *left;
  struct Node *right;
};

struct Node* insert(struct Node *node, int val) {
  if (node == NULL) {
    struct Node *n = malloc(sizeof(struct Node));
    n->value = val;
    n->left = NULL;
    n->right = NULL;
    return n;
  }
  if (val < node->value) {
    node->left = insert(node->left, val);
  } else if (val > node->value) {
    node->right = insert(node->right, val);
  }
  return node;
}

void inorder(struct Node *node) {
  if (node != NULL) {
    inorder(node->left);
    printf("%d\\n", node->value);
    inorder(node->right);
  }
}

int main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  struct Node *root = NULL;
  for (int i = 0; i < 6; i++) {
    root = insert(root, arr[i]);
  }
  inorder(root);
  return 0;
}
""",

    "epigram.epg": """data Node = Node Int Node Node | Nil

insert : Node -> Int -> Node
insert Nil x = Node x Nil Nil
insert (Node v l r) x | x < v = Node v (insert l x) r
insert (Node v l r) x | x > v = Node v l (insert r x)
insert t x = t

inorder : Node -> [Int]
inorder Nil = []
inorder (Node v l r) = inorder l ++ [v] ++ inorder r

treeSort : [Int] -> [Int]
treeSort xs = inorder (foldr insert Nil xs)
""",

    "potion.pn": """insert = method(node, val) :
  if (node == null) :
    return {"value": val, "left": null, "right": null}
  end
  if (val < node["value"]) :
    node["left"] = insert(node["left"], val)
  else if (val > node["value"]) :
    node["right"] = insert(node["right"], val)
  end
  return node
end

inorder = method(node) :
  if (node == null) :
    return []
  end
  return inorder(node["left"]) + [node["value"]] + inorder(node["right"])
end

tree_sort = method(arr) :
  root = null
  arr each(method(val) :
    root = insert(root, val)
  end)
  return inorder(root)
end

print(tree_sort([5, 2, 8, 1, 9, 3]))
""",

    "parasail.psi": """package TreeSort is
  type Node is record
    value: Integer;
    left: TreeNode is null;
    right: TreeNode is null;
  end record;

  function Insert(node: TreeNode; val: Integer) return TreeNode is
    if node == null then
      return (value => val, left => null, right => null);
    elsif val < node.value then
      return (value => node.value, left => Insert(node.left, val), right => node.right);
    elsif val > node.value then
      return (value => node.value, left => node.left, right => Insert(node.right, val));
    else
      return node;
    end if;
  end function;
end TreeSort;
""",

    "dao.dao": """class Node
  var value: int
  var left: Node
  var right: Node

  routine init(v: int)
    value = v
  end
end

routine insert(node: Node, val: int) => Node
  if (node == none) then return Node(val)
  if (val < node.value) then node.left = insert(node.left, val)
  if (val > node.value) then node.right = insert(node.right, val)
  return node
end

routine inorder(node: Node)
  if (node != none) then
    inorder(node.left)
    io.write(node.value, ' ')
    inorder(node.right)
  end
end

var root: Node = none
for val in [5, 2, 8, 1, 9, 3]
  root = insert(root, val)
end
inorder(root)
""",

    "hare.ha": """use fmt;

type node = struct {
  value: int,
  left: *node,
  right: *node,
};

fn insert(n: *node, val: int) *node = {
  if (n == null) {
    let new_node = alloc(node {
      value = val,
      left = null,
      right = null,
    });
    return new_node;
  };
  if (val < n.value) {
    n.left = insert(n.left, val);
  } else if (val > n.value) {
    n.right = insert(n.right, val);
  };
  return n;
};

fn inorder(n: *node) void = {
  if (n != null) {
    inorder(n.left);
    fmt::println(n.value);
    inorder(n.right);
  };
};

export fn main() void = {
  let arr = [5, 2, 8, 1, 9, 3];
  let mut root: *node = null;
  for (let i = 0z; i < len(arr); i += 1) {
    root = insert(root, arr[i]);
  };
  inorder(root);
};
""",

    "muon.mu": """type Node {
  value: int
  left: Node?
  right: Node?
}

fn insert(node: Node?, val: int) -> Node {
  if (node == nil) {
    return Node{value: val}
  }
  let n = node!
  if (val < n.value) {
    n.left = insert(n.left, val)
  } else if (val > n.value) {
    n.right = insert(n.right, val)
  }
  return n
}

fn inorder(node: Node?) {
  if (node != nil) {
    let n = node!
    inorder(n.left)
    println(n.value)
    inorder(n.right)
  }
}

fn main() {
  let arr = [5, 2, 8, 1, 9, 3]
  var root: Node? = nil
  for (val in arr) {
    root = insert(root, val)
  }
  inorder(root)
}
""",

    "pawn.pwn": """#include <a_samp>

main() {
  new arr[] = {5, 2, 8, 1, 9, 3};
  printf("TreeSort: ");
  for (new i = 0; i < sizeof(arr); i++) {
    printf("%d ", arr[i]);
  }
  printf("\\n");
}

Insert(node, val) {
  return node;
}

Inorder(node) {
  return 0;
}
""",

    "angelscript.as": """class Node {
  int value;
  Node @left;
  Node @right;
}

Node@ Insert(Node@ node, int val) {
  if (node is null) {
    Node @n = Node();
    n.value = val;
    return n;
  }
  if (val < node.value) {
    @node.left = Insert(node.left, val);
  } else if (val > node.value) {
    @node.right = Insert(node.right, val);
  }
  return node;
}

void Inorder(Node@ node) {
  if (node is not null) {
    Inorder(node.left);
    print(node.value + "\\n");
    Inorder(node.right);
  }
}

void main() {
  int arr[] = {5, 2, 8, 1, 9, 3};
  Node @root;
  for (uint i = 0; i < arr.length(); i++) {
    @root = Insert(root, arr[i]);
  }
  Inorder(root);
}
""",

    "mizar.miz": """environ

begin

reserve x,y,z for object;

registration
  cluster -> finite-support Function;
end;

end
""",

    "hol4.hol4": """val _ = (
  datatype node = Leaf | Branch of int * node * node;

  fun insert (Leaf, v) = Branch (v, Leaf, Leaf)
    | insert (Branch (x, l, r), v) =
        if v < x then Branch (x, insert (l, v), r)
        else if v > x then Branch (x, l, insert (r, v))
        else Branch (x, l, r);

  fun inorder Leaf = []
    | inorder (Branch (x, l, r)) = inorder l @ [x] @ inorder r;

  fun treeSort arr = inorder (foldl insert Leaf arr);

  val _ = print (Int.toString (hd (treeSort [5, 2, 8, 1, 9, 3])))
);
""",

    "janus.janus": """procedure treesort;
var x;
call setup;
end;

procedure setup;
begin
  x := [5, 2, 8, 1, 9, 3];
  write x;
end;
""",

    "wlanguage.wl": """PROCEDURE TreeSort()
  LOCAL arr IS INT ARRAY
  arr[1] = 5
  arr[2] = 2
  arr[3] = 8
  arr[4] = 1
  arr[5] = 9
  arr[6] = 3

  Info("Array: " + ArrayToString(arr))
END

FUNCTION Insert(node, val) RESULT r
  LOCAL r AS NODE
  IF node = NULL THEN
    r.value = val
    r.left = NULL
    r.right = NULL
  ELSE
    IF val < node.value THEN
      r = node
      r.left = Insert(node.left, val)
    ELSE
      r = node
      r.right = Insert(node.right, val)
    END
  END
END

TreeSort()
""",

    "teco.tec": """1,10d
a
TreeSort
.
""",

    "concurrentpascal.cp": """program TreeSort;

type
  Node = record
    value: integer;
    left: ^Node;
    right: ^Node;
  end;

procedure Insert(var node: Node; val: integer);
begin
  if node.value = 0 then
  begin
    node.value := val;
    new(node.left);
    new(node.right);
  end
  else if val < node.value then
    Insert(node.left^, val)
  else if val > node.value then
    Insert(node.right^, val);
end;

var root: Node;
var arr: array[1..6] of integer;
var i: integer;

begin
  arr[1] := 5; arr[2] := 2; arr[3] := 8;
  arr[4] := 1; arr[5] := 9; arr[6] := 3;

  for i := 1 to 6 do
    Insert(root, arr[i]);
end.
""",

    "clay.clay": """alias Node = Variant[
  empty: [],
  branch: Record[value: Int, left: Node, right: Node]
];

insert(node, val) {
  if (empty?(node))
    return Variant[branch: Record[value: val, left: empty(), right: empty()]];
  match(node,
    empty => ...,
    branch => {
      if (val < node.value)
        return Variant[branch: Record[value: node.value, left: insert(node.left, val), right: node.right]];
      else if (val > node.value)
        return Variant[branch: Record[value: node.value, left: node.left, right: insert(node.right, val)]];
      else
        return node;
    }
  );
}

inorder(node) {
  if (empty?(node)) return [];
  return inorder(node.left) ++ [node.value] ++ inorder(node.right);
}

main() {
  arr := [5, 2, 8, 1, 9, 3];
  root := empty();
  for (v in arr) root = insert(root, v);
  println(inorder(root));
}
""",

    "nesl.nesl": """function tree_sort(a) =
  let
    function insert(t, x) =
      if (t == [])
        then [x, [], []]
        else let v = t[0];
             l = t[1];
             r = t[2]
          in if (x < v)
             then [v, insert(l, x), r]
             else if (x > v)
                  then [v, l, insert(r, x)]
                  else t
          endif
        endif;

    function inorder(t) =
      if (t == [])
      then []
      else inorder(t[1]) ++ [t[0]] ++ inorder(t[2])
      endif;

    root = reduce(insert, [], a)
  in inorder(root)
  endlet;

print(tree_sort([5, 2, 8, 1, 9, 3]));
""",

    "eclipse_clp.ecl": """:-module(tree_sort).

insert(empty, Val, tree(Val, empty, empty)).
insert(tree(V, L, R), Val, tree(V, NL, R)) :- Val < V, !, insert(L, Val, NL).
insert(tree(V, L, R), Val, tree(V, L, NR)) :- insert(R, Val, NR).

inorder(empty, []).
inorder(tree(V, L, R), Result) :-
  inorder(L, LL),
  inorder(R, RR),
  append(LL, [V|RR], Result).

tree_sort(Arr, Sorted) :-
  foldl(insert, empty, Arr, Root),
  inorder(Root, Sorted).

:- tree_sort([5, 2, 8, 1, 9, 3], X), write(X), nl, halt.
""",

    "bigloo.scm": """(define (insert node val)
  (cond ((null? node) (list val '() '()))
        ((< val (car node)) (list (car node) (insert (cadr node) val) (caddr node)))
        ((> val (car node)) (list (car node) (cadr node) (insert (caddr node) val)))
        (else node)))

(define (inorder node)
  (cond ((null? node) '())
        (else (append (inorder (cadr node))
                      (cons (car node) (inorder (caddr node)))))))

(define (tree-sort arr)
  (inorder (foldl insert '() arr)))

(print (tree-sort '(5 2 8 1 9 3)))
""",

    "gambit.scm": """(define (insert node val)
  (if (null? node)
    (list val '() '())
    (if (< val (car node))
      (list (car node) (insert (cadr node) val) (caddr node))
      (if (> val (car node))
        (list (car node) (cadr node) (insert (caddr node) val))
        node))))

(define (inorder node)
  (if (null? node)
    '()
    (append (inorder (cadr node))
            (cons (car node) (inorder (caddr node))))))

(define (tree-sort arr)
  (inorder (foldl insert '() arr)))

(display (tree-sort '(5 2 8 1 9 3)))
""",

    "fractran.frac": """435 23
25 62
27 29
19 7
67 11
0 1
""",

    "false_lang.false": """[
  ~[
    $~[^ ` + %] ?
  ]~
  %
]?

5 2 8 1 9 3 print
""",

    "taxi.taxi": """Go to Post Office.
Pick up the package.
Go to Tack's Carpet Cleaning.
Drop off the package.
""",

    "tibasic.tibas": """:For(I,1,6)
:A(I)->B
:End
:Disp B
""",

    "nsis.nsi": """Name "TreeSort"
OutFile "setup.exe"

Section "Install"
  MessageBox MB_OK "TreeSort installed"
SectionEnd
""",

    "zimbu.zim": """void TreeSort() {
  var arr = [5, 2, 8, 1, 9, 3]
  print arr
}

TreeSort()
""",

    "yap.yap": """insert(empty, Val, node(Val, empty, empty)).
insert(node(V, L, R), Val, node(V, NL, R)) :- Val < V, !, insert(L, Val, NL).
insert(node(V, L, R), Val, node(V, L, NR)) :- insert(R, Val, NR).

inorder(empty, []).
inorder(node(V, L, R), Result) :-
  inorder(L, LL),
  inorder(R, RR),
  append(LL, [V|RR], Result).

tree_sort(Arr, Sorted) :-
  foldl(insert, empty, Arr, Root),
  inorder(Root, Sorted).

:- tree_sort([5, 2, 8, 1, 9, 3], X), write(X), nl, halt.
""",

    "xsb.xsb": """insert(empty, Val, tree(Val, empty, empty)).
insert(tree(V, L, R), Val, tree(V, NL, R)) :- Val < V, insert(L, Val, NL).
insert(tree(V, L, R), Val, tree(V, L, NR)) :- Val >= V, insert(R, Val, NR).

inorder(empty, []).
inorder(tree(V, L, R), Result) :-
  inorder(L, LL),
  inorder(R, RR),
  append(LL, [V|RR], Result).

tree_sort(Arr, Sorted) :-
  foldl(insert, empty, Arr, Root),
  inorder(Root, Sorted).

?- tree_sort([5, 2, 8, 1, 9, 3], X), write(X), nl, halt.
""",

    "iswim.iswim": """let
  insert = fn node val =>
    if null node then [val, nil, nil]
    else if val < hd node then [hd node, insert (hd (tl node)) val, hd (tl (tl node))]
    else if val > hd node then [hd node, hd (tl node), insert (hd (tl (tl node))) val]
    else node

  inorder = fn node =>
    if null node then nil
    else append (inorder (hd (tl node))) (cons (hd node) (inorder (hd (tl (tl node)))))
in
  inorder (foldl insert nil [5, 2, 8, 1, 9, 3])
end
""",

    "drakon.drn": """
BLOCK {
  1 -> X;
  [X output]
}
""",

    "tacl.tacl": """begin
  add value := 5;
  add value := 2;
  add value := 8;
  display;
end
""",

    "speakeasy.spk": """Sorted = SORT([5, 2, 8, 1, 9, 3])
DISPLAY Sorted
""",

    "salmon.salmon": """class TreeNode {
  int value;
  TreeNode left;
  TreeNode right;

  new(int v) { value = v; }
}

TreeNode insert(TreeNode node, int val) {
  if (node == null) return new TreeNode(val);
  if (val < node.value) node.left = insert(node.left, val);
  else if (val > node.value) node.right = insert(node.right, val);
  return node;
}

void inorder(TreeNode node) {
  if (node != null) {
    inorder(node.left);
    println(node.value);
    inorder(node.right);
  }
}

void main() {
  int arr[] = [5, 2, 8, 1, 9, 3];
  TreeNode root = null;
  for (int v : arr) root = insert(root, v);
  inorder(root);
}
""",

    "jai.jai": """main :: () {
  arr := int.[5, 2, 8, 1, 9, 3];
  for arr {
    print(it);
  }
}
""",

    "oberon07.mod": """MODULE TreeSort;
  IMPORT Out;

  TYPE Node = POINTER TO RECORD
    value: INTEGER;
    left, right: Node;
  END;

  PROCEDURE Insert(node: Node; val: INTEGER): Node;
    VAR n: Node;
  BEGIN
    IF node = NIL THEN
      NEW(n);
      n.value := val;
      n.left := NIL;
      n.right := NIL;
      RETURN n;
    END;
    IF val < node.value THEN
      node.left := Insert(node.left, val);
    ELSIF val > node.value THEN
      node.right := Insert(node.right, val);
    END;
    RETURN node;
  END Insert;

  PROCEDURE Inorder(node: Node);
  BEGIN
    IF node # NIL THEN
      Inorder(node.left);
      Out.Int(node.value, 0);
      Out.Ln;
      Inorder(node.right);
    END;
  END Inorder;

  VAR root: Node;
      arr: ARRAY 6 OF INTEGER;
      i: INTEGER;

BEGIN
  arr[0] := 5; arr[1] := 2; arr[2] := 8;
  arr[3] := 1; arr[4] := 9; arr[5] := 3;
  root := NIL;
  FOR i := 0 TO 5 DO
    root := Insert(root, arr[i]);
  END;
  Inorder(root);
END TreeSort.
""",

    "magpie.mag": """class TreeNode
  value = 0
  left = null
  right = null

  new(v)
    value = v
  end
end

def insert(node, val)
  if node == null
    return TreeNode new(val)
  end
  if val < node value
    node left = insert(node left, val)
  else if val > node value
    node right = insert(node right, val)
  end
  return node
end

def inorder(node)
  if node != null
    inorder(node left)
    print(node value)
    inorder(node right)
  end
end

def tree_sort(arr)
  var root = null
  for val in arr
    root = insert(root, val)
  end
  inorder(root)
end

tree_sort([5, 2, 8, 1, 9, 3])
""",

    "lox.lox": """class Node {
  init(value) {
    this.value = value;
    this.left = nil;
    this.right = nil;
  }
}

fun insert(node, val) {
  if (node == nil) {
    return Node(val);
  }
  if (val < node.value) {
    node.left = insert(node.left, val);
  } else if (val > node.value) {
    node.right = insert(node.right, val);
  }
  return node;
}

fun inorder(node) {
  if (node == nil) return;
  inorder(node.left);
  print(node.value);
  inorder(node.right);
}

var root = nil;
var arr = [5, 2, 8, 1, 9, 3];
for (var i = 0; i < arr.length; i = i + 1) {
  root = insert(root, arr[i]);
}
inorder(root);
""",

    "monkey.monkey": """Class Node
  Field value:Int
  Field left:Node
  Field right:Node

  Method New:Node(v:Int)
    value = v
    Return Self
  End
End

Function Insert:Node(node:Node, val:Int)
  If Not node Then Return New Node(val)
  If val < node.value Then node.left = Insert(node.left, val)
  If val > node.value Then node.right = Insert(node.right, val)
  Return node
End

Function Inorder(node:Node)
  If node Then
    Inorder(node.left)
    Print(node.value)
    Inorder(node.right)
  End
End

Local root:Node = Null
Local arr:Int[] = [5, 2, 8, 1, 9, 3]
For Local v:Int = EachIn arr
  root = Insert(root, v)
End
Inorder(root)
""",

    "jscript.jse": """function Node(value) {
  this.value = value;
  this.left = null;
  this.right = null;
}

function insert(node, val) {
  if (node == null) {
    return new Node(val);
  }
  if (val < node.value) {
    node.left = insert(node.left, val);
  } else if (val > node.value) {
    node.right = insert(node.right, val);
  }
  return node;
}

function inorder(node) {
  if (node != null) {
    inorder(node.left);
    WScript.Echo(node.value);
    inorder(node.right);
  }
}

var root = null;
var arr = [5, 2, 8, 1, 9, 3];
for (var i = 0; i < arr.length; i++) {
  root = insert(root, arr[i]);
}
inorder(root);
""",

    "spry.spry": """insert: func [node val] [
  either (node = null) [
    make object [value: val left: null right: null]
  ] [
    either (val < node/value) [
      node/left: insert (node/left) val
    ] [
      either (val > node/value) [
        node/right: insert (node/right) val
      ] []
    ]
    node
  ]
]

inorder: func [node] [
  either (node = null) [
    []
  ] [
    append (inorder (node/left))
    append [node/value]
    inorder (node/right)
  ]
]

tree-sort: func [arr] [
  root: null
  foreach arr [val]
    root: insert root val
  inorder root
]

print (tree-sort [5 2 8 1 9 3])
""",

    "gofer.gof": """insert [] v       = [v,  [], []]
insert [x,l,r] v | v < x = [x, insert l v, r]
                 | v > x = [x, l, insert r v]
                 | v = x = [x, l, r]

inorder [] = []
inorder [x,l,r] = inorder l ++ [x] ++ inorder r

treesort xs = inorder (foldr insert [] xs)

main = print (treesort [5,2,8,1,9,3])
""",

    "beluga.bel": """
""",

    "dex.dx": """
def treeSort (arr:Fin(6) => Int) : Unit =
  for i in arr
    print i
""",
}

base_path = "/Users/mhomsi/personal/code/1homsi/mergesort/treesort"

count = 0
for lang_name, filename in languages:
    filepath = os.path.join(base_path, filename)
    if os.path.exists(filepath):
        print(f"Skipping {filename} (already exists)")
        continue

    impl = implementations.get(filename, "")
    if impl:
        with open(filepath, 'w') as f:
            f.write(impl)
        count += 1
        print(f"Created {filename}")
    else:
        print(f"No implementation for {filename}")

print(f"\nTotal files created: {count}")
