xquery version "3.1";

declare namespace output="http://www.w3.org/2010/xslt-xquery-serialization";

import module namespace raddle="http://lagua.nl/lib/raddle";

let $params := map { "raddled" := "/db/apps/raddle/resources/raddled", "dict" := map {},"modules" := "/db/apps/raddle/resources/modules.xml","default-namespace-prefix":="core"}
let $query := request:get-parameter("q","")
let $input := request:get-parameter("i","")
let $input := 
    try {
        parse-json($input)
    } catch * {
        $input
    }
    
(:
let $parsed := raddle:parse($query)
let $dict := raddle:process($parsed,$params)
return serialize($dict,
<output:serialization-parameters>
    <output:method>json</output:method>
</output:serialization-parameters>)
:)
let $fn := raddle:transpile($query,$params)
return util:eval($fn)($input)