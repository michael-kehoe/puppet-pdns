define pdns::gpgsql	($host='localhost',
		     	$port='5432',
			$dbname='pdns',
			$user='root',
			$password='password',
			$dnssec='yes') {
	package { 'pdns-backend-pgsql':
		ensure => installed,
	}

        file { "pdns.local.gpgsql":
                       path   => "/etc/powerdns/pdns.d/pdns.local.gpgsql",
                       owner  => pdns,
                       group  => root,
                       mode   => 640,
                       content => template("pdns/pdns.local.gpgsql.erb"),
                       notify => Service['pdns'];
        }	
}
