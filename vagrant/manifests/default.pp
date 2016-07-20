# Execute the apt-get update.

exec ( 'apt-update':
	command => '/usr/bin/apt-get update'
)

# Install the mongodb package.

package ( 'mongodb':
	require => Exec['apt-update'],
	ensure => installed,
)

# Run the mongodb service.

service ( 'mongodb':
	ensure => running,
	require => Package['mongodb'],
)

# Install the redis-server package.

package ( 'redis-server':
	require => Exec['apt-update'],
	ensure => latest,
)

# Run the redis-server service.

service ( 'mongodb':
	ensure => running,
	require => Package['redis-server'],
)

# Create a working directory.

file ( "/home/vagrant/projects":
	ensure => "directory",
	owner => "vagrant",
	group => "vagrant",
	mode => 750,	
)
