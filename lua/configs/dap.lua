local dap = require('dap')

dap.configurations.pythoon = {
  type = 'python';
  request= 'launch';
  name = "Launch file";
  progra = "${file}";
  pythonPath = function()
    return '/usr/bin/python'
  end
}
