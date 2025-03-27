-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Salesforce Group
map("n", "<leader>o", "", { desc = "Salesforce" })
-- Salesforce Push Current File
map("n", "<leader>op", ":SF currentFile push<CR>", { desc = "Push current file to org" })
-- Salesforce diff current file
map("n", "<leader>od", ":SF currentFile diff<CR>", { desc = "Diff current file in org" })
-- Salesforce diff current file in other org
map("n", "<leader>od", ":SF currentFile diff<CR>", { desc = "Diff current file in other org" })
-- Salesforce Retrieve current file
map("n", "<leader>or", ":SF currentFile retrieve<CR>", { desc = "Retrieve current file from org" })
-- Salesforce execute file in anonymous apex
map("n", "<leader>oe", ":SF currentFile RunAsAnonymous<CR>", { desc = "Execute current file in anonymous apex" })
-- Salesforce Test Commands Group
map("n", "<leader>ot", "", { desc = "Test Salesforce commands" })
-- Salesforce run all tests in org
map("n", "<leader>oto", ":SF test allTestsInOrg<CR>", { desc = "Run all tests in org" })
-- Salesforce run all tests in current file
map("n", "<leader>otf", ":SF test allTestsInThisFile<CR>", { desc = "Run all tests in current file" })
-- Salesforce run test under cursor
map("n", "<leader>otc", ":SF test currentTest<CR>", { desc = "Run test under cursor" })
-- Salesforce select test methods to run from file
map("n", "<leader>ots", ":SF test select<CR>", { desc = "Select test methods to run from file" })
-- Salesforce Org commands group
map("n", "<leader>oo", "", { desc = "Org commands" })
-- Salesforce fetch org list
map("n", "<leader>oof", ":SF org fetchList<CR>", { desc = "Fetch org list" })
-- Salesforce set target org
map("n", "<leader>oos", ":SF org setTarget<CR>", { desc = "Set target org" })
-- Salesforce open org in browser
map("n", "<leader>ooo", ":SF org open<CR>", { desc = "Open org in Browser" })
-- Salesforce pull logs
map("n", "<leader>oop", ":SF org pullLogs<CR>", { desc = "Pull logs from org" })
-- Toggle Salesforce Pluggin terminal
map("n", "<leader><leader>", ":SF term toggle<CR>", { desc = "Toggle Salesforce Pluggin terminal" })
