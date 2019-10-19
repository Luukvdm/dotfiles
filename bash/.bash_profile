#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

# do not edit this file. put files in the dir below.
#source ~/.bashrc
for FN in $HOME/.bash_profile.d/*.sh ; do
    source "$FN"
done


# do not edit this file. put files in the dir below.
#for FN in $HOME/.bashrc.d/*.sh ; do
#    source "$FN"
#done
