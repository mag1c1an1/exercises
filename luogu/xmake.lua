function all_files()
	local res = {}
	for _, x in ipairs(os.files("**.cpp")) do
		local item = {}
		local s = path.filename(x)
		local xx = s:sub(1, #s - 4)
		table.insert(item, s:sub(1, #s - 4))
		table.insert(item, path.relative(x, "."))
		table.insert(res, item)
	end
	return res
end

for _, file in ipairs(all_files()) do
	target(file[1])
	set_kind("binary")
	add_files(file[2])
end
