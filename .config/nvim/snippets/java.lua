local ls = require("luasnip")
local snippet = ls.snippet
local snippet_node = ls.snippet_node
local function_node = ls.function_node
local choice_node = ls.choice_node
local text_node = ls.text_node
local insert_node = ls.insert_node

local function filename_base()
	return vim.fn.expand("%:t:r")
end

ls.add_snippets("java", {
	snippet("nf", {
		function_node(function(_, snip)
			return "package "
				.. snip.env.RELATIVE_FILEPATH
					:gsub("^.*/main/java/(.+)/[a-zA-Z0-9]+.java", "%1")
					:gsub("^.*/test/java/(.+)/[a-zA-Z0-9]+.java", "%1")
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
		text_node(" "),
		function_node(filename_base, {}),
		choice_node(2, {
			text_node(""),
			snippet_node("implements", {
				text_node(" implements "),
				insert_node(1),
			}),
			snippet_node("extends", {
				text_node(" extends "),
				insert_node(1),
			}),
		}),
		text_node({ " {", "" }),
		text_node("\t"),
		insert_node(0),
		text_node({ "", "" }),
		text_node("}"),
	}),
	snippet("nfr", {
		function_node(function(_, snip)
			return "package "
				.. snip.env.RELATIVE_FILEPATH
					:gsub("^.*/main/java/(.+)/[a-zA-Z0-9]+.java", "%1")
					:gsub("^.*/test/java/(.+)/[a-zA-Z0-9]+.java", "%1")
					:gsub("/", ".")
				.. ";"
		end, {}),
		text_node({ "", "", "" }),
		text_node("public record "),
		function_node(filename_base, {}),
		text_node({ " {", "" }),
		text_node("\t"),
		insert_node(0),
		text_node({ "", ")" }),
		choice_node(1, {
			text_node(""),
			snippet_node("implements", {
				text_node(" implements "),
				insert_node(1),
			}),
		}),
		text_node(" {}")
	}),
})
