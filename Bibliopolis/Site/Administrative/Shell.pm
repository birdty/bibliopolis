package Bibliopolis::Site::Administrative::Shell;

use overload ('""' => 'render');

use IO::File;

sub new
{
  my($class, $args_href) = @_;

  my $object;

  if ( $args_href )
  {
      $object = $args_href;

      if ( $object->{'type'} eq 'html' )
      {
	my $filename = $args_href->{'name'} . ".shell";
	my $fh = IO::File->new($filename, "r");
	my $shell = join("", <$fh>);
	undef $fh;

	$object->{'title'} = 'Bibliopolis Administrative Site';
	$object->{'shell'} = $shell;

	return bless $object, $class;
      }
      elsif ( $object->{'type'} eq 'xml' )
      {
	  # instantiate specialized xml shell object.
      }
  }
  else
  {
      $object = {};
      return 
  }
}

sub render
{
  my $self = shift;
  
  $self->{'shell'} =~ s{<<title>>}{$self->{'title'}}g;

  return $self->{'shell'};
}

sub merge
{
  my($self, $args_href) = @_;
  
  foreach my $key ( keys %$args_href )
  {
      my $value = $args_href->{$key};
      $self->{'shell'} =~ s{<<$key>>}{$value}eg;
  }
}

1;