hash = {}
hash.__index = hash

function hash:new(nRows, nCols)
	local h = {}
	h.loc = {}
	h.nRows = nRows
	h.nCols = nCols
	local total = nRows * nCols
	for i = 1, total do
		table.insert(h.loc, {})
	end
	return setmetatable(h, hash)
end

function hash:calcPos(row, col)
	return ((row - 1) * self.nRows) + col
end

function hash:add(t, row, col)
	local pos = self:calcPos(row, col)
	local index = #self.loc[pos] + 1
	self.loc[pos][index] = t
	return index
end

function hash:rem(row, col, pos)
	local p = self:calcPos(row, col)
	local t = self.loc[p][pos]
	self.loc[p][pos] = nil
	return t
end

function hash:update(oR, oC, pos, nR, nC)
	return self:add(self:rem(oR, oC, pos), nR, nC)
end

function hash:show(row, col)
	local pos = self:calcPos(row, col)
	return self.loc[pos]
end

return hash
