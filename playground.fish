#!/usr/bin/env fish

## https://developerlife.com/2021/01/19/fish-scripting-manual/

# if test $(uname -m) = "x86"
#   echo "arm"
# else
#   echo "intel"
# end

echo "--------------"
echo

# set un $(uname -m)

switch $(uname -m)
case "arm*"
  set arch arm
case "x86*"
  set arch intel
case "*"
  # not setting arch -> will throw exception where it is being used
  echo "!!!!!!!!Unknown architecture: $un May wan to check fish config"
end


if test $arch = "intel"
  echo "Arch is intel"
end

if test $arch = "arm"
  echo "Arch is arm"
end


echo 

