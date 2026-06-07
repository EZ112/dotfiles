local M = {}

function M.apply_rules(method, rules)
	for _, rule in ipairs(rules) do
		method(rule)
	end
end

function M.apply_all_rules(rules)
	for _, r in ipairs(rules) do
		M.apply_rules(table.unpack(r))
	end
end

function M.apply_all_binds(binds)
	for _, b in ipairs(binds) do
		hl.bind(table.unpack(b))
	end
end

return M
