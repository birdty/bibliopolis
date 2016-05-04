package Bibilopolis::Site::Administrative::FrontController;

sub new
{
   my ($class, $args_href) = @_;
   return bless $args_href, $class;
}

sub request
{
  my $self = shift;
  return @_ ? $self->{'parameters'}->{'request'} = shift : $self->{'parameters'}->{'request'};
}

sub process_request
{
  my $self = shift;

  my @parts = split(/\//, $self->request());

  if ( @parts )
  {
    my $action = pop(@parts);

    if ( $action )
    {
      my $controller_class_name = join('::', map { ucfirst($_) } @parts);

      require $controller_class_name;

      my $controller = $controller_class_name->new();

      $controller_class_name->execute($action);
    }
  }
}

1;