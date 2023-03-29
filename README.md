```
 File              	: README.md
 Author            	: Michael Buckley <github.com/piCounter>
 Date              	: 28.03.2023
 Last Modified Date	: 28.03.2023
 Last Modified By  	: Michael Buckley <github.com/piCounter>
 Description		: how to configure salt states
```
#
# source: https://docs.saltproject.io/salt/user-guide/en/latest/topics/states.html
# source: https://docs.saltproject.io/salt/user-guide/en/latest/topics/requisites.html#requisites

*Identifier* is the identifier declaration for the state section.
	- the ID which identifies the state
	- value copied into 'name' value unless name is explicitly declared
*State* is the name of the state module containing the function, such as installed.
*Function* is the function to call in the named module, such as installed.
*Name* is the name of the state call, which is usually the name of the file to be managed or the name of the package to be installed
*Arguments* are the arguments that the state function will accept


*.sls file example
	# comment with description
	# author
	# date created
	# date modified

	identifier:
	  module.function
		- name: name_value
		- function_arg: arg_value
		- function_arg: arg_value
		- function_arg: arg_value

# real world example
# pkg.install
vim:
  pkg:
    - installed
    {% if grains['os_family'] == 'RedHat' %}
    - name: vim-enhanced
    {% elif grains['os'] == 'Debian' %}
    - name: vim-nox
    {% endif %}

/etc/vimrc:
  file:
    - managed
    - source: salt://vim/vimrc
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - makedirs: True
    - require:
      - pkg: vim
