function camel-to-snake --description 'Convert camel-case to snake-case. Requires gsed'
  gsed "s/\([A-Z]\)/\-\L\1/g"
end
