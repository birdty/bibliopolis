package Bibliopolis::Site::Administrative::Index;

use base qw(Bibliopolis::Site::Administrative);

sub default
{
  print("Content-type: text/html\n\n");
  print qq[hi];
}

sub available
{
  my ($self, $action) = @_;
   
  if ( $action eq 'default' )
  {
    return 1;
  }

  return 0;
}


1;