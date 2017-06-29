# interlok-salesforce-demo

What this does:

* It's a little MySQL backed Contact Manager DB exposed via Interlok as a REST style API (swagger included). Any changes pushed into the database are reflected in your Salesforce instance.
* DELETE's aren't synchronised, just new contacts and updated contacts
* Little or no error handling.

If this doesn't work; well feel free to hack about with it until it does. I'm no docker or ant expert...

* If you can't get docker to work, then consult the docker documentation.
* If you can't get ANT to work, then hack about with the build.xml until it does.
* If you can't make the adapter work; well that's when you can raise an issue.

__lewinc/interlok-salesforce-demo:latest is builds everytime adaptris/interlok:snapshot-alpine is generated; so bleeding edge only__

## Salesforce Pre-requisites

Here's the information that you need to know. Presumably you have a developer.force.com account, and an instance setup.

* You'll need to create an account within your instance or use an existing one (make a note of the accountID, which is in the URL when you click on details),
* You'll need to setup OAUTH for the adapter which basically means going to the Setup -> Platform Tools -> Apps -> App Manager -> New Connected App
    * Enable OAUTH
    * Callback URL is a dummy one (anything)
    * Scope is FULL CONTROL (hey it's a demo right).
    * Once that's done, you'll have all the information for variable properties when you show the secrets (it's a secret but you'll can find it right?)

## Local setup

* Copy .env.template -> .env
* Fill in .env with the correct details

## Build and run

* ```docker-compose up```

__Might take a while to start up with some errors logged; just be patient!__

* Once everything is up, then point your browser to http://localhost:8080/swagger + http://localhost:8080/interlok
* You'll need the AccountID + Account from your instance if you want to insert data using the API.

A few things to be aware of
* The Database Monitor channel is not set to auto-start; this is because you will may need to eyeball your configuration to make sure things are as you expect.
* You may get some errors around ActiveMQ. The embedded component doesn't always start before the interlok instance tries to connect to it; it'll be fine after 60 seconds.
* Because it's docker; the UI might take a bit longer to start and there may be complaints from c3p0. This is something to do with the derby driver taking a while to create the database + flyway action.
* Similarly stopping the adapter may cause the same logging around ActiveMQ (tries to restart channels in the process of closing).

## Virtualbox / docker toolbox notes

* You will probably need to explicitly mount a shared folder into the docker `default` machine before the volume mounts work.
* Pointing your browser to http://${DOCKER_HOST}:8080/swagger is going to display the swagger page, but with a message `Can't read from server...`
    * Change the address that swagger is trying to connect so that it's not `localhost`
* You need to edit the docker-compose.yml file so that `interlok.api.host` is correct for your env.
