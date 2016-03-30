###concourse cookbook

This is in the very beginning stages proceed with caution.

The cookbook is standing up a Vagrant CentOS box running concourse as a service.

After vagrant up concourse will be running at 192.168.50.205:8080

User: myuser
Pass: mypass

##Todo list is very long but here is my next 4 items coming up. 

* Add chefspec tests
* Get this building in TravisCI
* Add test kitchen
* Add lwrp for flycli with some very basic resources (in progress)

| Attribute | Description | Default | Type | Required | 
| ------------- | ----------- | ----------- | ----------- |----------- |
| ['concourse']['version'] | Version of Concourse CI | 1.0.0 | string | yes |
| ['concourse']['download']['url'] | URL to Concourse binary | https://github.com/concourse/concourse/releases/download/v#{concourse['version']}/concourse_linux_amd64 | string | yes |
| ['concourse']['home']['directory'] | Directory to store Concourse binary | /usr/local/bin | string | yes |
| ['concourse']['external']['url'] | URL used to connect to Concourse CI | http://127.0.0.1:8080 | string | yes |
| ['concourse']['fly']['download']['url']| URL to fly binary | https://github.com/concourse/fly/issues/65 | string | no |

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: iJet Technologies Engineering (dustin.vanbuskirk@ijettechnologies.com)