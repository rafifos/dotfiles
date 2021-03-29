function npmup --description "Updates npm on all Node.js installations managed by asdf-vm"
    for ver in ~/.asdf/installs/nodejs/*/bin
        cd $ver

        test -f ../.npm/bin/npm; and ln -nfs ../.npm/bin/npm npm; and ln -nfs ../.npm/bin/npx npx
    end
end
