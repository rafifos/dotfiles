function mktempd --wraps=mktemp --description 'Handy function to automagically switch to a temporary folder.'
    cd (mktemp -d)
end
