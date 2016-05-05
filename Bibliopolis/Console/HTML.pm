package Bibliopolis::Console::HTML;

use MIME::Types;

sub new
{
  my($class, $html_template) = @_;
  return bless {'html_template' => $html_template}, $class;
}

sub html_template
{
  my $self = shift;
  return @_ ? $self->{'html_template'} = shift : $self->{'html_template'};
}

sub send_message
{
    my ($self, $message) = @_;

    my $mimetypes = MIME::Types->new();

    my MIME::Type $html_mime_type = $mimetypes->type('text/html');
    
    print("Content-type: " . $html_mime_type . "\n\n");

    my $console_html_template = $self->html_template();
    $console_html_template =~ s{<<message>>}{$message}g;

    print $console_html_template;
}

1;



