package BioX::CLPM::Amino;
use base qw(BioX::CLPM::Base);
use Class::Std;
use Class::Std::Utils;

use warnings;
use strict;
use Carp;

use version; our $VERSION = qv('0.0.1');

{
        my %amino_acid_id_of  :ATTR( :get<amino_acid_id>   :set<amino_acid_id>   :default<''>    :init_arg<amino_acid_id> );
        my %letter_of  :ATTR( :get<letter>   :set<letter>   :default<''>    :init_arg<letter> );
        my %mass_of  :ATTR( :get<mass>   :set<mass>   :default<''>    :init_arg<mass> );
        my %type_of  :ATTR( :get<type>   :set<type>   :default<''>    :init_arg<type> );
                
        sub START {
                my ($self, $ident, $arg_ref) = @_;
        
		if ( defined $arg_ref->{amino_acid_id} ) {
			$self->_load( $arg_ref );
		}

                return;
        }

        sub _load {
                my ( $self, $arg_ref ) = @_;
		my $amino_acid_id = defined $arg_ref->{amino_acid_id} ? 
		                    $arg_ref->{amino_acid_id} : 
				    $self->get_amino_acid_id();

		if ( defined $arg_ref->{amino_acid_id} ) {
			$self->set_amino_acid_id($amino_acid_id);
		}

		my $sql  = 'select letter, mass, type ';
		   $sql .= "from amino_acids where amino_acid_id = '$amino_acid_id'";
		my ( $letter, $mass, $type ) = $self->sqlexec( $sql, '@' );
		$self->set_letter( $letter );
		$self->set_mass( $mass );
		$self->set_type( $type );
	}

}

1; # Magic true value required at end of module
__END__

=head1 NAME

BioX::CLPM::Amino - Perl Tools for Mass Spec Peptide Matching


=head1 VERSION

This document describes BioX::CLPM::Amino version 0.0.1


=head1 SYNOPSIS

    use BioX::CLPM::Amino;

    my $obj = BioX::CLPM::Amino->new({attribute => 'value'});

    print $obj->get_attribute(), "\n";

    $obj->set_attribute('new value');

    print $obj->get_attribute(), "\n";

=for author to fill in:
    Brief code example(s) here showing commonest usage(s).
    This section will be as far as many users bother reading
    so make it as educational and exeplary as possible.
  
  
=head1 DESCRIPTION

=for author to fill in:
    Write a full description of the module and its features here.
    Use subsections (=head2, =head3) as appropriate.


=head1 INTERFACE 

=for author to fill in:
    Write a separate section listing the public components of the modules
    interface. These normally consist of either subroutines that may be
    exported, or methods that may be called on objects belonging to the
    classes provided by the module.


=head1 DIAGNOSTICS

=for author to fill in:
    List every single error and warning message that the module can
    generate (even the ones that will "never happen"), with a full
    explanation of each problem, one or more likely causes, and any
    suggested remedies.

=over

=item C<< Error message here, perhaps with %s placeholders >>

[Description of error here]

=item C<< Another error message here >>

[Description of error here]

[Et cetera, et cetera]

=back


=head1 CONFIGURATION AND ENVIRONMENT

=for author to fill in:
    A full explanation of any configuration system(s) used by the
    module, including the names and locations of any configuration
    files, and the meaning of any environment variables or properties
    that can be set. These descriptions must also include details of any
    configuration language used.
  
BioX::CLPM::Amino requires no configuration files or environment variables.


=head1 DEPENDENCIES

=for author to fill in:
    A list of all the other modules that this module relies upon,
    including any restrictions on versions, and an indication whether
    the module is part of the standard Perl distribution, part of the
    module's distribution, or must be installed separately. ]

None.


=head1 INCOMPATIBILITIES

=for author to fill in:
    A list of any modules that this module cannot be used in conjunction
    with. This may be due to name conflicts in the interface, or
    competition for system or program resources, or due to internal
    limitations of Perl (for example, many modules that use source code
    filters are mutually incompatible).

None reported.


=head1 BUGS AND LIMITATIONS

=for author to fill in:
    A list of known problems with the module, together with some
    indication Whether they are likely to be fixed in an upcoming
    release. Also a list of restrictions on the features the module
    does provide: data types that cannot be handled, performance issues
    and the circumstances in which they may arise, practical
    limitations on the size of data sets, special cases that are not
    (yet) handled, etc.

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-biox-clpm-amino@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.


=head1 AUTHOR

Nathan Crabtree, MidSouth Bioinformatics Center  C<< <crabtree@cpan.org> >>


=head1 LICENSE AND COPYRIGHT

Copyright (c) 2012, Nathan Crabtree, MidSouth Bioinformatics Center C<< <crabtree@cpan.org> >>. All rights reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY
FOR THE SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN
OTHERWISE STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES
PROVIDE THE SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER
EXPRESSED OR IMPLIED, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE. THE
ENTIRE RISK AS TO THE QUALITY AND PERFORMANCE OF THE SOFTWARE IS WITH
YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE, YOU ASSUME THE COST OF ALL
NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING
WILL ANY COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR
REDISTRIBUTE THE SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE
LIABLE TO YOU FOR DAMAGES, INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL,
OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE USE OR INABILITY TO USE
THE SOFTWARE (INCLUDING BUT NOT LIMITED TO LOSS OF DATA OR DATA BEING
RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR THIRD PARTIES OR A
FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE), EVEN IF
SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF
SUCH DAMAGES.
