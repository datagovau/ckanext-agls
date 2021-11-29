from setuptools import setup, find_packages

version = '0.1'

setup(
	name='ckanext-agls',
	version=version,
	description='Extension for customising CKAN for data.gov.au',
	long_description='',
	classifiers=[], # Get strings from http://pypi.python.org/pypi?%3Aaction=list_classifiers
	keywords='',
	author='Alex Sadleir',
	author_email='alex.sadleir@linkdigital.com.au',
	url='',
	license='',
	packages=find_packages(exclude=['ez_setup', 'examples', 'tests']),
	namespace_packages=['ckanext'],
	include_package_data=True,
	zip_safe=False,
	install_requires=[],
	entry_points=\
	"""
        [ckan.plugins]
	agls=ckanext.agls.plugin:AGLSDatasetPlugin

	[paste.paster_command]
        initdb = ckanext.agls.command:InitDB
        [ckan.click_command]
        agls = ckanext.agls.cli:agls
	""",
)
