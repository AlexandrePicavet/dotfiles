local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local f = ls.function_node
local c = ls.choice_node
local t = ls.text_node
local i = ls.insert_node

local function package()
	return "package "
		.. vim.fn.expand("%:p:h")
			:gsub("^.*/main/java/(.+)", "%1")
			:gsub("^.*/test/java/(.+)", "%1")
			:gsub("/", ".")
		.. ";"
end

local function classname()
	return vim.fn.expand("%:t:r")
end

ls.add_snippets("java", {
	s("nf", {
		f(package, {}),
		t({ "", "", "public " }),
		c(1, { t("class"), t("enum"), t("interface"), t("abstract class"), t("final class") }),
		t(" "),
		f(classname, {}),
		c(2, {
			t(""),
			sn("implements", { t(" implements "), i(1, "Interface") }),
			sn("extends", { t(" extends "), i(1, "Class") }),
		}),
		t({ " {", "" }),
		t("\t"),
		i(0),
		t({ "", "" }),
		t("}"),
	}),
	s("nfr", {
		f(package, {}),
		t({ "", "", "public record " }),
		f(classname, {}),
		t({ " (", "\t" }),
		i(0),
		t({ "", ")" }),
		c(1, {
			t(""),
			sn("implements", { t(" implements "), i(1, "Interface") }),
		}),
		t(" {}"),
	}),
})
