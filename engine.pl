#!/usr/bin/perl
#
# Rest Parsing and routing of request
#
package main;

use CGI;

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

  my $fc = Bibliopolis::Site::Administrative::FrontController->new(
    {
      'parameters' => $parameters,
      'cgi' => $cgi
    }
  );

  $fc->process_request();

}

1;