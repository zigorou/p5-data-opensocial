package Data::OpenSocial::Format::JSON;

use Any::Moose '::Role';

use Data::Dump qw(dump);
use Perl6::Say;
use JSON::Any qw(DWIW XS Syck JSON);

sub format_json {
    my ($self, $is_strict) = @_;
    
    my $json = JSON::Any->new;
    
    if ($self->isa('Data::OpenSocial::Appdata')) {
        my %data = map { ($_->key, $_->value) } @{$self->entry};
        return $json->to_json(\%data);
    }
}

sub parse_json {
    my ($self, $json_str) = @_;

    my $json = JSON::Any->new;
    my $data = $json->from_json($json_str);

    if ($self->isa('Data::OpenSocial::Appdata')) {
        if (exists $data->{entry}) {
            # +{ entry: [ { "key": "pokes", "value": 3 }, { "key": "last_poke", "value": "2008-02-13T18:30:02Z" } ] }
            $self->entry([
                @{$data->{entry}}
            ])
        }
        else {
            # +{ "pokes": 3, "last_poke": "2008-02-13T18:30:02Z" }
            $self->entry($data);
        }
        return 1;
    }
}

no Any::Moose '::Role';

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

