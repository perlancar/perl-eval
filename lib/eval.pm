package eval;

# DATE
# VERSION

sub import {
    my $class = shift;
    my $code = join ",", @_;
    return unless length $code;
    print "eval.pm: Eval'ing: $code\n" if $ENV{DEBUG};
    eval $code;
    die if $@;
}

1;
# ABSTRACT: Eval code

=head1 SYNOPSIS

Use in one-liner or in PERL5OPT:

 % perl -Meval='$Carp::MaxArgLen = 1000' script.pl

 % DEBUG=1 PERL5OPT='-Meval=$Carp::MaxArgLen=1000' script.pl
 eval.pm: Eval'ing: $Carp::MaxArgLen=1000


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

Some caveats:

=over

=item * No whitespace in code in PERL5OPT

Space is used to separate perl options in PERL5OPT, so you can't do:

 % PERL5OPT='-Meval=$Carp::MaxArgLen = 1000' script.pl

but you can do:

 % PERL5OPT='-Meval=$Carp::MaxArgLen=1000' script.pl

To help you see what code is being eval'ed, set C<DEBUG> to true:

 % PERL5OPT='-Meval=$Carp::MaxArgLen=1000' script.pl
 eval.pm: Eval'ing: $Carp::MaxArgLen=1000

=back


=head1 ENVIRONMENT

=head2 DEBUG

Bool. If set to true, will show what code is being eval'ed.

=cut
