#!/usr/bin/perl

use strict;
use warnings;

use Data::Dump qw(dump);

use String::CamelCase qw(wordsplit);

use XML::LibXML;
use XML::LibXML::XPathContext;

my $complex_type = shift @ARGV;

die(q|please specify complex_type (ex. Person)|) unless ($complex_type);

my %typemap = (
    'xs:string'	 => 'Str',
    'xs:int'	 => 'Int',
    'xs:long'	 => 'Int',
    'xs:double'	 => 'Int',
    'xs:boolean' => 'Bool',
    'xs:anyType' => 'Any',
    'xs:dateTime' => 'DateTime'
);

sub lcamelize {
    my $name = shift;
    join('_', map { lc } map { wordsplit($_) } split(/\./, $name));
}

sub attr {
    my $data = shift;
    my $tmpl = << 'TMPL';
has '%s' => (
    is	      => 'rw',
    isa	      => '%s',
    default   => 0,
    predicate => 'has_%s',
);

TMPL

    return sprintf(
	$tmpl,
	$data->{name}, $data->{type}, $data->{name}
    );
}

my $parser = XML::LibXML->new;
my $doc    = $parser->parse_string(do {
    local $/;
    <STDIN>;
});

my $xpc    = XML::LibXML::XPathContext->new($doc);
my @elements = $xpc->findnodes(sprintf(q|//xs:complexType[@name="%s"]//xs:element|, $complex_type));

for my $element (@elements) {
    my $name = lcamelize($element->getAttribute('name'));
    my $type = $element->getAttribute('type');

    $type = exists $typemap{$type} ? $typemap{$type} : do {
	$type =~ s|^tns:||;
	$type;
    };

    print attr(+{ name => $name, type => $type });
}
