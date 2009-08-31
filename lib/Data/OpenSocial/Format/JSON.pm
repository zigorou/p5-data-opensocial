package Data::OpenSocial::Format::JSON;

use Data::Dump qw(dump);
use Perl6::Say;
use JSON::Any qw(DWIW XS Syck JSON);

sub format {
    my ( $class, $object, $is_strict ) = @_;

    my $json = JSON::Any->new;
    if ( $object->isa('Data::OpenSocial::Appdata') ) {
        my %data = map { ( $_->key, $_->value ) } @{ $object->entry };
        return $json->to_json( \%data );
    }
}

sub parse {
    my ( $class, $class_type, $json_str ) = @_;

    if ( substr( $class_type, 0, 1 ) ne '+' ) {
        $class_type = 'Data::OpenSocial::' . $class_type;
    }
    else {
        $class_type =~ s/^\+//;
    }

    my $json = JSON::Any->new;
    my $data = $json->from_json($json_str);

    if ( $class_type->isa('Data::OpenSocial::Appdata') ) {
        my $object = $class_type->new();
        if ( exists $data->{entry} ) {

# +{ entry: [ { "key": "pokes", "value": 3 }, { "key": "last_poke", "value": "2008-02-13T18:30:02Z" } ] }
            $object->entry( [ @{ $data->{entry} } ] );
        }
        else {

            # +{ "pokes": 3, "last_poke": "2008-02-13T18:30:02Z" }
            $object->entry($data);
        }

        return $object;
    }
}

1;

__END__

{
 "pokes" : 3,
 "last_poke" : "2008-02-13T18:30:02Z"
}        

<appData xmlns="http://ns.opensocial.org/2008/opensocial">
  <entry>
    <key>pokes</key>
    <value>3</value>
  </entry>
  <entry>
    <key>last_poke</key>
    <value>2008-02-13T18:30:02Z</value>
  </entry>
</appData>        

<entry xmlns="http://www.w3.org/2005/Atom">
 <content type="application/xml">
   <appData xmlns="http://ns.opensocial.org/2008/opensocial">  
       <pokes>3</pokes>
       <last_poke>2008-02-13T18:30:02Z</last_poke>
   </appData>
 </content>
 <title/>
 <updated>2003-12-13T18:30:02Z</updated>
 <author>
   <url>urn:guid:example.org:34KJDCSKJN2HHF0DW20394</url>
   <name>John Smith</name>  
 </author>
 <id>urn:guid:example.org:34KJDCSKJN2HHF0DW20394</id>
</entry>

----

