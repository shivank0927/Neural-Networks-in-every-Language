require("math")
math.randomseed(os.time())

local INPUTS = 2
local HIDDEN_NODES = 2
local OUTPUTS = 1
local TRAINING = 4

local function init()
	return math.random()
end

print("random weight", init())

local function sigmoid(x)
	return (1 / (1 + math.exp(-x)))
end

local function derivative(x)
	return (x * (1 - x))
end

local function main()
	local rate = 0.1

	local hiddenLayer = {}
	local outputLayer = {}

	local hiddenLayerBias = {}
	local outputLayerBias = {}

	local hiddenWeights = {} -- 2D
	local outputWeights = {} -- 2D

	for i = 1, HIDDEN_NODES do
		hiddenLayer[i] = nil
		hiddenLayerBias[i] = nil
	end

	for i = 1, OUTPUTS do
		outputLayer[i] = nil
		outputLayerBias[i] = nil
	end

	for i = 1, INPUTS do
		hiddenWeights[i] = {}
		for j = 1, HIDDEN_NODES do
			hiddenWeights[i][j] = nil
		end
	end

	for i = 1, HIDDEN_NODES do
		outputWeights[i] = {}
		for j = 1, OUTPUTS do
			outputWeights[i][j] = nil -- 2D array
		end
	end

	-- training input/ output data (hard coded for now)

	local trainingInputs = { { 0.0, 0.0 }, { 1.0, 0.0 }, { 0.0, 1.0 }, { 1.0, 1.0 } }

	local trainingOutputs = { { 0.0 }, { 1.0 }, { 1.0 }, { 0.0 } }
end
