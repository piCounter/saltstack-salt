{% if grains['os_family'] == 'RedHat' %}
firewalld:
  pkg.installed:

firewalld_http:
  firewalld.rule:
    - name: allow_http
	- service: http
	- zone: public
	- permanent: True
	- state: enabled

firewalld_https:
  firewalld.rule:
    - name: allow_https
	- service: https
	- zone: public
	- permanent: True
	- state: enabled


{% else %}
ufw:
  pkg.installed

ufw_http:
  ufw.rule:
    - name: allow_http
	- proto: tcp
	- port: 80
	- action: allow

ufw_https:
  ufw.rule:
    - name: allow_http
	- proto: tcp
	- port: 80
	- action: allow

{% endif %}
