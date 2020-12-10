function idp
  set -x REA_AS_MFA_METHOD OKTA_PUSH
  for i in (rea-as okta | pecorb | xargs rea-as okta)
    set arr (echo $i |tr = \n)
      set -gx $arr[1] $arr[2]
  end

  if set -q AWS_ROLE
    echo "Role: $AWS_ROLE"
  else
    echo "Not authenticated"
  end
end
