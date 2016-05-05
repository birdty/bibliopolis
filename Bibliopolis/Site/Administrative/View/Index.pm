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
    my $self = shift;

    use MIME::Types;

    my $mime_types = MIME::Types->new();
    my $html_type = $mime_types->type('text/html');

    print("Content-type: " . $html_type . "\n\n");

    my $shell = $self->shell();

    $content = "hello";

    $shell->merge({'contents' => $content});

    print $shell;
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

sub shell
{
  my ($self, $shell) = @_;

  if ( $shell )
  {
      $self->{'shell'} = $shell;
      return;
  }
  elsif ( $self->{'shell'} )
  {
      return $self->{'shell'};
  }
  else
  {
    require Bibliopolis::Site::Administrative::Shell;
    
    $self->{'shell'} = Bibliopolis::Site::Administrative::Shell->new({
	'name' => 'index',
	'type' => 'html'
    });
    
    return $self->{'shell'};

  }
}

1;