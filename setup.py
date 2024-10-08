from setuptools import setup

with open('README.md', 'r') as f:
    readme = f.read()

with open('requirements.txt', 'r') as f:
    requirements = f.read().split()

setup(
    name='PoePT',
    version='0.3.3',
    description='Python package for interacting with the Quora POE chatbot',
    packages=['poept', 'poept.langchain'],
    install_requires=requirements,
    classifiers=[
        'Development Status :: 3 - Alpha',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: MIT License',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
        'Programming Language :: Python :: 3.8',
        'Programming Language :: Python :: 3.9',
    ],
    long_description=readme,
    long_description_content_type='text/markdown'
)
