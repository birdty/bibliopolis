package Bibliopolis::Site::Administrative::Control::Index;

use base qw(Bibliopolis::Site::Administrative);

# 2 concepts a renderer 
# and a console varying for each type.

sub default
{
  my $self = shift;

  my $view = $self->find_view({
	 'name' => 'Index',
	 'type' => $self->view_type(),
	 'bar' => '1'
  });

  $view->render({'method' => 'default'});
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