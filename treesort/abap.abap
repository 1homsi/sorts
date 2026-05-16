REPORT treesort.

TYPES: BEGIN OF ty_node,
         val   TYPE i,
         left  TYPE i,
         right TYPE i,
       END OF ty_node.

DATA: lt_nodes TYPE STANDARD TABLE OF ty_node,
      ls_node  TYPE ty_node,
      lv_root  TYPE i VALUE 0,
      lt_arr   TYPE STANDARD TABLE OF i,
      lt_result TYPE STANDARD TABLE OF i.

FORM insert USING iv_idx TYPE i iv_val TYPE i CHANGING cv_idx TYPE i.
  IF iv_idx = 0.
    ls_node-val = iv_val.
    ls_node-left = 0.
    ls_node-right = 0.
    APPEND ls_node TO lt_nodes.
    cv_idx = lines( lt_nodes ).
  ELSE.
    READ TABLE lt_nodes INDEX iv_idx INTO ls_node.
    IF iv_val < ls_node-val.
      PERFORM insert USING ls_node-left iv_val CHANGING ls_node-left.
    ELSE.
      PERFORM insert USING ls_node-right iv_val CHANGING ls_node-right.
    ENDIF.
    MODIFY lt_nodes FROM ls_node INDEX iv_idx.
    cv_idx = iv_idx.
  ENDIF.
ENDFORM.

FORM inorder USING iv_idx TYPE i.
  IF iv_idx = 0. RETURN. ENDIF.
  READ TABLE lt_nodes INDEX iv_idx INTO ls_node.
  PERFORM inorder USING ls_node-left.
  APPEND ls_node-val TO lt_result.
  PERFORM inorder USING ls_node-right.
ENDFORM.

START-OF-SELECTION.
  APPEND 5 TO lt_arr. APPEND 3 TO lt_arr. APPEND 7 TO lt_arr.
  APPEND 1 TO lt_arr. APPEND 4 TO lt_arr. APPEND 6 TO lt_arr.
  APPEND 8 TO lt_arr.
  LOOP AT lt_arr INTO DATA(lv_val).
    PERFORM insert USING lv_root lv_val CHANGING lv_root.
  ENDLOOP.
  PERFORM inorder USING lv_root.
  LOOP AT lt_result INTO DATA(lv_r).
    WRITE: / lv_r.
  ENDLOOP.
