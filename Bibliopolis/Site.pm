package Bibliopolis::Site;

sub new
{
  my($class, $args_href) = @_;

  my $object = bless {
      'parameters' => $args_href->{'parameters'},
      'console' => $args_href->{'console'},
      'view_type' => $args_href->{'view_type'}
  }, $class;

  return $object;
}

sub parameters
{
  my $self = shift;
  return @_ ? $self->{'parameters'} = shift : $self->{'parameters'};
}

sub console
{
  my $self = shift;
  return @_ ? $self->{'console'} = shift : $self->{'console'};
}

sub view_type
{
  my $self = shift;
  return @_ ? $self->{'view_type'} = shift : $self->{'view_type'};
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

    if ( $self->can($action) && $self->available($action) )
    {
      no strict 'refs';

      $self->$action;

      no strict 'refs';
    }
    else
    {
	$self->console->send_message("Request Denied");
    }
}

sub available
{
    return 0;
}

1;