package Bibliopolis::Site::Administrative::View::Index;


sub new
{
  my($class, $args_href) = @_;

  my $object;

  if ( $args_href )
  {
      $object = $args_href;
  }
  else 
  {
      $object = {};
  }

  return $object, $class;
}

sub default
{
    use MIME::Types;

    my $mime_types = MIME::Types->new();
    my $html_type = $mime_types->type('text/html');

    print("Content-type: " . $html_type . "\n\n");

    print("in view..");

}

sub render
{
  my($self, $args_href) = @_;

  no strict 'refs';

  my $method = $args_href->{'method'};

  if ( $self->can($method) )
  {
    $self->$method;
  }

  use strict 'refs';
}

1;