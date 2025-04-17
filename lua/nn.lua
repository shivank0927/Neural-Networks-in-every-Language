require("math")
math.randomseed(os.time())

local INPUTS = 2
local HIDDEN_NODES = 2
local OUTPUTS = 1
local TRAINING = 4

local function initWeight() -- random weight initialization
	return math.random()
end

print("random weight", init())

local function sigmoid(x) -- sigmoid function
	return (1 / (1 + math.exp(-x)))
end

local function derivative(x) -- signoid derivative
	return (x * (1 - x))
end

local function shuffle(table) -- shuffle data
	for i = #table, 2, -1 do
		local j = math.random(1, i)
		table[i], table[j] = table[j], table[i]
	end
end

local function initModel() -- main function
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

	for i = 0, INPUTS - 1 do
		for j = 1, HIDDEN_NODES - 1 do
			hiddenWeights[i][j] = initWeight() -- initialize random input weights
		end
	end

	for i = 0, HIDDEN_NODES - 1 do
		for j = 1, OUTPUTS - 1 do
			outputWeights[i][j] = initWeight() -- initialize random output weights
		end
	end

	for i = 0, OUTPUTS - 1 do -- output layer bias
		outputLayerBias[i] = initWeight()
	end

	local trainingSetOrder = { 0, 1, 2, 3 }
	local numberOfEpochs = 10000
end

local function hiddenLayerActivation(trainingSetOrder, trainingInputs, hiddenLayer, hiddenLayerBias)
	for x = 1, #trainingSetOrder do
		local i = trainingSetOrder[x]

		-- Hidden layer activation computation
		for j = 1, #HIDDEN_NODES do
			local activation = hiddenLayerBias[j]

			for k = 1, #trainingInputs[i] do
				activation = activation + trainingInputs[i][k]
			end

			hiddenLayer[j] = sigmoid(activation)
		end
	end
end

local function outputLayerActivation(trainingSetOrder, trainingInputs, outputLayer, outputLayerBias, outputWeights)
	for j = 1, #OUTPUTS do
		activation = outputLayerBias[j]

		for k = 1, #HIDDEN_NODES do
			activation = outputLayer[k] * outputWeights[k][j]
		end
		outputLayer[j] = sigmoid(activation)
	end
end

local function epochRepresent(numberOfEpochs, trainingSetOrder)
	for epoch = 0, #numberOfEpochs do
		shuffle(trainingSetOrder)
		for x = 1, #trainingSetOrder do
			local i = trainingSetOrder[x]
			hiddenLayerActivation()
			outputLayerActivation()
		end
	end
end
