
which root >/dev/null 2>&1 || return

alias root='root -l'

if [[ -d /usr/local/root ]]; then
    if ! echo ${PATH} | grep -q 'root'; then
        export ROOTSYS=/usr/local/root
        export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:${ROOTSYS}/lib
        pathmunge ${ROOTSYS}/bin
    fi
fi

