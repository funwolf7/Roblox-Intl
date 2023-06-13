local function r(t, name)
	return require(script:WaitForChild(t):WaitForChild(name))
end;

return {
	dictionaries = {
		CJ = r("dictionaries", "cjdict"),
		Thai = r("dictionaries", "thaidict"),
		Lao = r("dictionaries", "laodict"),
		Khmer = r("dictionaries", "khmerdict"),
		Burmese = r("dictionaries", "burmesedict")
	},
	properties = {
		Grapheme_Cluster_Break = r("properties", "GraphemeBreakProperty"),
		Word_Break = r("properties", "WordBreakProperty"),
		Sentence_Break = r("properties", "SentenceBreakProperty"),
		Emoji = r("properties", "emoji-data"),
	}
};