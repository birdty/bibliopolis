#!/usr/bin/perl
#
# Rest Parsing and routing of request
#
package main;

use CGI;
use IO::File;
use Error qw(:try);

try
{
  run();

  sub run 
  {
    my $cgi = CGI->new();

    require Bibliopolis::Site::Administrative::FrontController;

    my $parameters = {};

    foreach my $param_name ( $cgi->param() )
    {
	my $value = $cgi->param($param_name);

	$parameters->{$param_name} = $value;
    }

    # cgi will be an implementation detail
    # for example one use case is an action will
    # call the front controller to get the location of an uploaded file
    # this will be wrapped and no knowledge of cgi will be exposed to the action 
    # that is called from the front controller.

    my $console;
    my $view_type;

    if ( $ENV{'HTTP_HOST'} ) {
      require Bibliopolis::Console::HTML;
      
      my $fh = new IO::File "console_template.html", "r";

      my $html_template = join("\n", <$fh>);

      undef $fh;

      $console = Bibliopolis::Console::HTML->new($html_template);
      
      $view_type = 'html';

    }
    else
    {
	# command line console used when running unit tests.
    }
    

    my $fc = Bibliopolis::Site::Administrative::FrontController->new({
	  'parameters'	=> $parameters,
	  'console'	=> $console,
	  'cgi'		=> $cgi,
	  'view_type'	=> $view_type
    });

    $fc->process_request();
  }

}
catch Error with
{
  my $error = shift;

  use Data::Dumper;

  print("Content-type: text/html\n\n");
  
  print Dumper(\$error);

};

1;