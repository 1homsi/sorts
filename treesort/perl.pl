sub insert {
    my ($node, $val) = @_;
    return { val => $val, left => undef, right => undef } unless defined $node;
    if ($val < $node->{val}) { $node->{left} = insert($node->{left}, $val); }
    else { $node->{right} = insert($node->{right}, $val); }
    return $node;
}

sub inorder {
    my ($node, $result) = @_;
    return unless defined $node;
    inorder($node->{left}, $result);
    push @$result, $node->{val};
    inorder($node->{right}, $result);
}

sub treesort {
    my @arr = @_;
    my $root = undef;
    for my $val (@arr) { $root = insert($root, $val); }
    my @result;
    inorder($root, \@result);
    return @result;
}

print join(" ", treesort(5, 3, 7, 1, 4, 6, 8)), "\n";
