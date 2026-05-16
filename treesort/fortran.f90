module tree_mod
  implicit none
  type :: Node
    integer :: val
    integer :: left = 0
    integer :: right = 0
  end type
  type(Node), dimension(100) :: nodes
  integer :: node_count = 0
contains
  recursive subroutine insert(idx, v)
    integer, intent(inout) :: idx
    integer, intent(in) :: v
    if (idx == 0) then
      node_count = node_count + 1
      idx = node_count
      nodes(idx)%val = v
      nodes(idx)%left = 0
      nodes(idx)%right = 0
    else if (v < nodes(idx)%val) then
      call insert(nodes(idx)%left, v)
    else
      call insert(nodes(idx)%right, v)
    end if
  end subroutine

  recursive subroutine inorder(idx)
    integer, intent(in) :: idx
    if (idx == 0) return
    call inorder(nodes(idx)%left)
    write(*,'(I3)', advance='no') nodes(idx)%val
    call inorder(nodes(idx)%right)
  end subroutine
end module

program treesort
  use tree_mod
  integer :: arr(7) = [5, 3, 7, 1, 4, 6, 8]
  integer :: root = 0, i
  do i = 1, 7
    call insert(root, arr(i))
  end do
  call inorder(root)
  write(*,*)
end program
