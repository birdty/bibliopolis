package Bibliopolis::Site;

sub new
{
  my($class, $parameters) = @_;

  my $object = bless {'parameters' => $parameters}, $class;

  return $object;
}

sub parameters
{
  my $self = shift;
  return @_ ? $self->{'parameters'} = shift : $self->{'parameters'};
}

sub parameter
{
  my ($self, $name) = @_;
  
  my $parameters = $self->parameters();

  if ( $parameters )
  {
    return $parameters->{$name};
  }
}

sub execute
{
    my ($self, $action) = @_;

    if (
	$self->can($action) &&
	$self->available($action)
    )
    {
      no strict 'refs';
      $self->$action;
      no strict 'refs';
    }
    else
    {
	print("Content-type: text/plain\n\n");
	print("Request Denied.");
    }
}

sub available
{
    return 0;
}

1;