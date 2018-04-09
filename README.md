# RESTinstance Starter Project 
This is an example project that will demonstrate the use of [RESTinstance](#https://github.com/asyrjasalo/RESTinstance) 
for API testing. This is to help new users quickly get started using the library and providing common examples that 
they might need to leverage for their own projects. 

This project uses virtualenv to handle all package requirements.

Please visit the [RESTinstance Keyword Library](#https://asyrjasalo.github.io/RESTinstance/) for more keyword usage. We 
will try to provide as many useful examples as possible. Please feel free to submit PRs for areas we do not have 
covered!

## Getting Started
Please make sure virtualenv (python3) is setup before proceeding. 
If you've never used it, try this [guide](#https://virtualenv.pypa.io/en/stable/installation/).  

## Instructions

1. Start a terminal in the root of your project
2. Activate [virtualenv](#markdown-header-activate-virtualenv)
3. Run command: `./run_local_tests.sh`
4. Tests should all pass
5. Inspect the log.html that gets generated in results/log.html

---
## Activate virtualenv

In the project root directory, use the following commands.

1. Create virtualenv
    * `virtualenv -p python3 venv`
2. Activate virtualenv
    * `source venv/bin/activate`
3. Install the required packages in virtualenv
    * `pip install -r requirements.txt`
4. Verify you are on Python 3+
    * `python --version`

---

## Credits

* [Joe Wong](https://github.com/jjwong/)
* [Anssi Syrjäsalo](https://github.com/asyrjasalo/) - Thank you for creating RESTinstance and 
answering all of my silly questions :)
