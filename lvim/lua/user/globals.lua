-- Global functions, do not abuse

AHI = function(inspectable)
  print(vim.inspect(inspectable))
  return inspectable
end

AHRELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

AHR = function(name)
  AHRELOAD(name)
  return require(name)
end

AHRA = function(plugin)
  local regex = "^" .. plugin
  for k in pairs(package.loaded) do
    if k:match(regex) then
      print("Dumping " .. k)
      package.loaded[k] = nil
    end
  end
  return require(plugin)
end
