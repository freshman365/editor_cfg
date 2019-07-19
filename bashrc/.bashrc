# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

source /home/public_file/bashrc_file 

# export QUARTUS_ROOTDIR="/home/opt/intelFPGA_pro/18.1/quartus"
# export PATH=${QUARTUS_ROOTDIR}/bin:${PATH}


# alias quartuspro='/home/opt/intelFPGA_pro/18.1/quartus/bin/quartus'
# alias quartuspro_shell='/home/opt/intelFPGA_pro/18.1/embedded/embedded_command_shell.sh'


# common settings
alias g='gvim'
alias gc='gvim ~/.bashrc'
alias gv='gvim ~/.vimrc'
alias sc='source ~/.bashrc'
alias sl='~/software/sublime_text_3/sublime_text'
