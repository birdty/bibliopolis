package Bibliopolis::Site::Administrative::Control::Index;

use base qw(Bibliopolis::Site::Administrative);

sub default
{
  my $self = shift;
}

sub login
{
  my $self = shift;
 
}

sub available
{
  my ($self, $action) = @_;

  my %allowed_actions = (
      'default' => 1,
      'login' => 1
  );
  
  if ( $allowed_actions{$action} )
  {
    return 1;
  }
  else
  {
    return 0;
  }
}

1;