package eval;

# DATE
# VERSION

sub import {
    my $class = shift;
    for (@_) {
        eval $_;
        die if $@;
    }
}

1;
# ABSTRACT: Eval code

=head1 SYNOPSIS

Use in one-liner or in PERL5OPT:

 % perl -Meval='$Carp::MaxArgLen = 1000' script.pl

 % PERL5OPT='-Meval=$Carp::MaxArgLen = 1000' script.pl


=head1 DESCRIPTION

This pragma lets you run some Perl code before running your script. Some other
ways to accomplish the same include:

=over

=item * creating F<$Config{sitelib}/sitecustomize.pl>

See L<perlrun>.

=item * putting your code in a module and load it using C<-m> or C<-M>

For example, you put your code in F<lib/Foo.pm> and run your script using:

 % PERL5OPT="-Ilib -MFoo" script.pl

=item * C<do>

 % perl -e'$Carp::MaxArgLen = 1000; do "script.pl"'

=back
