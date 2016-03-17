###concourse cookbook

This is in the very beginning stages proceed with caution.

The cookbook is standing up a Vagrant CentOS box running concourse as a service.

After vagrant up concourse will be running at 192.168.50.250:8080 but the basic auth link is forwarding to wrong uri.

I've submitted Issue with concourse/bin: https://www.pivotaltracker.com/story/show/115831799

For now to authenticate navigate to http://192.168.50.250:8080/login/basic

User: myuser
Pass: mypass

I've also seen some intermittent issues with the iptables service restart, if you encounter this failure just run vagrant provision.

##Todo list is very long but here is my next 4 items coming up. 

* Add chefspec tests
* Get this building in TravisCI
* Add test kitchen
* Add lwrp for flycli with some very basic resources

## Contributing

1. Fork the repository on Github
2. Create a named feature branch (i.e. `add-new-recipe`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request

## License and Authors

Author:: iJet Technologies Engineering (dustin.vanbuskirk@ijettechnologies.com)