local ls = require("luasnip")
local snippet = ls.snippet
local function_node = ls.function_node
local choice_node = ls.choice_node
local text_node = ls.text_node
local insert_node = ls.insert_node

ls.add_snippets("java", {
	snippet("nf", {
		function_node(function(_, snip)
			return "package "
				.. snip.env.RELATIVE_FILEPATH
					:gsub("^[a-zA-Z]+/[a-zA-Z]+/[a-zA-Z]+/(.+)/[a-zA-Z]+.java", "%1")
					:gsub("/", ".")
				.. ";"
		end, {}),
		text_node({ "", "", "" }),
		text_node("public "),
		choice_node(1, {
			text_node("class"),
			text_node("enum"),
			text_node("interface"),
			text_node("abstract class"),
			text_node("final class"),
		}),
		function_node(function(_, snip)
			return " " .. snip.env.TM_FILENAME_BASE .. " {"
		end, {}),
		text_node({ "", "" }),
		text_node("\t"),
		insert_node(0),
		text_node({ "", "" }),
		text_node("}"),
	}),
})
