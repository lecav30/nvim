-- local config = {
-- 	api_host_cmd = 'echo -n ""',
-- 	api_key_cmd = "pass azure-openai-key",
-- 	api_type_cmd = "echo azure",
-- 	azure_api_base_cmd = "echo https://{your-resource-name}.openai.azure.com",
-- 	azure_api_engine_cmd = "echo chat",
-- 	azure_api_version_cmd = "echo 2023-05-15",
-- }

local home = vim.fn.expand("$HOME")

require("chatgpt").setup({
	api_key_cmd = "gpg --decrypt " .. home .. "/secret.txt.gpg",
	model = "gpt-3.5-turbo",
})
