alias ap='ansible-playbook' 
alias rebuild='hcloud server rebuild --image=ubuntu-20.04 controller'
alias dfsd='df -h | head -n 1 && df -h | grep -i /dev/sd --color=none'
alias dfsdl='while true; do clear; dfsd; sleep 10; done'
alias fuck='sudo $(history -p \!\!)'

