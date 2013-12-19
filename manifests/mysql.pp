define pdns::mysql      ($mysql-host='localhost',
                        $mysql-port='3306',
                        $mysql-dbname='pdns',
                        $mysql-user='root',
                        $mysql-password='password',
                        $mysql-dnssec='yes') {

        file { "pdns.local.mysql":
                       path   => "/etc/powerdns/pdns.d/pdns.local.mysql",
                       owner  => root,
                       group  => root,
                       mode   => 600,
                       content => template("pdns/pdns.local.mysql.erb"),
                       notify => Service['pdns'];
        }
}
