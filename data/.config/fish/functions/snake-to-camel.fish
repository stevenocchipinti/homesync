function snake-to-camel --description 'Convert snake-case to camel-case. Requires gsed'
  gsed "s/-\([a-z]\)/\\U\1/g"
end
