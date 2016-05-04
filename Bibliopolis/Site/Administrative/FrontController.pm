package Bibliopolis::Site::Administrative::FrontController;

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

  my $request = $self->request();
  
  $request =~ s/^\///g;

  my @parts;

  @parts = split(/\//, $request);

  my $action;

  if ( scalar(@parts) <= 1 )
  {
      $action = 'default';
  }
  else
  {
      $action = pop(@parts);
  }
  
  if ( $action )
  {
    my $prefix = 'Bibliopolis::Site::Administrative::';

    my $controller_class_name = $prefix;

    if ( scalar(@parts) == 0 ) 
    {
      $controller_class_name .= 'Index';
    }
    else
    {
	$controller_class_name .= join('::', map { ucfirst($_) } @parts);
    }

    no strict 'refs';

    eval("require $controller_class_name;");

    my $controller = $controller_class_name->new();
  
    $controller->execute($action);

    use strict 'refs';

  }

}

1;