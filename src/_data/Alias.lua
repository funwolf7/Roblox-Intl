local proxy = setmetatable({ }, { __mode = "k", });
local hashes = setmetatable({ }, { __mode = "kv" });

local methods = {
	Resolve = function(self, data)
		local org_data = data;
		for path in proxy[self].path:gmatch('[^/]+') do
			if path ~= '' then
				if data[path ~= "[false]" and path] ~= nil then
					data = data[path ~= "[false]" and path];
				else
					error("Alias not found " .. proxy[self].path, 2);
				end;
			end;
		end;
		if proxy[data] then
			data = data:Resolve(org_data);
		end;
		if proxy[self].pre_resolved then
			local copy = { };
			for k, v in next, data do
				copy[k] = v;
			end;
			for k, v in next, proxy[self].pre_resolved do
				copy[k] = v;
			end;
			return copy;
		end;
		return data;
	end,
};

local function merge(a, b)
	if a and b then
		for k, v in next, a do
			b[k] = v;
		end;
	end;
	return b or a;
end;

local function new(path, pre_resolved)
	if hashes[path] and not pre_resolved then
		return hashes[path];
	end;
	local p = newproxy(true);
	getmetatable(p).__index = methods;
	
	if not pre_resolved then
		hashes[path] = p;
	end;
	proxy[p] = { path = proxy[path] and proxy[path].path or path, pre_resolved = merge(pre_resolved, proxy[path] and proxy[path].pre_resolved) };
	return p;
end;

return {
	new = new,
	isAlias = function(self)
		return not not proxy[self];
	end,
};