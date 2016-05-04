package Bibliopolis::Site::Administrative;

use strict;
use warnings;

sub new
{
  my($class) = @_;

  my $object = bless {}, $class;

  return $object;
}

sub execute
{
    my ($self, $action) = @_;

    if ( $self->can($action) )
    {
	if ( $self->available($action) )
	{
		no strict 'refs';
		$self->$action;
		use strict 'refs';
	}
    }
}

sub available
{
    return 0;
}

1;