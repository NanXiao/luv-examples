uv = require('luv')

local sigint = uv.new_signal()
uv.signal_start(sigint, "sigint", function()
	print('catch sigint')
	uv.signal_stop(sigint)
end)

uv.run()
uv.loop_close()
