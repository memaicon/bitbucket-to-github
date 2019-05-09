# BitBucket to Github Migration Script
Migrate all repositories from BitBucket to Github.
This script works with BitBucket CLI and GitHub's API to help you out.

### Requirements
    Python
    Python PIP
    BitBucket CLI

### Install Python and Python PIP
Run it:

    $ apt-get install python
    $ apt-get install python-pip

# BitBucket CLI
A command-line helper for BitBucket. [bitbucket command-line program](https://bitbucket.org/zhemao/bitbucket-cli/src/master/).


### Install BitBucket CLI

    $ pip install bitbucket-cli

# Configuration
Clone this repo.

    $ git clone https://github.com/maikonoia/bitbucket-to-github
    $ cd bitbucket-to-github

Open `migration.sh` file and define your creadentials

    GITHUB_USER=<YOUR GH USER>
    GITHUB_PASSWORD=<YOUR GH PASSWORD>
    GITHUB_USERNAME=<YOUR GH USERNAME>

    BITBUCKET_USER=<YOUR BB USER>
    BITBUCKET_PASSWORD=<YOUR BB PASSWORD>
    BITBUCKET_USERNAME=<YOUR BB USERNAME>

Run now:

    $ ./migrate.sh

# Notes

This script `remove` your repo on BitBucket after migration. If you don't want remove your repos please comment or delete line `26` on `migrate.sh` file.

    bb delete -u $BITBUCKET_USER -p $BITBUCKET_PASSWORD --owner $BITBUCKET_USERNAME $repo
