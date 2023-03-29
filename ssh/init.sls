install_ssh:
  pkg.installed:
    - ssh

push_ssh_conf:
  file.managed:
    - name: /etc/ssh/ssh_config
	- source: salt://ssh/files/ssh_config

push_sshd_conf:
  file.managed:
    - name: /etc/ssh/ssh_config
	- source: salt://ssh/files/sshd_config

start_sshd:
  service.running:
    - name: sshd
	- enable: True
