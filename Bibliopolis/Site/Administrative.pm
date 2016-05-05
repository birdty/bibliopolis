package Bibliopolis::Site::Administrative;

use strict;
use warnings;

use base qw(Bibliopolis::Site);

sub find_view
{
  my($self, $args_href) = @_;

  my $view_module_name = 'Bibliopolis::Site::Administrative::View::';

  $view_module_name .= $args_href->{'name'};

  warn("[" . $view_module_name . "]");

  my $retval = eval("require $view_module_name;");

  if ( $retval )
  {
      no strict 'refs';
    warn('a');
      my $view = $view_module_name->new();
    warn('b');
      use strict 'refs';

      return $view;
  }
  else
  {
     $self->console->send_message("Page template not found.");
  }
}

1;