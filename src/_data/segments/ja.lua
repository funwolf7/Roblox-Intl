--!nocheck
--!nolint

setinherit=require(script.Parent.Parent:WaitForChild("setinherit"))return{LineBreak={variables=setinherit({{"$ID","[[\\p{Line_Break=Ideographic}] [$CJ]]"},{"$NS","\\p{Line_Break=Nonstarter}"}}, 1)},WordBreak={variables=setinherit({{"$Hiragana","\\p{Hiragana}"},{"$Hiragana","($Hiragana $FE*)"},{"$Ideographic","[[\\p{Ideographic}] [々 〇 〻]]"},{"$Ideographic","($Ideographic $FE*)"}}, 1),segmentRules={['13.3']=" $Hiragana × $Hiragana ",['13.4']=" $Ideographic × $Ideographic "}}}