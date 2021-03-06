Red [Needs: View]
ws: charset reduce [space newline tab]
rule: [some [
	remove [
		"<script" thru "script>" 
	| 	"<style" thru "style>" 
	| 	#"<" thru #">"
	] 
| 	change "&nbsp;" #" "
| 	change "&amp;" #"&"
| 	change ["&#" s: to [e: #";"]] (to-char to-integer copy/part s e) 
| 	skip
]]
view [
	below 
	field 400 on-enter [
		parse tx: read face/data rule
		parse tx [some [2 newline change [newline some ws] newline | skip]]
		ar/text: tx
	] 
	ar: area 400x400 wrap
]
