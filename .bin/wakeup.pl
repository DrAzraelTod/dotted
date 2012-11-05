#!/usr/bin/perl
#
# (c)2012 speaker
 
use strict;
use warnings;
use LWP::UserAgent;
use Encode;
use Digest::MD5 qw(md5_hex);
 
my $ua = LWP::UserAgent->new;
 
### start of config section
 
# if you don't want to store your credentials within this script just keep the
# following three dummy values and set $ask_auth = 1
my $httpuser = "<http auth user>";
my $httppass = "<http auth password>";
my $fritzpass = "<fritzbox admin password>";
my $ask_auth = 0;
 
my $host = "<hostname or ip>";
my $port = 443;
my $mac = "<mac for wake up>";	# use mac format 01:23:45:67:89:AB
 
# uncomment the following line if you get ssl certificate warnings
#$ua->ssl_opts(verify_hostname => 0);
 
### end of config section
### do not change anything below!
 
sub readcreds() {
	use Term::ReadKey;
	print "http auth user: "; chomp($httpuser = ReadLine(0));
	ReadMode('noecho');
	print "http auth pass: "; chomp($httppass = ReadLine(0));
	print "\nfritzbox pass: "; chomp($fritzpass = ReadLine(0));
	ReadMode('restore');
	print "\n\n";
}
 
readcreds if ($ask_auth);
 
$ua->timeout(30);
push @{$ua->requests_redirectable}, 'POST';
$ua->credentials($host.":".$port, "HTTPS Access", $httpuser, $httppass);
 
my $url_base = "https://".$host;
my $url_login = $url_base."/login.lua";
my $url_wakeup = $url_base."/cgi-bin/webcm";
 
my $r = $ua->get($url_login);
if ($r->is_success) {
	my $c = $r->decoded_content;
	if ($c =~ m/var challenge = "([a-f0-9]+)";/) {
		my $challenge = $1;
		my %data = (response => sprintf "%s-%s", $challenge,
			md5_hex(encode("UTF16-LE", sprintf "%s-%s", $challenge, $fritzpass)));		
		$r = $ua->post($url_login, \%data);
		$c = $r->decoded_content;
		if ($c =~ m/logout\.lua\?sid=([a-f0-9]+)/) {
			my $sid = $1;
			%data = (sid => $sid, "wakeup:settings/mac" => $mac);
			$r = $ua->post($url_wakeup, \%data);
			if ($r->is_success) {
				print "wakeup done.\n";
			} else {
				printf "error: %s\n", $r->status_line;
			}
		} else {
			print "error: could not find a session id\n";
		}
	} else {
		print "error: could not find a challenge\n";	
	}
} else {
	print "error: could not login\n";
}
 
exit 0;
