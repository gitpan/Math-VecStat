# $Id: VecStat.pm,v 1.4 1996/02/20 07:53:10 willijar Exp $
=head1 NAME

    Math::VecStat - Some basic numeric stats on vectors

=head1 SYNOPSIS

    use Math::VecStat qw(max min maxabs minabs sum average);
    $max=max(@vector);
    $max=max(\@vector);
    ($max,$imax)=max(@vector);
    ($max,$imax)=max(\@vector);
    $min=min(@vector);
    $min=min(\@vector);
    ($max,$imin)=min(@vector);
    ($max,$imin)=min(\@vector);
    $max=maxabs(@vector);
    $max=maxabs(\@vector);
    ($max,$imax)=maxabs(@vector);
    ($max,$imax)=maxabs(\@vector);
    $min=minabs(@vector);
    $min=minabs(\@vector);
    ($max,$imin)=minabs(@vector);
    ($max,$imin)=minabs(\@vector);
    $sum=sum($v1,$v2,...);
    $sum=sum(@vector);
    $sum=sum(\@vector);
    $average=average($v1,$v2,...);
    $av=average(@vector);
    $av=average(\@vector);

=head1 DESCRIPTION

    This package procides some basic statistics on numerical
vectors. All the subroutines can take a copy of the vector, or,
preferably for efficiency, a reference to the vector to be operated
on.

=over 5

=item  max(@vector), max(\@vector)

return the maximum value of given values or vector. In an array
context returns the value and the index in the array where it
occurs.

=item min(@vector), min(\@vector)

return the minimum value of given values or vector, In an array
context returns the value and the index in the array where it
occurs.


=item maxabs(@vector), maxabs(\@vector)

return the maximum value of absolute of the given values or vector. In
an array context returns the value and the index in the array where it
occurs.

=item minabs(@vector), minabs(\@vector)

return the minimum value of the absolute of the given values or
vector, In an array context returns the value and the index in the
array where it occurs.

=item sum($v1,$v2,...), sum(@vector), sum(\@vector)

return the sum of the given values or vector

=item average($v1,$v2,..), average(@vector), average(\@vector)

return the average of the given values or vector

=head1 HISTORY

 $Log: VecStat.pm,v $
 Revision 1.4  1996/02/20 07:53:10  willijar
 Added ability to return index in array contex to max and min
 functions. Added minabs and maxabs functions.
 Thanks to Mark Borges <mdb@cdc.noaa.gov> for these suggestions.

 Revision 1.3  1996/01/06 11:03:30  willijar
 Fixed stupid bug that crept into looping in min and max functions

 Revision 1.2  1995/12/26 09:56:38  willijar
 Oops - removed xy data functions.

 Revision 1.1  1995/12/26 09:39:07  willijar
 Initial revision

=head1 BUGS

Let me know. I welcome any appropriate additions for this package.

=head1 AUTHOR

John A.R. Williams <J.A.R.Williams@aston.ac.uk>

=cut

require Exporter;
package Math::VecStat;
@ISA=qw(Exporter);
@EXPORT_OK=qw(max min maxabs minabs sum average);
use strict;

sub max {
  my $v=ref($_[0]) ? $_[0] : \@_;
  my $i=$#{$v};
  my $j=$i;
  my $m=$v->[$i];
  while (--$i >= 0) { if ($v->[$i] > $m) { $m=$v->[$i]; $j=$i; }}
  return wantarray ? ($m,$j): $m;
}

sub min {
  my $v=ref($_[0]) ? $_[0] : \@_;
  my $i=$#{$v};
  my $j=$i;
  my $m=$v->[$i];
  while (--$i >= 0) { if ($v->[$i] < $m) { $m=$v->[$i]; $j=$i; }}
  return wantarray ? ($m,$j): $m;
}

sub maxabs {
   my $v=ref($_[0]) ? $_[0] : \@_;
   my $i=$#{$v};
   my $j=$i;
   my $m=abs($v->[$i]);
   while (--$i >= 0) { if (abs($v->[$i]) > $m) { $m=abs($v->[$i]); $j=$i}}
   return (wantarray ? ($m,$j) : $m);
}

sub minabs {
   my $v=ref($_[0]) ? $_[0] : \@_;
   my $i=$#{$v};
   my $j=$i;
   my $m=abs($v->[$i]);
   while (--$i >= 0) { if (abs($v->[$i]) < $m) { $m=abs($v->[$i]); $j=$i}}
   return (wantarray ? ($m,$j) : $m);
}

sub sum {
  my $v=ref($_[0]) ? $_[0] : \@_;
  my $s=0;
  foreach(@{$v}) { $s+=$_; }
  return $s;
}

sub average {
  my $v=ref($_[0]) ? $_[0] : \@_;
  return $#{$v}==-1 ? 0 : sum($v)/(1+$#{$v});
}

1;
