import datetime
import json
import os

from fabric import api, operations, contrib
from fabric.state import env

ENVIRONMENTS = {
    "prd": {
        "hosts": 'ec2-23-21-126-6.compute-1.amazonaws.com',
    }, 
}

env.project_name = 'nyt-scotus-loader'
env.user = "ubuntu"
env.forward_agent = True
env.branch = "master"

env.term = os.environ.get('term', None)
env.hosts = ['127.0.0.1']
env.dbs = ['127.0.0.1']
env.settings = None

@api.task
def t(term):
    env.term = term

@api.task
def development():
    """
    Work on development branch.
    """
    env.branch = 'development'

@api.task
def master():
    """
    Work on stable branch.
    """
    env.branch = 'master'

@api.task
def branch(branch_name):
    """
    Work on any specified branch.
    """
    env.branch = branch_name

@api.task
def e(environment):
    env.settings = environment
    env.hosts = ENVIRONMENTS[environment]['hosts']

@api.task
def clone():
    api.run('git clone git@github.com:newsdev/%(project_name)s.git /home/ubuntu/%(project_name)s' % env)

@api.task
def pull():
    api.run('cd /home/ubuntu/%(project_name)s; git fetch; git pull origin %(branch)s' % env)

@api.task
def pip_install():
    api.run('cd /home/ubuntu/%(project_name)s; workon %(project_name)s && pip install --upgrade -r requirements.txt' % env)

@api.task
def reload():
    api.run('cd /home/ubuntu/%(project_name)s; workon %(project_name)s; bash scripts/%(settings)s/reload.sh' % env)

@api.task
def bootstrap():
    api.run('cd /home/ubuntu/%(project_name)s; workon %(project_name)s; bash scripts/%(settings)s/bootstrap.sh' % env)

@api.task
def deploy():
    pull()
    pip_install()