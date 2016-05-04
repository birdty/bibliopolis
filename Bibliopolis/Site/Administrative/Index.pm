package Bibliopolis::Site::Administrative::Index;

use base qw(Bibliopolis::Site::Administrative);

sub default
{
  my $self = shift;

  print("Content-type: text/html\n\n");
  print qq[My Default];
}

sub login
{
  my $self = shift;

  print("Content-type: text/plain\n\n");
  print("login..");
 
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