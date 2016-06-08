

my $f = `cat okta.cert`;

$f =~ s{\n$}{}sg;

open(FILE, ">okta.cert");
print FILE $f;
close(FILE);


