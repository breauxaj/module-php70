php70
=====

An alternative installation of PHP for Amazon AMI.

Samples
-------
```
include php70
```
```
php70::config {
  'Date/date.timezone': value => 'America/New_York';
}
```
```
php70::modules { 'bcmath': ensure => 'latest', }
```

License
-------
GPL3

Contact
-------
breauxaj AT gmail DOT com