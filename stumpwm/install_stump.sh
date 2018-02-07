sbcl --non-interactive --eval "(ql:quickload \"stumpwm\")" &> /dev/null
if [ $? -eq 0 ]
then
    echo "stumpwm is already installed"
else
    curl http://beta.quicklisp.org/quicklisp.lisp > /tmp/quicklisp.lisp
    sbcl --non-interactive --load /tmp/quicklisp.lisp --eval "(quicklisp-quickstart:install)" --eval "(ql:add-to-init-file)"
    sbcl --non-interactive --eval "(ql:quickload \"stumpwm\")"
fi
