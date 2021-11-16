#Export Ssh Config
vagrant ssh-config | out-file default.config -encoding utf8
vagrant ssh-config > default.config
