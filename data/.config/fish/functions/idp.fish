function idp
  for i in (rea-as saml | pecorb | xargs rea-as saml)
    set arr (echo $i |tr = \n)
      set -gx $arr[1] $arr[2]
  end

  if set -q AWS_ROLE
    echo "Role: $AWS_ROLE"
  else
    echo "Not authenticated"
  end
end
