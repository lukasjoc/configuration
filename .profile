# oyeas sticking to bash for sure best $SHELL
if [ "$BASH" ]; then
	if [ -f $HOME/.bashrc ]; then
		source $HOME/.bashrc			
	fi
	if [ -f $HOME/perl5/perlbrew/etc/bashrc ]; then
		source $HOME/perl5/perlbrew/etc/bashrc
	fi
fi

# Shut up bro
mesg n || true
