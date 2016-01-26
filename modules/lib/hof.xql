xquery version "3.1";

module namespace hof="http://lagua.nl/lib/hof";

declare function hof:unfold($init, $unspool, $cond, $r) {
    if($cond($init)) then
        $r
    else
        hof:unfold($unspool($init), $unspool, $cond, array:append($r, $init))
};

declare function hof:unfold($init, $unspool, $cond, $handler, $appender, $index, $r) {
    (:
		// unspool prepares the next seed value
		// cond is tested for a stop condition
		// handler transforms the value to add
		// index retrieves the index of the value to add
		// appender specifies how the index is inserted into the result
    :)
    if($cond($init)) then
        $r
    else
        hof:unfold($unspool($init), $unspool, $cond, $handler, $appender, $index, $appender($r,$index($init),$handler($init)))
};