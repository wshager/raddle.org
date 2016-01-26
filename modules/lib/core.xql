xquery version "3.1";

module namespace core="http://raddle.org/core";

import module namespace op="http://www.w3.org/2005/xpath-functions/op" at "/db/apps/raddle/modules/lib/op.xql";
import module namespace n="http://raddle.org/n" at "/db/apps/raddle/modules/lib/n.xql";

declare function core:elem($name,$content){
    n:element($name,$content)
};

declare function core:attr($name,$content){
    n:attribute($name,$content)
};

declare function core:cat($a1,$a2){
    concat($a1,$a2)
};


declare function core:cat($a1,$a2,$a3){
    concat($a1,$a2,$a3)
};

declare function core:fold-left($a1,$a2,$a3){
    array:fold-left($a1,$a2,$a3)
};

declare function core:add($a1,$a2){
    op:add($a1,$a2)
};