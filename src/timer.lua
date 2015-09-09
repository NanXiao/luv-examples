uv = require('luv')

local count = 0
local timer = uv.new_timer()
local function ontimeout()
	count = count + 1
	print(count)
	if count == 3 then
		print("Repeat is:", uv.timer_get_repeat(timer))
	elseif count == 5 then
		uv.timer_again(timer)
	elseif count == 7 then
		uv.timer_set_repeat(timer, 3000)
	elseif count == 10 then
		print("Exit now")
		uv.timer_stop(timer)
		uv.close(timer)
	end
end

uv.timer_start(timer, 1000, 2000, ontimeout)

uv.run()
uv.loop_close()
