import os
import sys
from warnings import warn


virtualenv = os.environ.get('VIRTUAL_ENV')

if virtualenv:

    version = os.listdir(os.path.join(virtualenv, 'lib'))[0]
    site_packages = os.path.join(virtualenv, 'lib', version, 'site-packages')
    lib_dynload = os.path.join(virtualenv, 'lib', version, 'lib-dynload')

    if not (os.path.exists(site_packages) and os.path.exists(lib_dynload)):
        msg = 'Virtualenv site-packages discovery went wrong for %r' % repr([site_packages, lib_dynload])
        warn(msg)

    sys.path.insert(0, site_packages)
    sys.path.insert(1, lib_dynload)
