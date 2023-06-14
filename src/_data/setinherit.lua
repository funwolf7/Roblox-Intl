--!nocheck

--[=[
	0: No inherit
	1: Inherit merge
]=]
--
return setmetatable({}, {
	__call = function(self, list, ttype)
		self[list] = ttype
		return list
	end,
	__mode = "k",
})
