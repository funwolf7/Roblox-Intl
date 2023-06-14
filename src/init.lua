--!strict

--Version 1.0.0

--[=[
	BSD 2-Clause Licence

	Copyright ©, 2023 - funwolf7
	All rights reserved.

	Copyright ©, 2020 - Blockzez (devforum.roblox.com/u/Blockzez and github.com/Blockzez)
	All rights reserved.

	Redistribution and use in source and binary forms, with or without
	modification, are permitted provided that the following conditions are met:

	1. Redistributions of source code must retain the above copyright notice, this
	   list of conditions and the following disclaimer.

	2. Redistributions in binary form must reproduce the above copyright notice,
	   this list of conditions and the following disclaimer in the documentation
	   and/or other materials provided with the distribution.

	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
	AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
	IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
	DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
	FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
	DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
	SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
	CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
	OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
	OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
]=]

export type PartOfFormat = {
	type: string,
	value: string,
}
export type Date = { [string]: number } | number | DateTime

type ResolvedOptions<T> = (self: T) -> { [string]: any }

type options = { [string]: any }

export type CanBeLocales = string | Locale | { string | Locale }
export type MustBeLocales = Locale | { Locale }
export type LooseNumber = number | string
export type StrictNumber = number | string

export type DateTimeFormat = {
	Format: (self: DateTimeFormat, date: Date) -> string,
	FormatToParts: (self: DateTimeFormat, date: Date) -> { PartOfFormat },
	FormatRange: (self: DateTimeFormat, date0: Date, date1: Date) -> string,
	FormatRangeToParts: (self: DateTimeFormat, date0: Date, date1: Date) -> { PartOfFormat },
	ResolvedOptions: ResolvedOptions<DateTimeFormat>,
}
export type DisplayNames = {
	Of: (self: DisplayNames, code: CanBeLocales) -> string?,
	ResolvedOptions: ResolvedOptions<DisplayNames>,
}
export type ListFormat = {
	Format: (self: ListFormat, list: { string }) -> string,
	FormatToParts: (self: ListFormat, list: { string }) -> { PartOfFormat },
	ResolvedOptions: ResolvedOptions<ListFormat>,
}
export type Locale = {
	Minimize: (self: Locale) -> Locale,
	Maximize: (self: Locale) -> Locale,
	GetVariants: (self: Locale) -> { Locale },

	language: string,
	script: string?,
	region: string?,
	variants: { string },
}
export type NumberFormat = {
	Format: (self: NumberFormat, num: LooseNumber) -> string,
	FormatToParts: (self: NumberFormat, num: LooseNumber) -> { PartOfFormat },
	FormatRange: (self: NumberFormat, num0: LooseNumber, num1: LooseNumber) -> string,
	FormatRangeToParts: (self: NumberFormat, num0: LooseNumber, num1: LooseNumber) -> { PartOfFormat },
	ResolvedOptions: ResolvedOptions<NumberFormat>,
}
export type PluralRules = {
	Select: (self: PluralRules, num: LooseNumber) -> string,
	SelectRange: (self: PluralRules, num0: LooseNumber, num1: LooseNumber) -> string,
	All: (self: PluralRules) -> { string },
	ResolvedOptions: ResolvedOptions<PluralRules>,
}
export type RelativeTimeFormat = {
	Format: (self: RelativeTimeFormat, num: StrictNumber, unit: string) -> string,
	FormatToParts: (self: RelativeTimeFormat, num: StrictNumber, unit: string) -> { PartOfFormat },
	ResolvedOptions: ResolvedOptions<RelativeTimeFormat>,
}
export type Segmenter = {
	Segment: (self: RelativeTimeFormat, text: string) -> (() -> (number, string)),
	Split: (self: RelativeTimeFormat, text: string) -> { string },
	ResolvedOptions: ResolvedOptions<Segmenter>,
}

type Entry<R> = {
	new: (locales: CanBeLocales, options: options?) -> R,
	supportedLocalesOf: (locales: CanBeLocales) -> { Locale },
}

type lib = {
	DateTimeFormat: Entry<DateTimeFormat>,
	DisplayNames: Entry<DisplayNames>,
	ListFormat: Entry<ListFormat>,
	Locale: {
		new: (locales: CanBeLocales, options: options?) -> Locale,
		GetLocale: () -> Locale,
		SetLocale: (locales: MustBeLocales) -> (),
	},
	NumberFormat: Entry<NumberFormat>,
	PluralRules: Entry<PluralRules>,
	RelativeTimeFormat: Entry<RelativeTimeFormat>,
	Segmenter: Entry<Segmenter>,

	toLocaleString: (value: any, locales: CanBeLocales, options: options) -> string,
	toLocaleDateString: (value: any, locales: CanBeLocales, options: options) -> string,
	toLocaleTimeString: (value: any, locales: CanBeLocales, options: options) -> string,

	toLocaleUpper: (value: StrictNumber, locales: CanBeLocales) -> string,
	toLocaleLower: (value: StrictNumber, locales: CanBeLocales) -> string,
	toLocaleTitle: (value: StrictNumber, locales: CanBeLocales) -> string,

	getCanonicalLocales: (locales: CanBeLocales) -> { string },
	getType: (data: any) -> string?,

	testFormat: (locales: CanBeLocales) -> string,
	extendedTestFormat: (locales: CanBeLocales) -> string,
}

local main: any = require(script:WaitForChild("main"))

return main :: lib
